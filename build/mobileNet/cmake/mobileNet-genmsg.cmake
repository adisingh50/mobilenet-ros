# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "mobileNet: 0 messages, 1 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(mobileNet_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/smith-jetson/Desktop/jetson-inference/catkin_ws/src/mobileNet/srv/GetDepth.srv" NAME_WE)
add_custom_target(_mobileNet_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mobileNet" "/home/smith-jetson/Desktop/jetson-inference/catkin_ws/src/mobileNet/srv/GetDepth.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(mobileNet
  "/home/smith-jetson/Desktop/jetson-inference/catkin_ws/src/mobileNet/srv/GetDepth.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mobileNet
)

### Generating Module File
_generate_module_cpp(mobileNet
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mobileNet
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(mobileNet_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(mobileNet_generate_messages mobileNet_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/smith-jetson/Desktop/jetson-inference/catkin_ws/src/mobileNet/srv/GetDepth.srv" NAME_WE)
add_dependencies(mobileNet_generate_messages_cpp _mobileNet_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mobileNet_gencpp)
add_dependencies(mobileNet_gencpp mobileNet_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mobileNet_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(mobileNet
  "/home/smith-jetson/Desktop/jetson-inference/catkin_ws/src/mobileNet/srv/GetDepth.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mobileNet
)

### Generating Module File
_generate_module_eus(mobileNet
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mobileNet
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(mobileNet_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(mobileNet_generate_messages mobileNet_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/smith-jetson/Desktop/jetson-inference/catkin_ws/src/mobileNet/srv/GetDepth.srv" NAME_WE)
add_dependencies(mobileNet_generate_messages_eus _mobileNet_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mobileNet_geneus)
add_dependencies(mobileNet_geneus mobileNet_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mobileNet_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(mobileNet
  "/home/smith-jetson/Desktop/jetson-inference/catkin_ws/src/mobileNet/srv/GetDepth.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mobileNet
)

### Generating Module File
_generate_module_lisp(mobileNet
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mobileNet
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(mobileNet_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(mobileNet_generate_messages mobileNet_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/smith-jetson/Desktop/jetson-inference/catkin_ws/src/mobileNet/srv/GetDepth.srv" NAME_WE)
add_dependencies(mobileNet_generate_messages_lisp _mobileNet_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mobileNet_genlisp)
add_dependencies(mobileNet_genlisp mobileNet_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mobileNet_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(mobileNet
  "/home/smith-jetson/Desktop/jetson-inference/catkin_ws/src/mobileNet/srv/GetDepth.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mobileNet
)

### Generating Module File
_generate_module_nodejs(mobileNet
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mobileNet
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(mobileNet_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(mobileNet_generate_messages mobileNet_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/smith-jetson/Desktop/jetson-inference/catkin_ws/src/mobileNet/srv/GetDepth.srv" NAME_WE)
add_dependencies(mobileNet_generate_messages_nodejs _mobileNet_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mobileNet_gennodejs)
add_dependencies(mobileNet_gennodejs mobileNet_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mobileNet_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(mobileNet
  "/home/smith-jetson/Desktop/jetson-inference/catkin_ws/src/mobileNet/srv/GetDepth.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mobileNet
)

### Generating Module File
_generate_module_py(mobileNet
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mobileNet
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(mobileNet_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(mobileNet_generate_messages mobileNet_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/smith-jetson/Desktop/jetson-inference/catkin_ws/src/mobileNet/srv/GetDepth.srv" NAME_WE)
add_dependencies(mobileNet_generate_messages_py _mobileNet_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mobileNet_genpy)
add_dependencies(mobileNet_genpy mobileNet_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mobileNet_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mobileNet)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mobileNet
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(mobileNet_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mobileNet)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mobileNet
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(mobileNet_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mobileNet)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mobileNet
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(mobileNet_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mobileNet)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mobileNet
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(mobileNet_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mobileNet)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mobileNet\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mobileNet
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(mobileNet_generate_messages_py std_msgs_generate_messages_py)
endif()
