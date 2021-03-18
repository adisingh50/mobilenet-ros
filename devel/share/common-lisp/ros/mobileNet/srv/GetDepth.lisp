; Auto-generated. Do not edit!


(cl:in-package mobileNet-srv)


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
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mobileNet-srv:<GetDepth-request> is deprecated: use mobileNet-srv:GetDepth-request instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <GetDepth-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mobileNet-srv:x-val is deprecated.  Use mobileNet-srv:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <GetDepth-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mobileNet-srv:y-val is deprecated.  Use mobileNet-srv:y instead.")
  (y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetDepth-request>) ostream)
  "Serializes a message object of type '<GetDepth-request>"
  (cl:let* ((signed (cl:slot-value msg 'x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'y)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetDepth-request>) istream)
  "Deserializes a message object of type '<GetDepth-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'x) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'y) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetDepth-request>)))
  "Returns string type for a service object of type '<GetDepth-request>"
  "mobileNet/GetDepthRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetDepth-request)))
  "Returns string type for a service object of type 'GetDepth-request"
  "mobileNet/GetDepthRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetDepth-request>)))
  "Returns md5sum for a message object of type '<GetDepth-request>"
  "3e58674313cc0990de93c97c52bc2f8c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetDepth-request)))
  "Returns md5sum for a message object of type 'GetDepth-request"
  "3e58674313cc0990de93c97c52bc2f8c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetDepth-request>)))
  "Returns full string definition for message of type '<GetDepth-request>"
  (cl:format cl:nil "int16 x		#image x coordinate ~%int16 y		#image y coordinate~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetDepth-request)))
  "Returns full string definition for message of type 'GetDepth-request"
  (cl:format cl:nil "int16 x		#image x coordinate ~%int16 y		#image y coordinate~%~%~%"))
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
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mobileNet-srv:<GetDepth-response> is deprecated: use mobileNet-srv:GetDepth-response instead.")))

(cl:ensure-generic-function 'depth-val :lambda-list '(m))
(cl:defmethod depth-val ((m <GetDepth-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mobileNet-srv:depth-val is deprecated.  Use mobileNet-srv:depth instead.")
  (depth m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetDepth-response>) ostream)
  "Serializes a message object of type '<GetDepth-response>"
  (cl:let* ((signed (cl:slot-value msg 'depth)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetDepth-response>) istream)
  "Deserializes a message object of type '<GetDepth-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'depth) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetDepth-response>)))
  "Returns string type for a service object of type '<GetDepth-response>"
  "mobileNet/GetDepthResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetDepth-response)))
  "Returns string type for a service object of type 'GetDepth-response"
  "mobileNet/GetDepthResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetDepth-response>)))
  "Returns md5sum for a message object of type '<GetDepth-response>"
  "3e58674313cc0990de93c97c52bc2f8c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetDepth-response)))
  "Returns md5sum for a message object of type 'GetDepth-response"
  "3e58674313cc0990de93c97c52bc2f8c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetDepth-response>)))
  "Returns full string definition for message of type '<GetDepth-response>"
  (cl:format cl:nil "int32 depth	#depth (mm) of object at image coordinates~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetDepth-response)))
  "Returns full string definition for message of type 'GetDepth-response"
  (cl:format cl:nil "int32 depth	#depth (mm) of object at image coordinates~%~%~%~%"))
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
  "mobileNet/GetDepth")