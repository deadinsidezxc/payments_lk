import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_api/core/dictionaries/colors.dart';
import 'package:rick_and_morty_api/data/contracts_data/contract_model/contract_model.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/dictionaries/styles.dart';
import '../../data/payment_ds/payment_ds.dart';

class PaymentsOne extends StatefulWidget {
  final ContractModel contract;
  const PaymentsOne({ Key? key, required this.contract}) : super(key: key);

  @override
  _PaymentsOneState createState() => _PaymentsOneState();
}

class _PaymentsOneState extends State<PaymentsOne> {
  int _tempSum = 0;
  int _chosen = 1;
  late PageController _pageController;
  int activePage = 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(viewportFraction: 1.0, initialPage: activePage);
    _tempSum = widget.contract.fee ?? 0;
  }

  Future<String> _paymentRequest(String contractId, double price) async {
    final apiDS = PaymentsDS();
    final _url = await apiDS.createPayment(contractId, price);
    return _url;
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $uri';
    }
  }

  _dialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(16.w),
            backgroundColor: AppColors.primaryBackgroundContracts,
            title: Text('Ошибка'),
            content: Text('Возникла какая-то ошибка при попытке перейти на страницу оплаты =('),
            actionsAlignment: MainAxisAlignment.center,
            actions: <Widget>[
              TextButton(
                child: Text(
                  'OK',
                  style: AppStyles.buttonOn().copyWith(fontSize: 20.sp, color: AppColors.primary),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
    );
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
    return Container(
      constraints: const BoxConstraints.expand(),
      child: Stack(
        children: <Widget>[
          Container(
            width: 360.w,
            height: 248.h,
            decoration: BoxDecoration(
              color: AppColors.primaryBackgroundContracts,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(12.r), topRight: Radius.circular(12.r)),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: 21.w,
                right: 21.w,
                top: 20.h,
                bottom: 20.h,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Оплата на сумму:',
                          style: AppStyles.subHeader1().copyWith(fontSize: 15.sp, height: 0.92),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '${_formatValue(_tempSum)} Р',
                            style: AppStyles.subHeader1().copyWith(fontSize: 15.sp, height: 0.92),
                          ),
                        ),
                      ),
                    ],
                  ),
                  12.verticalSpace,
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Договор № ${widget.contract.id ?? ''} от ${_formatDate(widget.contract.date ?? '')}',
                      textAlign: TextAlign.left,
                      style: AppStyles.buttonOff(),
                    ),
                  ),
                  16.verticalSpace,
                  CustBar(context),
                  16.verticalSpace,
                  SizedBox(
                    width: 98.w,
                    height: 33.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.white,
                        primary: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      onPressed: () async {
                        final _url = await _paymentRequest(widget.contract.id ?? '', _tempSum.toDouble());
                        if(_url == 'error!') {
                          await _dialog();
                        } else {
                          await _launchUrl(_url);
                        }
                        },
                      child: Text(
                        'оплатить',
                        style: AppStyles.buttonOn().copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Positioned(
          //   left: 312.w,
          //   bottom: 254.h,
          //   child: Container(
          //     width: ScreenUtil().setWidth(28),
          //     height: ScreenUtil().setHeight(16),
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(4),
          //       color: Color.fromRGBO(239, 55, 62, 1),
          //     ),
          //     child: Center(
          //       child: Text(
          //         '-20',
          //         style: Theme.of(context).textTheme.bodyText1?.merge(
          //           TextStyle(
          //             fontFamily: 'HelveticaNeueCyr-Light',
          //             fontWeight: FontWeight.w500,
          //             fontSize: ScreenUtil().setSp(12),
          //             color: Colors.white,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // Positioned(
          //   left: 205.w,
          //   bottom: 254.h,
          //   child: Container(
          //     width: ScreenUtil().setWidth(28),
          //     height: ScreenUtil().setHeight(16),
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(4),
          //       color: Color.fromRGBO(239, 55, 62, 1),
          //     ),
          //     child: Center(
          //       child: Text(
          //         '-20',
          //         style: Theme.of(context).textTheme.bodyText1?.merge(
          //           TextStyle(
          //             fontFamily: 'HelveticaNeueCyr-Light',
          //             fontWeight: FontWeight.w500,
          //             fontSize: ScreenUtil().setSp(12),
          //             color: Colors.white,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget CustBar(BuildContext context) {
    int _price = widget.contract.fee ?? 0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MaterialButton(
          padding: EdgeInsets.zero,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onPressed: () {
            setState(() {
              _chosen = 1;
              _tempSum = _price;
            });
          },
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(10),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${_formatValue(_price)} Р',
                        style: AppStyles.subHeader1(),
                    ),
                    //1.verticalSpace,
                    Text(
                      'за 1 месяц',
                      style: AppStyles.body3(),
                    ),
                  ],
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
          padding: EdgeInsets.zero,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onPressed: () {
            setState(() {
              _chosen = 2;
              _tempSum = (_price * 3).toInt();
            });
          },
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(10),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${_formatValue((_price * 3).toInt())} Р',
                        style: AppStyles.subHeader1(),
                    ),
                    //1.verticalSpace,
                    Text(
                      'за 3 месяца',
                      style: AppStyles.body3(),
                    ),
                  ],
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
          padding: EdgeInsets.zero,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onPressed: () {
            setState(() {
              _chosen = 3;
              _tempSum = (_price * 6).toInt();
            });
          },
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(10),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${_formatValue((_price * 6).toInt())} Р',
                      textAlign: TextAlign.end,
                      style: AppStyles.subHeader1(),
                    ),
                    //1.verticalSpace,
                    Text(
                      'за полгода',
                      style: AppStyles.body3(),
                    ),
                  ],
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
                ),),
            ],
          ),
        ),
      ],
    );
  }

  // Widget PayTextField() {
  //   return Container(
  //     width: 1.sw,
  //     height: 68.h,
  //     alignment: Alignment.center,
  //     padding: EdgeInsets.all(4.w),
  //     child: TextField(
  //       scrollPadding: EdgeInsets.only(bottom: 120.h),
  //       decoration: InputDecoration(
  //           labelText: 'Введите сумму',
  //           floatingLabelStyle: AppStyles.body3().copyWith(color: AppColors.lightDarkGrey),
  //           floatingLabelBehavior: FloatingLabelBehavior.always,
  //           enabledBorder: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(4.r),
  //             borderSide: BorderSide(width: 2.w, color: AppColors.primary),
  //             gapPadding: 5.w,
  //           ),
  //           disabledBorder: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(4.r),
  //             borderSide: BorderSide(width: 2.w, color: AppColors.primary),
  //             gapPadding: 5.w,
  //           ),
  //           border: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(4.r),
  //             borderSide: BorderSide(width: 2.w, color: AppColors.primary),
  //             gapPadding: 5.w,
  //           )
  //       ),
  //     ),
  //   );
  // }
  //
  // List<Widget> _indicators(imagesLength, currentIndex) {
  //   return List<Widget>.generate(imagesLength, (index) {
  //     return Container(
  //       margin: EdgeInsets.symmetric(horizontal: 6.w),
  //       width: currentIndex == index ? 14.w : 8.w,
  //       height: currentIndex == index ? 14.h : 8.h,
  //       decoration: BoxDecoration(
  //         shape: BoxShape.circle,
  //         color: currentIndex == index ? AppColors.primary : AppColors.lightDarkGrey,
  //       ),
  //     );
  //   });
  // }

  // Widget CarouselPay() {
  //   List<Widget> _pays = [
  //     CustBar(context) as Widget,
  //     //PayTextField(),
  //   ];
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.start,
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     children: [
  //       Container(
  //         height: 68.h,
  //         width: 1.sw,
  //         child: PageView.builder(
  //             itemCount: _pays.length,
  //             pageSnapping: true,
  //             controller: _pageController,
  //             onPageChanged: (page) {
  //               setState(() {
  //                 activePage = page;
  //               });
  //             },
  //             itemBuilder: (contextItem, pagePosition) {
  //               return _pays[pagePosition];
  //             }),
  //       ),
  //       12.verticalSpace,
  //       // Row(
  //       //   mainAxisAlignment: MainAxisAlignment.center,
  //       //   crossAxisAlignment: CrossAxisAlignment.center,
  //       //   children: _indicators(_pays.length, activePage),
  //       // ),
  //     ],
  //   );
  // }
}
