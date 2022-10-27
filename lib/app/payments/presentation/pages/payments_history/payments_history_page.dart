import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:reforce_platform/app/payments/presentation/pages/payments_history/payment_full_info.dart';
import '../../../../../common/static/colors.dart';
import '../../../../../common/static/styles.dart';
import '../../../data/contracts_data/contract_model/contract_model.dart';
import '../../../data/payment_history_data/payments_history_model/payments_history_model.dart';
import '../contract_info_page.dart';


class PaymentsHistory extends ConsumerStatefulWidget {
  final ContractModel contract;
  final List<PaymentsHistoryModel> history;

  const PaymentsHistory({Key? key, required this.contract, required this.history}) : super(key: key);

  @override
  _PaymentsHistoryState createState() => _PaymentsHistoryState();
}

class _PaymentsHistoryState extends ConsumerState<PaymentsHistory> with TickerProviderStateMixin, ShowableBottomPayOneSheet {
  late AnimationController controller;

  DateTimeRange? filterDate;
  String filterType = '';

  bool _chosenDate = false;
  bool _chosenType = false;

  @override
  void initState() {
    super.initState();

    controller = BottomSheet.createAnimationController(this);
    controller.duration = Duration(milliseconds: 450);
    controller.reverseDuration = Duration(milliseconds: 350);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Map<String, List<PaymentsHistoryModel>> sortByDate(List<PaymentsHistoryModel> history) {
    Map<String, List<PaymentsHistoryModel>> result = {};
    var dateArray = dateArr(history);
    //List<PaymentsHistoryModel> tempArr = [];
    result.clear();
    for (var date in dateArray) {
      result[date] = [];
      for (var element in history) {
        if (element.date == date) {
          result[date]!.add(element);
        }
      }
    }
    //print('Map<Date, List> : ${result}');
    return result;
  }

  List<String> dateArr(List<PaymentsHistoryModel> history) {
    List<String> result = [];
    for (var element in history) {
      result.add(element.date ?? 'unknownDate');
    }
    //print('List<Date> : $result');
    return result.toSet().toList();
  }

  String _formatValue(int val) {
    String _str = '';
    int _count = 0;

    List<String> _strArr = val.toString().split('');
    _strArr = _strArr.reversed.toList();

    for (var element in _strArr) {
      _count++;
      if (_count % 3 == 0 && _count != _strArr.length) {
        _str += '$element ';
      } else {
        _str += '$element';
      }
    }
    return _str
        .split('')
        .reversed
        .toList()
        .join('');
  }

  String _formatDate(String dateRaw) {
    String _date = '';
    List<String> _dateArr = dateRaw.split('.');
    switch (_dateArr[1]) {
      case '01':
        _dateArr[1] = 'января';
        break;
      case '02':
        _dateArr[1] = 'февраля';
        break;
      case '03':
        _dateArr[1] = 'марта';
        break;
      case '04':
        _dateArr[1] = 'апреля';
        break;
      case '05':
        _dateArr[1] = 'мая';
        break;
      case '06':
        _dateArr[1] = 'июня';
        break;
      case '07':
        _dateArr[1] = 'июля';
        break;
      case '08':
        _dateArr[1] = 'августа';
        break;
      case '09':
        _dateArr[1] = 'сентября';
        break;
      case '10':
        _dateArr[1] = 'октября';
        break;
      case '11':
        _dateArr[1] = 'ноября';
        break;
      case '12':
        _dateArr[1] = 'декабря';
        break;
      case '00':
        _dateArr[1] = 'null';
        break;
    }

    _date = _date + _dateArr[0] + ' ' + _dateArr[1] + ' ' + _dateArr[2];
    return _date;
  }

  String _formatTime(DateTimeRange timeRaw) {
    String timeStart = timeRaw.start.toString().split(' ')[0]
        .split('-')
        .reversed
        .join('.');
    String timeEnd = timeRaw.end.toString().split(' ')[0]
        .split('-')
        .reversed
        .join('.');
    return '${timeStart.substring(0, timeStart.length - 4) +
        timeStart.substring(timeStart.length - 2, timeStart.length)}'
        ' - ${timeEnd.substring(0, timeStart.length - 4) +
        timeEnd.substring(timeStart.length - 2, timeStart.length)}';
  }

  bool _isToday(String dateRaw) {
    dateRaw = dateRaw.split('.').reversed.join('-');

    bool isItToday = (
        DateTime.parse(dateRaw).month == DateTime.now().month &&
        DateTime.parse(dateRaw).year == DateTime.now().year &&
        DateTime.parse(dateRaw).day == DateTime.now().day);
    return isItToday;
  }

  bool _isFilteredDate(String dateRaw) {
    DateTime date = DateTime.parse(dateRaw
        .split('.')
        .reversed
        .join('-'));
    if (filterDate == null) {
      return true;
    } else {
      bool isIt = (filterDate!.start.compareTo(date) <= 0) &&
          (filterDate!.end.compareTo(date) >= 0);
      return isIt;
    }
  }

  bool _isFilteredType(String typeRaw) {
    String type = '';
    if (filterType == '') {
      return true;
    } else {
      if (typeRaw == 'lk' || typeRaw == 'site') {
        type = 'пополнение';
      } else {
        type = 'списание';
      }
    }

    if (typeRaw == 'unknown') {
      return false;
    }

    return filterType == type;
  }

  bool _isOneType(List<PaymentsHistoryModel> payments) {
    bool flag = true;
    String first = 'списание';
    if (filterType == '') {
      return false;
    }
    if (payments.first.type == 'lk' || payments.first.type == 'site') {
      first = 'пополнение';
    }
    for (var element in payments) {
      if (element.type == 'lk' || element.type == 'site') {
        if (first != 'пополнение') {
          flag = false;
        }
      } else {
        if (first != 'списание') {
          flag = false;
        }
      }
    }

    return flag && first != filterType;
  }

  @override
  Widget build(BuildContext context) {
    final history = widget.history;
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
          onPressed: () {
            showBottomPayOneSheet(
                context,
                controller: controller,
                contract: widget.contract);
          },
          child: Container(
            width: 130.w,
            height: 40.h,
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
      body: _body(history, widget.contract),
    );
  }

  AppBar _appBar() {
    return AppBar(
      toolbarHeight: 64.h,
      elevation: 4.0,
      shadowColor: Colors.black.withOpacity(0.15),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
            Ionicons.chevron_back, color: AppColors.darkGrey, size: 16.w),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Container(
        width: ScreenUtil().setWidth(180),
        height: ScreenUtil().setHeight(24),
        alignment: Alignment.center,
        child: Text(
          'История платежей',
          style: AppStyles.headerTitle(),
        ),
      ),
    );
  }

  Widget _body(List<PaymentsHistoryModel> history, ContractModel contract) {
    var payments = sortByDate(history);
    var dateArray = dateArr(history);
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 12.h, top: 12.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: 1.sw,
            child: customButtonBarTime(),
          ),
          12.verticalSpace,
          Expanded(
            child: SizedBox(
              width: 1.sw,
              child: ListView.separated(
                itemCount: dateArray.length,
                separatorBuilder: (context, index) => SizedBox.shrink(),
                itemBuilder: (context, index) =>
                    _paymentDateTile(
                        dateArray[index], payments[dateArray[index]] ?? [],
                        contract),
              ),
            ),
          ),
          16.verticalSpace,
        ],
      ),
    );
  }

  Widget _paymentDateTile(String date, List<PaymentsHistoryModel> payments, ContractModel contract) {
    return _isFilteredDate(date) && !_isOneType(payments)
        ? Column(
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
          itemCount: payments.length,
          separatorBuilder: (context, index) => 8.verticalSpace,
          itemBuilder: (context, index) =>
              _paymentTile(payments[index], contract),
        ),
        35.verticalSpace,
      ],
    )
        : SizedBox.shrink();
  }

  Widget _paymentTile(PaymentsHistoryModel payment, ContractModel contract) {
    return !_isFilteredType(payment.type ?? 'unknown')
        ? SizedBox.shrink()
        : MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: () async {
        showBottomPaymentInfoSheet(
            context, payment: payment, contract: contract);
      },
      child: Container(
        padding: EdgeInsets.only(left: 4.w, right: 8.w, bottom: 0.h),
        height: 60.h,
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              payment.type == 'bill' ? Ionicons.remove_circle : Ionicons
                  .add_circle,
              color: AppColors.darkGrey,
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
                      : payment.type == 'lk' || payment.type == 'site'
                      ? 'Пополнение счёта'
                      : 'Списание',
                  style: AppStyles.subHeader2(),
                ),
                5.verticalSpace,
                Text(
                  payment.type == 'unknown'
                      ? 'неизвестно'
                      : payment.type == 'bill'
                      ? 'абонентская плата'
                      : payment.type == 'lk'
                      ? 'оплата через приложение'
                      : 'оплата через сайт',
                  style: AppStyles.body3().copyWith(
                      color: AppColors.lightDarkGrey),
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
                      color: payment.type == 'bill'
                          ? AppColors.darkGrey
                          : AppColors.darkGreen),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customButtonBarTime() {
    return SizedBox(
      width: 1.sw,
      height: 40.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: [
          !_chosenDate
              ? MaterialButton(
            padding: EdgeInsets.zero,
            onPressed: () async {
              setState(() {
                _show();
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.darkGrey, width: 1.0.w),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'период',
                    style: AppStyles.body1(),
                  ),
                  8.horizontalSpace,
                  Icon(
                    Ionicons.chevron_down,
                    size: 18.w,
                    color: AppColors.darkGrey,
                  ),
                ],
              ),
            ),
          )
              : MaterialButton(
            padding: EdgeInsets.zero,
            onPressed: () async {
              setState(() {
                _show();
              });
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.darkGrey, width: 1.0.w),
                color: AppColors.darkGrey,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8.h, bottom: 8.h, left: 12.w),
                    child: Text(
                      filterDate == null
                          ? 'дата не выбрана'
                          : _formatTime(filterDate!),
                      style: AppStyles.body1().copyWith(color: Colors.white),
                    ),
                  ),
                  MaterialButton(
                    padding: EdgeInsets.zero,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    height: 32.h,
                    minWidth: 42.w,
                    onPressed: () {
                      setState(() {
                        _chosenDate = false;
                        filterDate = null;
                      });
                    },
                    child: Center(
                      child: Icon(
                        Ionicons.close,
                        size: 20.w,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          12.horizontalSpace,
          !_chosenType
              ? MaterialButton(
            padding: EdgeInsets.zero,
            onPressed: () async {
              setState(() {
                _showChooseType();
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.darkGrey, width: 1.0.w),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'тип',
                    style: AppStyles.body1(),
                  ),
                  8.horizontalSpace,
                  Icon(
                    Ionicons.chevron_down,
                    size: 18.w,
                    color: AppColors.darkGrey,
                  ),
                ],
              ),
            ),
          )
              : MaterialButton(
            padding: EdgeInsets.zero,
            onPressed: () async {
              setState(() {
                _showChooseType();
              });
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.darkGrey, width: 1.0.w),
                color: AppColors.darkGrey,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8.h, bottom: 8.h, left: 12.w),
                    child: Text(
                      filterType == ''
                          ? 'не выбрано'
                          : '$filterType',
                      style: AppStyles.body1().copyWith(color: Colors.white),
                    ),
                  ),
                  // 4.horizontalSpace,
                  MaterialButton(
                    padding: EdgeInsets.zero,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    height: 32.h,
                    minWidth: 42.w,
                    onPressed: () {
                      setState(() {
                        _chosenType = false;
                        filterType = '';
                      });
                    },
                    child: Center(
                      child: Icon(
                        Ionicons.close,
                        size: 20.w,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _chooseType() {
    return Container(
      width: 1.sw,
      height: 150.h,
      padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 22.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(8.r)),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Тип операции',
            style: AppStyles.subHeader1(),
          ),
          12.verticalSpace,
          MaterialButton(
            padding: EdgeInsets.zero,
            minWidth: 1.sw,
            height: 45.h,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onPressed: () {
              setState(() {
                filterType = 'пополнение';
                _chosenType = true;
              });
              Navigator.pop(context);
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 12.w,
                  height: 12.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: filterType == 'пополнение'
                        ? AppColors.primary
                        : Colors.transparent,
                    border: Border.all(
                      width: 1.w,
                      color: filterType == 'пополнение'
                          ? Colors.transparent
                          : AppColors.lightDarkGrey,
                    ),
                  ),
                ),
                6.horizontalSpace,
                Text(
                  'пополнение',
                  style: AppStyles.body1(),
                ),
              ],
            ),
          ),
          MaterialButton(
            padding: EdgeInsets.zero,
            minWidth: 1.sw,
            height: 45.h,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onPressed: () {
              setState(() {
                filterType = 'списание';
                _chosenType = true;
              });
              Navigator.pop(context);
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 12.w,
                  height: 12.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: filterType == 'списание'
                        ? AppColors.primary
                        : Colors.transparent,
                    border: Border.all(
                      width: 1.w,
                      color: filterType == 'списание'
                          ? Colors.transparent
                          : AppColors.lightDarkGrey,
                    ),
                  ),
                ),
                6.horizontalSpace,
                Text(
                  'списание',
                  style: AppStyles.body1(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showBottomPaymentInfoSheet(BuildContext context, {required PaymentsHistoryModel payment, required ContractModel contract}) {
      showModalBottomSheet(
        isScrollControlled: true,
        transitionAnimationController: controller,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
        ),
        context: context,
        builder: (context) {
          return FractionallySizedBox(
            heightFactor: 0.7,
            child: TransactionInfo(payment: payment, contract: contract),
          );
        },
      );
}

  void _show() async {
    filterDate = await showDateRangePicker(
        context: context,
        locale: Locale('ru'),
        firstDate: DateTime.now().subtract(Duration(days: 365)),
        lastDate: DateTime.now(),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              appBarTheme: AppBarTheme(
                titleTextStyle: AppStyles.subHeader1().copyWith(fontSize: 36.sp),
                toolbarTextStyle: AppStyles.header1().copyWith(fontSize: 36.sp),
                ),
            colorScheme: const ColorScheme.light(
              primary: Colors.red, // header background color
              onPrimary: Colors.white, // header text color
              onSurface: AppColors.darkGrey, // body text color
            ),
          ),
          child: child!,
          );
        }
    );
    setState(() { if(filterDate != null ) {
      _chosenDate = true;
    }});
  }

  void _showChooseType() async {
    await showModalBottomSheet(
      isScrollControlled: true,
      transitionAnimationController: controller,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
      ),
      context: context,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.23,
          child: _chooseType(),
        );
      },
    );
  }

}
