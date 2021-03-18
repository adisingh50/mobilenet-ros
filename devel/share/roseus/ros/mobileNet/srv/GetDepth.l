;; Auto-generated. Do not edit!


(when (boundp 'mobileNet::GetDepth)
  (if (not (find-package "MOBILENET"))
    (make-package "MOBILENET"))
  (shadow 'GetDepth (find-package "MOBILENET")))
(unless (find-package "MOBILENET::GETDEPTH")
  (make-package "MOBILENET::GETDEPTH"))
(unless (find-package "MOBILENET::GETDEPTHREQUEST")
  (make-package "MOBILENET::GETDEPTHREQUEST"))
(unless (find-package "MOBILENET::GETDEPTHRESPONSE")
  (make-package "MOBILENET::GETDEPTHRESPONSE"))

(in-package "ROS")





(defclass mobileNet::GetDepthRequest
  :super ros::object
  :slots (_x _y ))

(defmethod mobileNet::GetDepthRequest
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
    ;; int16 _x
    2
    ;; int16 _y
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _x
       (write-word _x s)
     ;; int16 _y
       (write-word _y s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _x
     (setq _x (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _y
     (setq _y (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(defclass mobileNet::GetDepthResponse
  :super ros::object
  :slots (_depth ))

(defmethod mobileNet::GetDepthResponse
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
    ;; int32 _depth
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _depth
       (write-long _depth s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _depth
     (setq _depth (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass mobileNet::GetDepth
  :super ros::object
  :slots ())

(setf (get mobileNet::GetDepth :md5sum-) "3e58674313cc0990de93c97c52bc2f8c")
(setf (get mobileNet::GetDepth :datatype-) "mobileNet/GetDepth")
(setf (get mobileNet::GetDepth :request) mobileNet::GetDepthRequest)
(setf (get mobileNet::GetDepth :response) mobileNet::GetDepthResponse)

(defmethod mobileNet::GetDepthRequest
  (:response () (instance mobileNet::GetDepthResponse :init)))

(setf (get mobileNet::GetDepthRequest :md5sum-) "3e58674313cc0990de93c97c52bc2f8c")
(setf (get mobileNet::GetDepthRequest :datatype-) "mobileNet/GetDepthRequest")
(setf (get mobileNet::GetDepthRequest :definition-)
      "int16 x		#image x coordinate 
int16 y		#image y coordinate
---
int32 depth	#depth (mm) of object at image coordinates

")

(setf (get mobileNet::GetDepthResponse :md5sum-) "3e58674313cc0990de93c97c52bc2f8c")
(setf (get mobileNet::GetDepthResponse :datatype-) "mobileNet/GetDepthResponse")
(setf (get mobileNet::GetDepthResponse :definition-)
      "int16 x		#image x coordinate 
int16 y		#image y coordinate
---
int32 depth	#depth (mm) of object at image coordinates

")



(provide :mobileNet/GetDepth "3e58674313cc0990de93c97c52bc2f8c")


