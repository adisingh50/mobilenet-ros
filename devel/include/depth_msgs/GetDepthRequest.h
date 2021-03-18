// Generated by gencpp from file depth_msgs/GetDepthRequest.msg
// DO NOT EDIT!


#ifndef DEPTH_MSGS_MESSAGE_GETDEPTHREQUEST_H
#define DEPTH_MSGS_MESSAGE_GETDEPTHREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace depth_msgs
{
template <class ContainerAllocator>
struct GetDepthRequest_
{
  typedef GetDepthRequest_<ContainerAllocator> Type;

  GetDepthRequest_()
    : x(0)
    , y(0)  {
    }
  GetDepthRequest_(const ContainerAllocator& _alloc)
    : x(0)
    , y(0)  {
  (void)_alloc;
    }



   typedef uint16_t _x_type;
  _x_type x;

   typedef uint16_t _y_type;
  _y_type y;





  typedef boost::shared_ptr< ::depth_msgs::GetDepthRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::depth_msgs::GetDepthRequest_<ContainerAllocator> const> ConstPtr;

}; // struct GetDepthRequest_

typedef ::depth_msgs::GetDepthRequest_<std::allocator<void> > GetDepthRequest;

typedef boost::shared_ptr< ::depth_msgs::GetDepthRequest > GetDepthRequestPtr;
typedef boost::shared_ptr< ::depth_msgs::GetDepthRequest const> GetDepthRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::depth_msgs::GetDepthRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::depth_msgs::GetDepthRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::depth_msgs::GetDepthRequest_<ContainerAllocator1> & lhs, const ::depth_msgs::GetDepthRequest_<ContainerAllocator2> & rhs)
{
  return lhs.x == rhs.x &&
    lhs.y == rhs.y;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::depth_msgs::GetDepthRequest_<ContainerAllocator1> & lhs, const ::depth_msgs::GetDepthRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace depth_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::depth_msgs::GetDepthRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::depth_msgs::GetDepthRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::depth_msgs::GetDepthRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::depth_msgs::GetDepthRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::depth_msgs::GetDepthRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::depth_msgs::GetDepthRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::depth_msgs::GetDepthRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "2b80853b9dd76da1c3efb4dbc2426fe9";
  }

  static const char* value(const ::depth_msgs::GetDepthRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x2b80853b9dd76da1ULL;
  static const uint64_t static_value2 = 0xc3efb4dbc2426fe9ULL;
};

template<class ContainerAllocator>
struct DataType< ::depth_msgs::GetDepthRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "depth_msgs/GetDepthRequest";
  }

  static const char* value(const ::depth_msgs::GetDepthRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::depth_msgs::GetDepthRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "uint16 x       #the image x coordinate of a pixe (0-847)\n"
"uint16 y       #the image y coordinate of a pixel (0-479)\n"
;
  }

  static const char* value(const ::depth_msgs::GetDepthRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::depth_msgs::GetDepthRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.x);
      stream.next(m.y);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GetDepthRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::depth_msgs::GetDepthRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::depth_msgs::GetDepthRequest_<ContainerAllocator>& v)
  {
    s << indent << "x: ";
    Printer<uint16_t>::stream(s, indent + "  ", v.x);
    s << indent << "y: ";
    Printer<uint16_t>::stream(s, indent + "  ", v.y);
  }
};

} // namespace message_operations
} // namespace ros

#endif // DEPTH_MSGS_MESSAGE_GETDEPTHREQUEST_H
