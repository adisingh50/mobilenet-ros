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
import math
from rollavg import RollingAverage

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

        self.fx = 1.93 #focal length of Intel D435i camera in mm
        self.mm_pix = 0.003 # width of a pixel is .003 mm
        self.img_center = (640, 360) #center of the image plane is (640, 360)
        self.factor_scale = 1.509 #ratio between color matrix  dims and depth matrix dims

        self.ra_track = RollingAverage()

        with open('./ssd_coco_labels.txt', 'r') as f:
            self.classes = f.read().splitlines()

    def deproject_cam_coords(self, obj_center, depth):
        u_pixel = obj_center[0]
        v_pixel = obj_center[1]
        
        x_plane = self.mm_pix * (u_pixel - self.img_center[0])
        y_plane = self.mm_pix * (self.img_center[1] - v_pixel)

        #calc y coord
        y_coord = (depth * y_plane) / math.sqrt(y_plane**2 + (x_plane**2 + self.fx**2))
        
        #calc x coord
        if (y_coord == 0):
            x_coord = depth * (x_plane / math.sqrt(x_plane**2 + self.fx**2))
        else:
            x_coord = y_coord * (x_plane / y_plane)
        
        #calc z coord
        if(x_coord == 0 and y_coord == 0):
            z_coord = depth
        elif(x_coord == 0):
            z_coord = math.sqrt(depth**2 - y_coord**2)
        elif(y_coord == 0):
            z_coord = math.sqrt(depth**2 - x_coord**2)
        else:
            z_coord = x_coord * (self.fx / x_plane)
        
        arr = [x_coord, y_coord, z_coord]
        print(arr)
        #return [x_coord, y_coord, z_coord]

    def getDepthFromNeighborPixels(self, center):
        radius = 5
        depthsArr = []

        #center query
        center_x_scaled = int(center[0] / self.factor_scale)
        center_y_scaled = int(center[1] / self.factor_scale)
        center_req = GetDepthRequest(center_x_scaled, center_y_scaled)
        center_depth = self.get_pixel_depth(center_req) #in mm
        depthsArr.append(center_depth.depth)

        #north point query
        if (center[1] >= radius):
            north_x_scaled = int(center[0] / self.factor_scale)
            north_y_scaled = int((center[1] - radius) / self.factor_scale)
            north_req = GetDepthRequest(north_x_scaled, north_y_scaled)
            north_depth = self.get_pixel_depth(north_req) #in mm
            depthsArr.append(north_depth.depth)

        #east point query
        if (center[0] + radius < 1280):
            east_x_scaled = int((center[0] + radius) / self.factor_scale)
            east_y_scaled = int(center[1] / self.factor_scale)
            east_req = GetDepthRequest(east_x_scaled, east_y_scaled)
            east_depth = self.get_pixel_depth(north_req) #in mm
            depthsArr.append(east_depth.depth)

        #south point query
        if (center[1] + radius < 720):
            south_x_scaled = int(center[0] / self.factor_scale)
            south_y_scaled = int((center[1] + radius) / self.factor_scale)
            south_req = GetDepthRequest(south_x_scaled, south_y_scaled)
            south_depth = self.get_pixel_depth(south_req) #in mm
            depthsArr.append(south_depth.depth)

        #west point query
        if (center[0] >= radius):
            west_x_scaled = int((center[0] - radius) / self.factor_scale)
            west_y_scaled = int(center[1] / self.factor_scale)
            west_req = GetDepthRequest(west_x_scaled, west_y_scaled)
            west_depth = self.get_pixel_depth(west_req) #in mm
            depthsArr.append(west_depth.depth)

        depthsArr.sort()
        midIndex = len(depthsArr)/2
        length = len(depthsArr)

        median = 0
        if (length % 2 == 0):
            median = (depthsArr[midIndex-1] + depthsArr[midIndex])/2
        else:
            median = depthsArr[midIndex]

        return median

    def drawBoundingBox(self, img, detection):
        
        #unpack detection object to get info about bounding box
        classID = detection.ClassID
        conf = detection.Confidence
        center = detection.Center
        width = int(detection.Width)
        height = int(detection.Height)

        #get top left coords and box label
        topLeft_x = int(center[0] - (width/2))
        topLeft_y = int(center[1] - (height/2))
        box_label = '{}:{}'.format(self.classes[classID], round(conf,2))

        x_depth_scaled = int(center[0] / self.factor_scale)
        y_depth_scaled = int(center[1] / self.factor_scale)

        req = GetDepthRequest(x_depth_scaled, y_depth_scaled)
        resp = self.get_pixel_depth(req)
        depth = resp.depth / 1000.0
        depthLabel = '{}m'.format(depth)

        #get coords wrt camera (only print coords for person)
        if (classID == 1):
            pass
            #self.deproject_cam_coords(center, resp.depth)
            depth = self.getDepthFromNeighborPixels(center)
            
            self.ra_track.addDepth(depth)
            acc_depth = self.ra_track.getDepth()
            print(acc_depth)

            if (acc_depth > 0):   #only render depth if the reading is valid
                depthLabel = '{}m'.format(acc_depth/1000.0)
                cv2.putText(img, depthLabel, (topLeft_x, topLeft_y+40), self.font, self.fontScale, self.blueColor, self.thickness) #draw depth in meters

        #draw all info on cv2 display
        cv2.rectangle(img, (topLeft_x, topLeft_y), (topLeft_x + width, topLeft_y + height), self.blueColor, self.thickness) #draw bounding box
        cv2.rectangle(img, (int(center[0])-2, int(center[1])-2), (int(center[0])+2, int(center[1])+2), self.blueColor, self.thickness) #draw midpoint of bounding box
        cv2.putText(img, box_label, (topLeft_x, topLeft_y+20), self.font, self.fontScale, self.blueColor, self.thickness) #draw class: conf
        #cv2.putText(img, depthLabel, (topLeft_x, topLeft_y+40), self.font, self.fontScale, self.blueColor, self.thickness) #draw depth in meters
        return img

    def callback(self, msg):
        height = msg.height
        width = msg.width

        #rospy.loginfo('{} {}'.format(width, height))

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
