#!/usr/bin/env python

import rospy
import numpy as np
from sensor_msgs.msg import Image
from std_msgs.msg import Int32
from cv_bridge import CvBridge
from mobileNet.srv import GetDepth, GetDepthRequest
import jetson.inference
import jetson.utils
import cv2

net = jetson.inference.detectNet("ssd-mobilenet-v2", threshold=0.5)

class ImageInfo():
    def __init__(self):
        self.bridge = CvBridge()
        self.img_height = 0
        self.img_width = 0
        self.blueColor = (255,0,0)
        self.thickness = 2
        self.fontScale = 0.7
        self.font = cv2.FONT_HERSHEY_SIMPLEX
        self.get_pixel_depth = rospy.ServiceProxy('get_depth', GetDepth)

        with open('./ssd_coco_labels.txt', 'r') as f:
            self.classes = f.read().splitlines()


    def drawBoundingBox(self, img, detection):
        classID = detection.ClassID
        conf = detection.Confidence
        center = detection.Center
        width = int(detection.Width)
        height = int(detection.Height)

        topLeft_x = int(center[0] - (width/2))
        topLeft_y = int(center[1] - (height/2))
        box_label = '{}:{}'.format(self.classes[classID], round(conf,2))

        req = GetDepthRequest(int(center[0]), int(center[1]))
        resp = self.get_pixel_depth(req)
        depth = resp.depth / 1000.0
        depthLabel = '{}m'.format(depth)

        cv2.rectangle(img, (topLeft_x, topLeft_y), (topLeft_x + width, topLeft_y + height), self.blueColor, self.thickness) #draw bounding box
        cv2.rectangle(img, (int(center[0])-2, int(center[1])-2), (int(center[0])+2, int(center[1])+2), self.blueColor, self.thickness) #draw bounding box
        cv2.putText(img, box_label, (topLeft_x, topLeft_y+20), self.font, self.fontScale, self.blueColor, self.thickness) #draw class: conf
        cv2.putText(img, depthLabel, (topLeft_x, topLeft_y+40), self.font, self.fontScale, self.blueColor, self.thickness) #draw depth in meters
        return img

    def callback(self, msg):
        height = msg.height
        width = msg.width

        rospy.loginfo('{} {}'.format(width, height))

        np_image_bgr = self.bridge.imgmsg_to_cv2(msg)
        np_image_rgb = cv2.cvtColor(np_image_bgr, cv2.COLOR_BGR2RGB)
        cuda_img = jetson.utils.cudaFromNumpy(np_image_rgb)
        
        detections = net.Detect(cuda_img)
        jetson.utils.cudaDeviceSynchronize()

        for detection in detections:
            np_image_rgb = self.drawBoundingBox(np_image_rgb, detection)

        cv2.imshow('CV2 Capture', np_image_rgb)
        keyPress = cv2.waitKey(1)

def main():
    rospy.init_node('mobileNet_client')
    imgObj = ImageInfo()
    rospy.Subscriber('/camera/color/image_raw', Image, imgObj.callback)

    rospy.spin()

if __name__ == "__main__":
    main()
