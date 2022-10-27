import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceSlider extends StatefulWidget {
  const ServiceSlider({ Key? key }) : super(key: key);

  @override
  ServiceSliderState createState() => ServiceSliderState();
}
class ServiceSliderState extends State<ServiceSlider> {
  late ScrollController _pageController;
  int activePage = 0;

  List<Widget> services = [
    Container(
      width: 160.w,
      height: 180.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r)),
            child: Image.network(
              'https://i.pinimg.com/736x/49/24/43/4924433a9288f66d09ff148080d34d4c.jpg',
              fit: BoxFit.fill,
              alignment: Alignment.topCenter,
              width: 160.w,
              height: 148.h,
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            width: 160.w,
            height: 16.h,
            alignment: Alignment.center,
            child: Text(
              'Видеосервис',
              style:TextStyle(
                height: 0.93,
                fontFamily: 'HelveticaNeueCyr-Light',
                fontWeight: FontWeight.w300,
                fontSize: 16.sp,
                color: Color.fromRGBO(75, 78, 81, 1),
              ),
            ),
          ),
        ],
      ),
    ),
    Container(
      width: 160.w,
      height: 180.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r)),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.network(
              'https://i.pinimg.com/564x/47/6a/f1/476af10f4dabef65b28478593cb0cc17.jpg',
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
              width: 160.w,
              height: 148.h,
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            width: 160.w,
            height: 16.h,
            alignment: Alignment.center,
            child: Text(
              'Защита квартиры',
              style:TextStyle(
                height: 0.93,
                fontFamily: 'HelveticaNeueCyr-Light',
                fontWeight: FontWeight.w300,
                fontSize: 16.sp,
                color: Color.fromRGBO(75, 78, 81, 1),
              ),
            ),
          ),
        ],
      ),
    ),
    Container(
      width: 160.w,
      height: 180.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r)),
            child: Image.network(
              'https://i.pinimg.com/564x/b1/b3/a0/b1b3a0db6e08b9c70b6babac93d77fbd.jpg',
              fit: BoxFit.fill,
              alignment: Alignment.topCenter,
              width: 160.w,
              height: 148.h,
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            width: 160.w,
            height: 16.h,
            alignment: Alignment.center,
            child: Text(
              'Кнопка тревоги',
              style:TextStyle(
                height: 0.93,
                fontFamily: 'HelveticaNeueCyr-Light',
                fontWeight: FontWeight.w300,
                fontSize: 16.sp,
                color: Color.fromRGBO(75, 78, 81, 1),
              ),
            ),
          ),
        ],
      ),
    ),
    Container(
      width: 160.w,
      height: 180.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r)),
            child: Image.network(
              'https://i.pinimg.com/564x/71/e4/b3/71e4b3fb2e942e7b465a55e3f29c01ab.jpg',
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
              width: 160.w,
              height: 148.h,
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            width: 160.w,
            height: 16.h,
            alignment: Alignment.center,
            child: Text(
              'Кошка-жена',
              style:TextStyle(
                height: 0.93,
                fontFamily: 'HelveticaNeueCyr-Light',
                fontWeight: FontWeight.w300,
                fontSize: 16.sp,
                color: Color.fromRGBO(75, 78, 81, 1),
              ),
            ),
          ),
        ],
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();

    _pageController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 180.h,
      child: ListView.builder(
          //shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: services.length,
          controller: _pageController,
          itemBuilder: (context, index) {
            return Container(
              width: 160.w,
              height: 180.h,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              child: services[index],
            );
          }),
    );
  }
}