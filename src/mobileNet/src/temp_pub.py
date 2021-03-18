#!/usr/bin/env python

import rospy
import random
from std_msgs.msg import Int16

def publish():
    rospy.init_node('rn_publisher')
    pub = rospy.Publisher('random_nums', Int16, queue_size=10)

    while not rospy.is_shutdown():
        rand_num = random.randrange(1,100,1)
        pub.publish(rand_num)

if __name__ == "__main__":
    publish()

