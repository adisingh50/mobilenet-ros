
(cl:in-package :asdf)

(defsystem "depth_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "GetDepth" :depends-on ("_package_GetDepth"))
    (:file "_package_GetDepth" :depends-on ("_package"))
  ))