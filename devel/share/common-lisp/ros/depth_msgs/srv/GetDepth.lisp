; Auto-generated. Do not edit!


(cl:in-package depth_msgs-srv)


;//! \htmlinclude GetDepth-request.msg.html

(cl:defclass <GetDepth-request> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:fixnum
    :initform 0)
   (y
    :reader y
    :initarg :y
    :type cl:fixnum
    :initform 0))
)

(cl:defclass GetDepth-request (<GetDepth-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetDepth-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetDepth-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name depth_msgs-srv:<GetDepth-request> is deprecated: use depth_msgs-srv:GetDepth-request instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <GetDepth-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader depth_msgs-srv:x-val is deprecated.  Use depth_msgs-srv:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <GetDepth-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader depth_msgs-srv:y-val is deprecated.  Use depth_msgs-srv:y instead.")
  (y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetDepth-request>) ostream)
  "Serializes a message object of type '<GetDepth-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'x)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'x)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'y)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'y)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetDepth-request>) istream)
  "Deserializes a message object of type '<GetDepth-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'x)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'x)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'y)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'y)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetDepth-request>)))
  "Returns string type for a service object of type '<GetDepth-request>"
  "depth_msgs/GetDepthRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetDepth-request)))
  "Returns string type for a service object of type 'GetDepth-request"
  "depth_msgs/GetDepthRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetDepth-request>)))
  "Returns md5sum for a message object of type '<GetDepth-request>"
  "80c391de64e31f65e6c6d950defb26e1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetDepth-request)))
  "Returns md5sum for a message object of type 'GetDepth-request"
  "80c391de64e31f65e6c6d950defb26e1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetDepth-request>)))
  "Returns full string definition for message of type '<GetDepth-request>"
  (cl:format cl:nil "uint16 x       #the image x coordinate of a pixe (0-847)~%uint16 y       #the image y coordinate of a pixel (0-479)~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetDepth-request)))
  "Returns full string definition for message of type 'GetDepth-request"
  (cl:format cl:nil "uint16 x       #the image x coordinate of a pixe (0-847)~%uint16 y       #the image y coordinate of a pixel (0-479)~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetDepth-request>))
  (cl:+ 0
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetDepth-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetDepth-request
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
))
;//! \htmlinclude GetDepth-response.msg.html

(cl:defclass <GetDepth-response> (roslisp-msg-protocol:ros-message)
  ((depth
    :reader depth
    :initarg :depth
    :type cl:integer
    :initform 0))
)

(cl:defclass GetDepth-response (<GetDepth-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetDepth-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetDepth-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name depth_msgs-srv:<GetDepth-response> is deprecated: use depth_msgs-srv:GetDepth-response instead.")))

(cl:ensure-generic-function 'depth-val :lambda-list '(m))
(cl:defmethod depth-val ((m <GetDepth-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader depth_msgs-srv:depth-val is deprecated.  Use depth_msgs-srv:depth instead.")
  (depth m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetDepth-response>) ostream)
  "Serializes a message object of type '<GetDepth-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'depth)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'depth)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'depth)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'depth)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetDepth-response>) istream)
  "Deserializes a message object of type '<GetDepth-response>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'depth)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'depth)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'depth)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'depth)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetDepth-response>)))
  "Returns string type for a service object of type '<GetDepth-response>"
  "depth_msgs/GetDepthResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetDepth-response)))
  "Returns string type for a service object of type 'GetDepth-response"
  "depth_msgs/GetDepthResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetDepth-response>)))
  "Returns md5sum for a message object of type '<GetDepth-response>"
  "80c391de64e31f65e6c6d950defb26e1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetDepth-response)))
  "Returns md5sum for a message object of type 'GetDepth-response"
  "80c391de64e31f65e6c6d950defb26e1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetDepth-response>)))
  "Returns full string definition for message of type '<GetDepth-response>"
  (cl:format cl:nil "uint32 depth   #the depth in mm of the object located at the pixel~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetDepth-response)))
  "Returns full string definition for message of type 'GetDepth-response"
  (cl:format cl:nil "uint32 depth   #the depth in mm of the object located at the pixel~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetDepth-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetDepth-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetDepth-response
    (cl:cons ':depth (depth msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetDepth)))
  'GetDepth-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetDepth)))
  'GetDepth-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetDepth)))
  "Returns string type for a service object of type '<GetDepth>"
  "depth_msgs/GetDepth")