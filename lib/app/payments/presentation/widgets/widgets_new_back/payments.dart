import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/static/colors.dart';
import '../../../riverpod/riverpod.dart';
import 'card_slider.dart';
import 'dogovors.dart';

class Payments extends ConsumerStatefulWidget {
  const Payments({ Key? key }) : super(key: key);

  @override
  _PaymentsState createState() => _PaymentsState();
}

class _PaymentsState extends ConsumerState<Payments> {
  int _tempSum = 0;
  int _chosen = 1;

  @override
  void initState() {
    super.initState();

    ref.read(summProvider);
    ref.read(checkedProvider);
  }

  String _formatValue(int val) {
    String _str = '';
    int _count = 0;

    List<String> _strArr = val.toString().split('');
    _strArr = _strArr.reversed.toList();

    for(var element in _strArr) {
      _count++;
      if(_count % 3 == 0 && _count != _strArr.length) {
        _str += '$element ';
      } else {
        _str += '$element';
      }
    }
    return _str.split('').reversed.toList().join('');
  }

  @override
  Widget build(BuildContext context) {
    final summ = ref.watch(summProvider);
    final checked = ref.watch(checkedProvider);
    return Container(
      constraints: const BoxConstraints.expand(),
      child: Stack(
        children: <Widget>[
          Container(
            width: 360.w,
            height: 310.h,
            decoration: BoxDecoration(
              color: AppColors.primaryBackgroundContracts,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(12.r), topRight: Radius.circular(12.r)),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(12), right: ScreenUtil().setWidth(12), top: ScreenUtil().setHeight(18), bottom: ScreenUtil().setHeight(16)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: ScreenUtil().setWidth(152),
                        height: ScreenUtil().setHeight(16),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Оплата на сумму',
                          style: Theme.of(context).textTheme.bodyText1?.merge(
                            TextStyle(
                              height: 0.93,
                              fontFamily: 'HelveticaNeueCyr-Light',
                              fontWeight: FontWeight.w500,
                              fontSize: ScreenUtil().setSp(15),
                              color: Color.fromRGBO(75, 78, 81, 1),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: ScreenUtil().setWidth(6)),
                      Container(
                        width: ScreenUtil().setWidth(152),
                        height: ScreenUtil().setHeight(17),
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              _tempSum == 0
                                  ? _formatValue(summ)
                                  : _formatValue(_tempSum),
                              style: Theme.of(context).textTheme.bodyText1?.merge(
                                TextStyle(
                                  fontFamily: 'HelveticaNeueCyr-Light',
                                  fontWeight: FontWeight.w500,
                                  fontSize: ScreenUtil().setSp(15),
                                  color: Color.fromRGBO(75, 78, 81, 1),
                                ),
                              ),
                            ),
                            Text(
                              ' Р',
                              style: Theme.of(context).textTheme.bodyText1?.merge(
                                TextStyle(
                                  fontFamily: 'HelveticaNeueCyr-Light',
                                  fontWeight: FontWeight.w500,
                                  fontSize: ScreenUtil().setSp(15),
                                  color: Color.fromRGBO(75, 78, 81, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ), //Оплата на румму + state Р
                  SizedBox(height: ScreenUtil().setHeight(18)),
                  CustBar(context),
                  SizedBox(height: ScreenUtil().setHeight(0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: ScreenUtil().setWidth(12)),
                      Text(
                        (checked.length).toString(),
                        style: Theme.of(context).textTheme.bodyText1?.merge(
                          TextStyle(
                            fontFamily: 'HelveticaNeueCyr-Light',
                            fontWeight: FontWeight.w500,
                            fontSize: ScreenUtil().setSp(14),
                            color: Color.fromRGBO(75, 78, 81, 1),
                          ),
                        ),
                      ),
                      const DogovorsPayment(),
                      Text(
                        ':',
                        style: Theme.of(context).textTheme.bodyText1?.merge(
                          TextStyle(
                            fontFamily: 'HelveticaNeueCyr-Light',
                            fontWeight: FontWeight.w500,
                            fontSize: ScreenUtil().setSp(14),
                            color: Color.fromRGBO(75, 78, 81, 1),
                          ),
                        ),
                      ),
                      SizedBox(width: ScreenUtil().setWidth(8)),
                      CustomDropDown(),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Carousel(),//CardPicker(),
                  SizedBox(height: 14.h),
                  SizedBox(
                    width: ScreenUtil().setWidth(100),
                    height: ScreenUtil().setHeight(35),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.white,
                        primary: Color.fromRGBO(239, 55, 62, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        },
                      child: Text(
                        'оплатить',
                        style: Theme.of(context).textTheme.bodyText1?.merge(
                          TextStyle(
                            fontFamily: 'HelveticaNeueCyr-Light',
                            fontWeight: FontWeight.w500,
                            fontSize: ScreenUtil().setSp(14),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 310.w,
            bottom: 254.h,
            child: Container(
              width: ScreenUtil().setWidth(28),
              height: ScreenUtil().setHeight(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Color.fromRGBO(239, 55, 62, 1),
              ),
              child: Center(
                child: Text(
                  '-20',
                  style: Theme.of(context).textTheme.bodyText1?.merge(
                    TextStyle(
                      fontFamily: 'HelveticaNeueCyr-Light',
                      fontWeight: FontWeight.w500,
                      fontSize: ScreenUtil().setSp(12),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 205.w,
            bottom: 254.h,
            child: Container(
              width: ScreenUtil().setWidth(28),
              height: ScreenUtil().setHeight(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Color.fromRGBO(239, 55, 62, 1),
              ),
              child: Center(
                child: Text(
                  '-20',
                  style: Theme.of(context).textTheme.bodyText1?.merge(
                    TextStyle(
                      fontFamily: 'HelveticaNeueCyr-Light',
                      fontWeight: FontWeight.w500,
                      fontSize: ScreenUtil().setSp(12),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget CustBar(BuildContext context) {
    final summ = ref.watch(summProvider);
        return ButtonBar(
          alignment: MainAxisAlignment.center,
          buttonPadding: EdgeInsets.symmetric(
            horizontal: 2.w,
          ),
          children: [
            MaterialButton(
              onPressed: () {
                setState(() {
                  _chosen = 1;
                  _tempSum = summ;
                });
              },
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      top: 10.h,
                      bottom: 10.h,
                      left: 12.w,
                      right: 12.w,
                    ),
                    width: 100.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                        border: _chosen == 1
                            ? Border.all(color: Colors.black, width: 1.4.w)
                            : Border.all(color: Colors.transparent, width: 0.w)
                    ),
                    child: Container(
                      width: 78.w,
                      height: 33.h,
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 78.w,
                            height: 17.h,
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Text(
                                  _formatValue(summ),
                                  style: Theme.of(context).textTheme.bodyText1?.merge(
                                    TextStyle(
                                      fontFamily: 'HelveticaNeueCyr-Light',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.sp,
                                      color: AppColors.darkGrey,
                                    ),
                                  ),
                                ),
                                Text(
                                  ' Р',
                                  style: Theme.of(context).textTheme.bodyText1?.merge(
                                    TextStyle(
                                      fontFamily: 'HelveticaNeueCyr-Light',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.sp,
                                      color: AppColors.darkGrey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Container(
                            width: 59.w,
                            height: 12.h,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'за месяц',
                              style: Theme.of(context).textTheme.caption?.merge(
                                TextStyle(
                                  height: 0.93,
                                  fontFamily: 'HelveticaNeueCyr-Light',
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12.sp,
                                  color: AppColors.darkGrey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 100.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: _chosen == 1
                            ? Colors.transparent
                            : Colors.white.withOpacity(0.7)
                    ),),
                ],
              ),
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  _chosen = 2;
                  _tempSum = (summ * 3.2).toInt();
                });
              },
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      top: 10.h,
                      bottom: 10.h,
                      left: 12.w,
                      right: 10.w,
                    ),
                    width: 100.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                        border: _chosen == 2
                            ? Border.all(color: Colors.black, width: 1.4.w)
                            : Border.all(color: Colors.transparent, width: 0.w)
                    ),
                    child: Container(
                      width: 78.w,
                      height: 33.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 78.w,
                            height: 17.h,
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Text(
                                  _formatValue((summ * 3.2).toInt()),
                                  style: Theme.of(context).textTheme.bodyText1?.merge(
                                    TextStyle(
                                      fontFamily: 'HelveticaNeueCyr-Light',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.sp,
                                      color: AppColors.darkGrey,
                                    ),
                                  ),
                                ),
                                Text(
                                  ' Р',
                                  style: Theme.of(context).textTheme.bodyText1?.merge(
                                    TextStyle(
                                      fontFamily: 'HelveticaNeueCyr-Light',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.sp,
                                      color: AppColors.darkGrey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Container(
                            width: 62.w,
                            height: 12.h,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'за квартал',
                              style: Theme.of(context).textTheme.caption?.merge(
                                TextStyle(
                                  height: 0.93,
                                  fontFamily: 'HelveticaNeueCyr-Light',
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12.sp,
                                  color: AppColors.darkGrey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 100.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: _chosen == 2
                            ? Colors.transparent
                            : Colors.white.withOpacity(0.7)
                    ),),
                ],
              ),
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  _chosen = 3;
                  _tempSum = (summ * 9.6).toInt();
                });
              },
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      top: 10.h,
                      bottom: 10.h,
                      left: 12.w,
                      right: 10.w,
                    ),
                    width: 100.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                        border: _chosen == 3
                            ? Border.all(color: Colors.black, width: 1.4.w)
                            : Border.all(color: Colors.transparent, width: 0.w)
                    ),
                    child: Container(
                      width: 78.w,
                      height: 33.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 78.w,
                            height: 17.h,
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Text(
                                  _formatValue((summ * 9.6).toInt()),
                                  style: Theme.of(context).textTheme.bodyText1?.merge(
                                    TextStyle(
                                      fontFamily: 'HelveticaNeueCyr-Light',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.sp,
                                      color: AppColors.darkGrey,
                                    ),
                                  ),
                                ),
                                Text(
                                  ' Р',
                                  style: Theme.of(context).textTheme.bodyText1?.merge(
                                    TextStyle(
                                      fontFamily: 'HelveticaNeueCyr-Light',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.sp,
                                      color: AppColors.darkGrey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Container(
                            width: 59.w,
                            height: 12.h,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'за год',
                              style: Theme.of(context).textTheme.caption?.merge(
                                TextStyle(
                                  height: 0.93,
                                  fontFamily: 'HelveticaNeueCyr-Light',
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12.sp,
                                  color: AppColors.darkGrey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 100.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: _chosen == 3
                            ? Colors.transparent
                            : Colors.white.withOpacity(0.7)
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
  }
}

class CustomDropDown extends ConsumerStatefulWidget {
  const CustomDropDown({Key? key}) : super(key: key);

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends ConsumerState<CustomDropDown> {
  List<String> dogovorsChecked = [];
  String dropdownValue = 'договоры не выбраны';

  initState() {
    super.initState();
    ref.read(checkedProvider);
    final checked = ref.read(checkedProvider);
    String tempStr = '';

    if (checked.isNotEmpty) {
      for (var element in checked) {
        tempStr = '${element.id} от ${_formatDate(element.date ?? '')}';
        dogovorsChecked.add(tempStr);
      }
    } else {
      dogovorsChecked.add(dropdownValue);
    }
  }
  String _formatDate(String dateRaw) {
    String _date = '';
    String _str = dateRaw.substring(0, dateRaw.indexOf(' '));
    List<String> _dateArr = _str.split('.');
    switch(_dateArr[1]) {
      case '01': _dateArr[1] = 'января';
      break;
      case '02': _dateArr[1] = 'февраля';
      break;
      case '03': _dateArr[1] = 'марта';
      break;
      case '04': _dateArr[1] = 'апреля';
      break;
      case '05': _dateArr[1] = 'мая';
      break;
      case '06': _dateArr[1] = 'июня';
      break;
      case '07': _dateArr[1] = 'июля';
      break;
      case '08': _dateArr[1] = 'августа';
      break;
      case '09': _dateArr[1] = 'сентября';
      break;
      case '10': _dateArr[1] = 'октября';
      break;
      case '11': _dateArr[1] = 'ноября';
      break;
      case '12': _dateArr[1] = 'декабря';
      break;
    }

    _date = _date + _dateArr[0] + ' ' + _dateArr[1] + ' ' + _dateArr[2];
    return _date;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      dropdownColor: Color.fromRGBO(245, 245, 245, 1),
      borderRadius: BorderRadius.circular(8.r),
      value: dogovorsChecked.first,
      icon: const Icon(Icons.keyboard_arrow_down),
      items: dogovorsChecked.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Center(
            child: Container(
              width: 150.w,
              height: 25.w,
              alignment: Alignment.centerLeft,
              child: Text(
                items,
                style: Theme.of(context).textTheme.caption?.merge(
                  TextStyle(
                    fontFamily: 'HelveticaNeueCyr-Light',
                    fontWeight: FontWeight.w300,
                    fontSize: ScreenUtil().setSp(12),
                    color: Color.fromRGBO(75, 78, 81, 1),
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
      onChanged: (String? newValue) {},
    );
  }
}