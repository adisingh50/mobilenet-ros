import jetson.inference
import jetson.utils
import numpy as np
import cv2

class SegNet:
    def __init__(self):
        # Initialize the network model and class thresholds
        self.net = net = jetson.inference.segNet("fcn-resnet18-voc-512x320")

        self.person_filter = np.array([0,85,192])
        self.person_lower_bound = np.array([-50,35,142])
        self.person_upper_bound = np.array([50,135,242])

        self.chair_filter = np.array([150,21,180])
        self.chair_lower_bound = np.array([100,-31,130])
        self.chair_upper_bound = np.array([200,71,230])


    def getCentroid(self, crop, classID):
        
        # Format BGR image to CUDA format
        cv2_img_rgb = cv2.cvtColor(crop, cv2.COLOR_BGR2RGB)
        jetson.utils.cudaDeviceSynchronize()
        cuda_img = jetson.utils.cudaFromNumpy(cv2_img_rgb)

        #Feed into SegNet
        width = crop.shape[1]
        height = crop.shape[0]
        self.net.Process(cuda_img, width, height)
        self.net.Mask(cuda_img, width, height)

        #convert CUDA image back into BGR format
        jetson.utils.cudaDeviceSynchronize()
        np_img_rgb = jetson.utils.cudaToNumpy(cuda_img)
        np_img_bgr = cv2.cvtColor(np_img_rgb, cv2.COLOR_RGB2BGR)

        # Choose the appropriate color filter for binary mask
        if (classID == 1):
            lower_bound = self.person_lower_bound
            upper_bound = self.person_upper_bound
        else:
            lower_bound = self.chair_lower_bound
            upper_bound = self.chair_upper_bound

        # Convert BGR to HSV format and apply binary mask.
        hsv = cv2.cvtColor(np_img_bgr, cv2.COLOR_BGR2HSV)
        mask = cv2.inRange(hsv,lower_bound, upper_bound)

        # Find Largest Contour and find centroid of that.
        contours, hierarchy = cv2.findContours(mask, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_NONE)
        mainContour = max(contours, key=cv2.contourArea)
        M = cv2.moments(mainContour)

        # Calculate centroid and return.
        if (M['m00'] != 0):
            cX = int(M['m10']/M['m00'])
            cY = int(M['m01']/M['m00'])
        else:
            cX, cY = 0, 0
        
        return mask, (cX, cY) #temp change to return type
