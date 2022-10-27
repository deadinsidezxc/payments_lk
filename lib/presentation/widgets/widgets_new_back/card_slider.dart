import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_api/core/dictionaries/colors.dart';

class Carousel extends StatefulWidget {
  const Carousel({ Key? key }) : super(key: key);

  @override
  CarouselState createState() => CarouselState();
}

class CarouselState extends State<Carousel> {
  late PageController _pageController;
  int activePage = 0;

  List<Widget> cards = [
    Container(
      width: ScreenUtil().setWidth(290),
      height: ScreenUtil().setHeight(36),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 10.r,
            spreadRadius: 4.0,
            color: Colors.black.withOpacity(0.05),
          ),
        ],
      ),
    ),
    Container(
      width: ScreenUtil().setWidth(290),
      height: ScreenUtil().setHeight(36),
      padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(14),
          right: ScreenUtil().setWidth(12),
          bottom: ScreenUtil().setHeight(8),
          top: ScreenUtil().setHeight(8)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: ScreenUtil().setWidth(45),
            height: ScreenUtil().setHeight(19),
            alignment: Alignment.center,
            child: Text(
              'VISA',
              style: TextStyle(
                fontFamily: 'HelveticaNeueCyr-Light',
                fontWeight: FontWeight.w500,
                fontSize: ScreenUtil().setSp(16),
                color: AppColors.darkGrey,
              ),
            ),
          ),
          SizedBox(width: ScreenUtil().setWidth(12)),
          Container(
            width: ScreenUtil().setWidth(40),
            height: ScreenUtil().setHeight(19),
            alignment: Alignment.center,
            child: Text(
              '3445',
              style: TextStyle(
                fontFamily: 'HelveticaNeueCyr-Light',
                fontWeight: FontWeight.w300,
                fontSize: ScreenUtil().setSp(16),
                color: AppColors.darkGrey,
              ),
            ),
          ),
          SizedBox(width: ScreenUtil().setWidth(32)),
          Container(
            width: ScreenUtil().setWidth(65),
            height: ScreenUtil().setHeight(19),
            alignment: Alignment.center,
            child: Text(
              '07/25',
              style: TextStyle(
                fontFamily: 'HelveticaNeueCyr-Light',
                fontWeight: FontWeight.w300,
                fontSize: ScreenUtil().setSp(16),
                color: AppColors.darkGrey,
              ),
            ),
          ),
          SizedBox(width: ScreenUtil().setWidth(32)),
          Container(
            width: ScreenUtil().setWidth(38),
            height: ScreenUtil().setHeight(19),
            alignment: Alignment.center,
            child: Text(
              'CVS',
              style: TextStyle(
                fontFamily: 'HelveticaNeueCyr-Light',
                fontWeight: FontWeight.w300,
                fontSize: ScreenUtil().setSp(16),
                color: AppColors.grey,
              ),
            ),
          ),
        ],
      ),
    ),
    Container(
      width: ScreenUtil().setWidth(290),
      height: ScreenUtil().setHeight(36),
      padding: EdgeInsets.only(left: ScreenUtil().setWidth(14),
          right: ScreenUtil().setWidth(12),
          bottom: ScreenUtil().setHeight(8),
          top: ScreenUtil().setHeight(8)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: ScreenUtil().setWidth(45),
            height: ScreenUtil().setHeight(19),
            alignment: Alignment.center,
            child: Text(
              'MIR',
              style: TextStyle(
                fontFamily: 'HelveticaNeueCyr-Light',
                fontWeight: FontWeight.w500,
                fontSize: ScreenUtil().setSp(16),
                color: AppColors.darkGrey,
              ),
            ),
          ),
          SizedBox(width: ScreenUtil().setWidth(12)),
          Container(
            width: ScreenUtil().setWidth(40),
            height: ScreenUtil().setHeight(19),
            alignment: Alignment.center,
            child: Text(
              '5426',
              style: TextStyle(
                fontFamily: 'HelveticaNeueCyr-Light',
                fontWeight: FontWeight.w300,
                fontSize: ScreenUtil().setSp(16),
                color: AppColors.darkGrey,
              ),
            ),
          ),
          SizedBox(width: ScreenUtil().setWidth(32)),
          Container(
            width: ScreenUtil().setWidth(65),
            height: ScreenUtil().setHeight(19),
            alignment: Alignment.center,
            child: Text(
              '07/23',
              style: TextStyle(
                fontFamily: 'HelveticaNeueCyr-Light',
                fontWeight: FontWeight.w300,
                fontSize: ScreenUtil().setSp(16),
                color: AppColors.darkGrey,
              ),
            ),
          ),
          SizedBox(width: ScreenUtil().setWidth(32)),
          Container(
            width: ScreenUtil().setWidth(38),
            height: ScreenUtil().setHeight(19),
            alignment: Alignment.center,
            child: Text(
              'CVS',
              style: TextStyle(
                fontFamily: 'HelveticaNeueCyr-Light',
                fontWeight: FontWeight.w300,
                fontSize: ScreenUtil().setSp(16),
                color: AppColors.grey,
              ),
            ),
          ),
        ],
      ),
    ),
    Container(
      width: ScreenUtil().setWidth(290),
      height: ScreenUtil().setHeight(36),
      padding: EdgeInsets.only(left: ScreenUtil().setWidth(14),
          right: ScreenUtil().setWidth(12),
          bottom: ScreenUtil().setHeight(8),
          top: ScreenUtil().setHeight(8)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: ScreenUtil().setWidth(45),
            height: ScreenUtil().setHeight(19),
            alignment: Alignment.center,
            child: Text(
              'VISA',
              style: TextStyle(
                fontFamily: 'HelveticaNeueCyr-Light',
                fontWeight: FontWeight.w500,
                fontSize: ScreenUtil().setSp(16),
                color: AppColors.darkGrey,
              ),
            ),
          ),
          SizedBox(width: ScreenUtil().setWidth(12)),
          Container(
            width: ScreenUtil().setWidth(40),
            height: ScreenUtil().setHeight(19),
            alignment: Alignment.center,
            child: Text(
              '6643',
              style: TextStyle(
                fontFamily: 'HelveticaNeueCyr-Light',
                fontWeight: FontWeight.w300,
                fontSize: ScreenUtil().setSp(16),
                color: AppColors.darkGrey,
              ),
            ),
          ),
          SizedBox(width: ScreenUtil().setWidth(32)),
          Container(
            width: ScreenUtil().setWidth(65),
            height: ScreenUtil().setHeight(19),
            alignment: Alignment.center,
            child: Text(
              '02/24',
              style: TextStyle(
                fontFamily: 'HelveticaNeueCyr-Light',
                fontWeight: FontWeight.w300,
                fontSize: ScreenUtil().setSp(16),
                color: AppColors.darkGrey,
              ),
            ),
          ),
          SizedBox(width: ScreenUtil().setWidth(32)),
          Container(
            width: ScreenUtil().setWidth(38),
            height: ScreenUtil().setHeight(19),
            alignment: Alignment.center,
            child: Text(
              'CVS',
              style: TextStyle(
                fontFamily: 'HelveticaNeueCyr-Light',
                fontWeight: FontWeight.w300,
                fontSize: ScreenUtil().setSp(16),
                color: AppColors.grey,
              ),
            ),
          ),
        ],
      ),
    ),
    Container(
      width: ScreenUtil().setWidth(150),
      height: ScreenUtil().setHeight(36),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.primary,
      ),
      child: Text(
        'добавить карту',
        style:TextStyle(
          fontFamily: 'HelveticaNeueCyr-Light',
          fontWeight: FontWeight.w500,
          fontSize: ScreenUtil().setSp(14),
          color: Colors.white,
        ),
      ),
    )
  ];

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 6.w),
        width: currentIndex == index ? 12.w : 8.w,
        height: currentIndex == index ? 12.h : 8.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: currentIndex == index ? AppColors.primary : AppColors.lightDarkGrey,
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();

    _pageController = PageController(viewportFraction: 0.9, initialPage: activePage);
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          color: Colors.red,
          height: 45.h,
          width: 1.sw,
          child: PageView.builder(
              //itemCount: cards.length,
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  activePage = page % cards.length;
                });
              },
              itemBuilder: (contextItem, pagePosition) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  child: MaterialButton(
                    padding: EdgeInsets.zero,
                    child: cards[pagePosition % cards.length],
                    onPressed: activePage == (cards.length - 1)
                        ? () async {
                          await showDialog<void>(
                            context: contextItem,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                                  actionsAlignment: MainAxisAlignment.center,
                                  titlePadding: EdgeInsets.only(
                                    top: 28.h,
                                    left: 50.w,
                                    right: 50.w,
                                    bottom: 8.h,
                                  ),
                                  contentPadding: EdgeInsets.fromLTRB(28, 18, 24, 24),
                                  contentTextStyle: Theme.of(context).textTheme.bodyText1?.merge(
                                    TextStyle(
                                      fontFamily: 'HelveticaNeueCyr-Light',
                                      fontWeight: FontWeight.w500,
                                      fontSize: ScreenUtil().setSp(16),
                                      color: AppColors.darkGrey,
                                ),
                            ),
                                  title: Text(
                                    'Добавление карты',
                                    style: Theme.of(context).textTheme.bodyText1?.merge(
                                      TextStyle(
                                        fontFamily: 'HelveticaNeueCyr-Light',
                                        fontWeight: FontWeight.w500,
                                        fontSize: ScreenUtil().setSp(18),
                                        color: AppColors.darkGrey,
                                      ),
                                    ),
                                  ),
                                  content: const Text(
                                    'Когда-нибудь вы сможете добавить карту, но не сейчас...((',
                                    textAlign: TextAlign.left,
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {Navigator.pop(context);},
                                      child: Text(
                                        'OK',
                                        style: Theme.of(context).textTheme.bodyText1?.merge(
                                          TextStyle(
                                            fontFamily: 'HelveticaNeueCyr-Light',
                                            fontWeight: FontWeight.w500,
                                            fontSize: ScreenUtil().setSp(20),
                                            color: AppColors.primary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                          );
                    }
                    : () {},
                  ),
                );
              }),
        ),
        SizedBox(height: 14.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: indicators(cards.length, activePage),
        ),
      ],
    );
  }
}