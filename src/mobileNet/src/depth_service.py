#!/usr/bin/env python

import rospy
import numpy as np
from sensor_msgs.msg import Image
from std_msgs.msg import Int32
from cv_bridge import CvBridge
from mobileNet.srv import GetDepth, GetDepthResponse

class DepthInfo():
    def __init__(self):
        self.bridge = CvBridge()
        self.np_matrix = None
        self.img_height = 480
        self.img_width = 848
    
    def get_depth(self, req):
        cv2_x = req.x
        cv2_y = req.y
        response = GetDepthResponse()

        if ((cv2_x < 0) or (cv2_y < 0) or (cv2_x >= self.img_width) or (cv2_y >= self.img_height)):
            response.depth = -1
        else:
            response.depth = self.np_matrix[cv2_y,cv2_x]
        
        return response

    def callback(self, msg):
        height = msg.height
        width = msg.width
        
        np_image = self.bridge.imgmsg_to_cv2(msg)
        self.np_matrix = np_image
        self.img_height = height
        self.img_width = width

        rospy.loginfo('{} {}'.format(height, width))

def main():
    rospy.init_node('depth_server')
    depthObj = DepthInfo()
    rospy.Subscriber('/camera/depth/image_rect_raw', Image, depthObj.callback)
    serv = rospy.Service('get_depth', GetDepth, depthObj.get_depth)
    rospy.spin()

if __name__ == "__main__":
    main()
