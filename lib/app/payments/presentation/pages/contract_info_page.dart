import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../common/static/colors.dart';
import '../../../../common/static/styles.dart';
import '../../../../gen/assets.gen.dart';
import '../../data/contracts_data/contract_model/contract_model.dart';
import '../../data/payment_history_data/payments_history_model/payments_history_model.dart';
import '../../data/payment_history_data/repository/payments_history_repo.dart';
import '../widgets/payments_one.dart';
import 'payments_history/payments_history_page.dart';

final paymentsHistoryProvider = FutureProvider.family<List<PaymentsHistoryModel>, String>((ref, id) async {
  final repository = ListPaymentsHistoryRepository();
  return await repository.fetchHistory(id);
});

mixin ShowableBottomPayOneSheet {
  Future<void> showBottomPayOneSheet(BuildContext context, {required AnimationController controller, required ContractModel contract}) async {
    await showModalBottomSheet(
      isScrollControlled: true,
      transitionAnimationController: controller,
      backgroundColor: AppColors.primaryBackgroundContracts,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r)),
      ),
      context: context,
      builder: (context) => FractionallySizedBox(
        alignment: Alignment.topCenter,
        heightFactor: 0.3,
        child: PaymentsOne(contract: contract),
      ),
    );
  }
}

class CharacterInfo extends ConsumerStatefulWidget {
  final ContractModel contract;

  const CharacterInfo({Key? key, required this.contract}) : super(key: key);

  @override
  _CharacterInfoState createState() => _CharacterInfoState();
}

class _CharacterInfoState extends ConsumerState<CharacterInfo> with ShowableBottomPayOneSheet, TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    ref.read(paymentsHistoryProvider(widget.contract.id ?? ''));

    controller = BottomSheet.createAnimationController(this);
    controller.duration = Duration(milliseconds: 500);
    controller.reverseDuration = Duration(milliseconds: 300);
  }

  Map<String, List<PaymentsHistoryModel>> sortByDate(List<PaymentsHistoryModel> history) {
    Map<String, List<PaymentsHistoryModel>> result = {};
    var dateArray = dateArr(history);
    result.clear();

    for(var date in dateArray) {
      result[date] = [];
      for(var element in history) {
        if(element.date == date) {
          result[date]!.add(element);
        }
      }
    }
   // print('Map<Date, List> : ${result.length}');
    return result;
  }

  List<String> dateArr(List<PaymentsHistoryModel> history) {
    List<String> result = [];
    for (var element in history) {
      result.add(element.date ?? 'unknownDate');
    }

    return result;
  }

  String _formatDate(String dateRaw) {
    String _date = '';
    List<String> _str = dateRaw.split(' ');
    List<String> _dateArr = _str[0].split('.');
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
      case '00': _dateArr[1] = 'null';
      break;
    }

    _date = _date + _dateArr[0] + ' ' + _dateArr[1] + ' ' + _dateArr[2];
    return _date;
  }

  String _formatAddress(String addressRaw) {
    String _str = addressRaw.replaceAll(RegExp(r'[^\p{Alphabetic}\p{Mark}\p{Decimal_Number}\p{Connector_Punctuation}\p{Join_Control}\s]+', unicode: true),'');
    List<String> _strArr = _str.split(' ');
    String _address = '';
    _address = _address + '${_strArr[3]}, ${_strArr[5]} ${_strArr[6]}., ${_strArr[7]} №${_strArr[9]}, ${_strArr[10]} ${_strArr[11].toUpperCase()}';
    return _address;
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

  bool _isToday(String dateRaw) {
    dateRaw = dateRaw.split('.').reversed.join('-');
    bool isItToday = (
        DateTime.parse(dateRaw).month == DateTime.now().month &&
            DateTime.parse(dateRaw).year == DateTime.now().year &&
            DateTime.parse(dateRaw).day == DateTime.now().day);
    return isItToday;
  }

  @override
  Widget build(BuildContext context) {
    final history = ref.watch(paymentsHistoryProvider(widget.contract.id ?? ''));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primaryBackgroundContracts,
      appBar: _appBar(),
      floatingActionButton: SizedBox(
        width: 130.w,
        height: 40.h,
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          materialTapTargetSize: MaterialTapTargetSize.padded,
          elevation: 0.0,
          // style: ElevatedButton.styleFrom(
          //   onPrimary: Colors.white,
          //   primary: Color.fromRGBO(239, 55, 62, 1),
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(ScreenUtil().radius(8)),
          //   ),
          // ),
          onPressed: () {
            showBottomPayOneSheet(context, controller: controller, contract: widget.contract);
          },
          child: Container(
            width: ScreenUtil().setWidth(130),
            height: ScreenUtil().setHeight(40),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              'оплатить',
              style: AppStyles.subHeader1().copyWith(color: Colors.white,),
            ),
          ),
        ),
      ),
      body: history.when(
        error: (err, stack) => Center(child: Text('smthn bad((', style: TextStyle(color: AppColors.primary, fontSize: 18.sp))),
        loading: () => const Center(child: CircularProgressIndicator(color: AppColors.primary)),
        data: (history) => _body(history),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 156.h,
      elevation: 6.0,
      shadowColor: Colors.black.withOpacity(0.20),
      centerTitle: false,
      leadingWidth: 0.w,
      titleSpacing: 0.w,
      leading: null,
      title: Padding(
        padding: EdgeInsets.only(top: 24.h, bottom: 34.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Assets.icons.chevronBack.svg(
                    color: AppColors.darkGrey,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                56.horizontalSpace,
                Text(
                  'Договор № ${widget.contract.number}',
                  style: AppStyles.headerTitle(),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.h, left: 16.w, right: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'От ${_formatDate(widget.contract.date ?? '')}',
                    style: AppStyles.subHeader1(),
                  ),
                  26.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          '${_formatValue(widget.contract.balance ?? 0)} р',
                          textAlign: TextAlign.left,
                          style: AppStyles.header1().copyWith(
                            color: widget.contract.balance!.isNegative
                                ? AppColors.primary
                                : AppColors.darkGrey,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Абонентская плата: ${widget.contract.fee} р/месяц',
                          textAlign: TextAlign.right,
                          style: AppStyles.body3(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _body(List<PaymentsHistoryModel> history) {
    var payments = sortByDate(history);
    var dateArray = dateArr(history);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
     // crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              history.isEmpty
                  ? _noHistory()
                  : Container(
                width: 1.sw,
                padding: EdgeInsets.only(
                    top: 16.h, bottom: 4.h,
                    left: 16.w, right: 16.w),
                margin: EdgeInsets.only(
                    top: 20.h, bottom: 16.h,
                    left: 16.w, right: 16.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 10,
                      spreadRadius: 4,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _paymentDateTile(dateArray[0], payments[dateArray[0]] ?? []),
                    20.verticalSpace,
                    _paymentDateTile(dateArray[1], payments[dateArray[1]] ?? []),
                    8.verticalSpace,
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.white,
                        primary: AppColors.darkGrey,
                        minimumSize: Size(130.w, 30.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            opaque: false,
                            transitionsBuilder: (contextPayments, a1, a2, widget1) {
                              return Opacity(
                                opacity: a1.value,
                                child: PaymentsHistory(contract: widget.contract, history: history),
                              );
                            },
                            transitionDuration: const Duration(milliseconds: 900),
                            pageBuilder: (contextPayments, _, __) {return Container();},
                          ),
                        );
                      },
                      child: Container(
                        width: 132.w,
                        height: 30.h,
                        alignment: Alignment.center,
                        child: Text(
                          'показать ещё',
                          style: AppStyles.body1().copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Ionicons.person,
                          size: 16.w,
                          color: AppColors.darkGrey,
                        ),
                        10.horizontalSpace,
                        Text(
                          widget.contract.organization ?? 'unknown',
                          style: AppStyles.body2(),
                        ),
                      ],
                    ),
                    16.verticalSpace,
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.contract.address.length,
                      separatorBuilder: (context, index) => 16.verticalSpace,
                      itemBuilder: (context, index) => Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_pin,
                            size: 16.w,
                            color: AppColors.darkGrey,
                          ),
                          12.horizontalSpace,
                          Flexible(
                            fit: FlexFit.loose,
                            child: Text(
                              widget.contract.address.first.addressName != null
                                  ? _formatAddress(widget.contract.address[index].addressName!)
                                  : 'unknown address',
                              maxLines: 2,
                              style: AppStyles.body2(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              60.verticalSpace,
            ],
          ),
        ),
      ],
    );
  }

  Widget _paymentDateTile(String date, List<PaymentsHistoryModel> payment) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _isToday(date) ? 'Сегодня' : '${_formatDate(date)}',
          style: AppStyles.subHeader1(),
        ),
        12.verticalSpace,
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: payment.length,
          separatorBuilder: (context, index) => 8.verticalSpace,
          itemBuilder: (context, index) => _paymentTile(payment[index]),
        ),
      ],
    );
  }

  Widget _paymentTile(PaymentsHistoryModel payment) {
    return Container(
      padding: EdgeInsets.only(left: 4.w, right: 8.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            payment.type == 'unknown'
                ? Ionicons.help_circle
                : payment.type == 'lk' || payment.type == 'site' ? Ionicons.add_circle : Ionicons.remove_circle,
            color: payment.type == 'unknown' ? AppColors.lightDarkGrey : AppColors.darkGrey,
            size: 24.w,
          ),
          14.horizontalSpace,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                payment.type == 'unknown'
                    ? 'Неизвестно'
                    : payment.type == 'lk' || payment.type == 'site' ? 'Пополнение счёта' : 'Списание',
                style: AppStyles.subHeader2().copyWith(color: payment.type == 'unknown' ? AppColors.lightDarkGrey : AppColors.darkGrey),
              ),
              5.verticalSpace,
              Text(
                payment.type == 'unknown'
                    ? 'неизвестно'
                    : payment.type == 'bill'
                    ? 'абонентская плата'
                    : payment.type == 'lk' ? 'оплата через приложение' : 'оплата через сайт',
                style: AppStyles.body3().copyWith(color: AppColors.lightDarkGrey),
              ),
            ],
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                payment.type == 'unknown'
                    ? '? р'
                    : payment.type == 'lk' || payment.type == 'site'
                    ? '+ ${_formatValue(payment.price!.abs())} р'
                    : '- ${_formatValue(payment.price!.abs())} р',
                style: AppStyles.subHeader1().copyWith(
                    color: payment.type == 'unknown'
                        ? AppColors.lightDarkGrey
                        : payment.type == 'bill' ? AppColors.darkGrey : AppColors.darkGreen,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _noHistory() {
    return Container(
      width: 1.sw,
      height: 300.h,
      margin: EdgeInsets.only(
          top: 20.h, bottom: 16.h,
          left: 16.w, right: 16.w),
      padding: EdgeInsets.only(
        bottom: 16.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 4,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Container(
                  height: 8.h,
                  width: 1.sw,
                  decoration: BoxDecoration(
                    color: AppColors.primaryBackgroundContracts,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(8.r),
                    ),
                  ),
                ),
                Positioned(
                  top: 7.h,
                  child: Container(
                    height: 160.h,
                    width: 1.0.sw,
                    decoration: ShapeDecoration(
                      color: AppColors.primaryBackgroundContracts,
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.elliptical(
                            double.infinity,
                            40.r,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 45.h,
                    child: Assets.icons.nopayments.svg(
                      height: 150.h,
                      alignment: Alignment.center,
                    ),
                ),
                Positioned(
                  top: 225.h,
                    child: Column(
                      children: [
                        Container(
                          width: 1.sw,
                          alignment: Alignment.topCenter,
                          child: Text(
                            'Здесь будет отображаться Ваша',
                            style: AppStyles.body2().copyWith(
                              letterSpacing: 0.2,
                              wordSpacing: 1.5,
                            ),
                          ),
                        ),
                        6.verticalSpace,
                        Container(
                          width: 1.sw,
                          alignment: Alignment.topCenter,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'История платежей',
                                  style: AppStyles.body2().copyWith(
                                    letterSpacing: 0.2,
                                    wordSpacing: 1.5,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: ' по договору.',
                                  style: AppStyles.body2().copyWith(
                                    letterSpacing: 0.2,
                                    wordSpacing: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
