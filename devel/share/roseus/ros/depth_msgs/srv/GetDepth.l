;; Auto-generated. Do not edit!


(when (boundp 'depth_msgs::GetDepth)
  (if (not (find-package "DEPTH_MSGS"))
    (make-package "DEPTH_MSGS"))
  (shadow 'GetDepth (find-package "DEPTH_MSGS")))
(unless (find-package "DEPTH_MSGS::GETDEPTH")
  (make-package "DEPTH_MSGS::GETDEPTH"))
(unless (find-package "DEPTH_MSGS::GETDEPTHREQUEST")
  (make-package "DEPTH_MSGS::GETDEPTHREQUEST"))
(unless (find-package "DEPTH_MSGS::GETDEPTHRESPONSE")
  (make-package "DEPTH_MSGS::GETDEPTHRESPONSE"))

(in-package "ROS")





(defclass depth_msgs::GetDepthRequest
  :super ros::object
  :slots (_x _y ))

(defmethod depth_msgs::GetDepthRequest
  (:init
   (&key
    ((:x __x) 0)
    ((:y __y) 0)
    )
   (send-super :init)
   (setq _x (round __x))
   (setq _y (round __y))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:serialization-length
   ()
   (+
    ;; uint16 _x
    2
    ;; uint16 _y
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint16 _x
       (write-word _x s)
     ;; uint16 _y
       (write-word _y s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint16 _x
     (setq _x (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _y
     (setq _y (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(defclass depth_msgs::GetDepthResponse
  :super ros::object
  :slots (_depth ))

(defmethod depth_msgs::GetDepthResponse
  (:init
   (&key
    ((:depth __depth) 0)
    )
   (send-super :init)
   (setq _depth (round __depth))
   self)
  (:depth
   (&optional __depth)
   (if __depth (setq _depth __depth)) _depth)
  (:serialization-length
   ()
   (+
    ;; uint32 _depth
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _depth
       (write-long _depth s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _depth
     (setq _depth (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass depth_msgs::GetDepth
  :super ros::object
  :slots ())

(setf (get depth_msgs::GetDepth :md5sum-) "80c391de64e31f65e6c6d950defb26e1")
(setf (get depth_msgs::GetDepth :datatype-) "depth_msgs/GetDepth")
(setf (get depth_msgs::GetDepth :request) depth_msgs::GetDepthRequest)
(setf (get depth_msgs::GetDepth :response) depth_msgs::GetDepthResponse)

(defmethod depth_msgs::GetDepthRequest
  (:response () (instance depth_msgs::GetDepthResponse :init)))

(setf (get depth_msgs::GetDepthRequest :md5sum-) "80c391de64e31f65e6c6d950defb26e1")
(setf (get depth_msgs::GetDepthRequest :datatype-) "depth_msgs/GetDepthRequest")
(setf (get depth_msgs::GetDepthRequest :definition-)
      "uint16 x       #the image x coordinate of a pixe (0-847)
uint16 y       #the image y coordinate of a pixel (0-479)
---
uint32 depth   #the depth in mm of the object located at the pixel

")

(setf (get depth_msgs::GetDepthResponse :md5sum-) "80c391de64e31f65e6c6d950defb26e1")
(setf (get depth_msgs::GetDepthResponse :datatype-) "depth_msgs/GetDepthResponse")
(setf (get depth_msgs::GetDepthResponse :definition-)
      "uint16 x       #the image x coordinate of a pixe (0-847)
uint16 y       #the image y coordinate of a pixel (0-479)
---
uint32 depth   #the depth in mm of the object located at the pixel

")



(provide :depth_msgs/GetDepth "80c391de64e31f65e6c6d950defb26e1")


