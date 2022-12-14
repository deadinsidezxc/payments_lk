import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:rick_and_morty_api/core/dictionaries/colors.dart';
import 'package:rick_and_morty_api/data/contracts_data/contract_model/contract_model.dart';
import 'package:rick_and_morty_api/main.dart';
import 'package:rick_and_morty_api/presentation/widgets/payments_one.dart';


import '../../core/dictionaries/styles.dart';
import '../../gen/assets.gen.dart';
import '../pages/contract_info_page.dart';

class CustomListTile extends ConsumerStatefulWidget {
  final ContractModel contract;

  const CustomListTile({ Key? key, required this.contract }) : super(key: key);

  @override
  ListTileState createState() => ListTileState();
}

class ListTileState extends ConsumerState<CustomListTile> with  ShowableBottomPayOneSheet, TickerProviderStateMixin {
  bool _isClicked = false;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = BottomSheet.createAnimationController(this);
    controller.duration = Duration(milliseconds: 500);
    controller.reverseDuration = Duration(milliseconds: 300);

    ref.read(summProvider);
    ref.read(checkedProvider);
    ref.read(countProvider);
  }

  void saveOrDeleteChecked() {
    final checked = ref.watch(checkedProvider.notifier);
    final counter = ref.watch(countProvider.notifier);
    bool doupletFlag = false;

    if (checked.state.isNotEmpty) {
      for (var value in checked.state) {
        if (widget.contract.id!.toLowerCase() == value.id!.toLowerCase()) {
          setState(() {
            doupletFlag = true;
            checked.state.remove(value);
          });
          counter.state--;
          break;
        }
      }
      if (!doupletFlag) {
        setState(() {
          checked.state.add(widget.contract);
        });
        counter.state++;
      }
    } else {
      setState(() {
        checked.state.add(widget.contract);
      });
     counter.state++;
    }
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

  String _formatDate(String? dateRaw) {
    if(dateRaw != null) {
      String _date = '';
      String _str = dateRaw.substring(0, dateRaw.indexOf(' '));
      List<String> _dateArr = _str.split('.');
      switch(_dateArr[1]) {
        case '01': _dateArr[1] = '????????????';
        break;
        case '02': _dateArr[1] = '??????????????';
        break;
        case '03': _dateArr[1] = '??????????';
        break;
        case '04': _dateArr[1] = '????????????';
        break;
        case '05': _dateArr[1] = '??????';
        break;
        case '06': _dateArr[1] = '????????';
        break;
        case '07': _dateArr[1] = '????????';
        break;
        case '08': _dateArr[1] = '??????????????';
        break;
        case '09': _dateArr[1] = '????????????????';
        break;
        case '10': _dateArr[1] = '??????????????';
        break;
        case '11': _dateArr[1] = '????????????';
        break;
        case '12': _dateArr[1] = '??????????????';
        break;
      }

      _date = '${_dateArr[0]} ${_dateArr[1]} ${_dateArr[2]}';

      return _date;
    } else {
      return 'unknown';
    }
  }

  String _payDay(String? dateRaw) {
    if(dateRaw == null || widget.contract.fee == 0) {
      return dateRaw == null ? 'unknown' : 'free contract';
    } else {
      if(widget.contract.balance!.isNegative) {
        return '???????? ${_formatValue(widget.contract.balance!.abs())} ??';
      } else {
        int months = widget.contract.balance! ~/ widget.contract.fee! + 1;
        String dateStr = '';
        switch((DateTime.now().month + months) % 12) {
          case 0: dateStr = '??????????????';
          break;
          case 1: dateStr = '????????????';
          break;
          case 2: dateStr = '??????????????';
          break;
          case 3: dateStr = '??????????';
          break;
          case 4: dateStr = '????????????';
          break;
          case 5: dateStr = '??????';
          break;
          case 6: dateStr = '????????';
          break;
          case 7: dateStr = '????????';
          break;
          case 8: dateStr = '??????????????';
          break;
          case 9: dateStr = '????????????????';
          break;
          case 10: dateStr = '??????????????';
          break;
          case 11: dateStr = '????????????';
          break;
          case 12: dateStr = '??????????????';
          break;
        }
        return '???????????? ???? 1 $dateStr ';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.w, left: 16.w),
      child:  _listTile(),
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     _checkBox(),
      //     11.horizontalSpace,
      //
      //   ],
      // ),
    );
  }

  // Widget _checkBox() {
  //   final summ = ref.watch(summProvider.notifier);
  //   return Container(
  //     width: 18.w,
  //     height: 18.h,
  //     alignment: Alignment.center,
  //     child: Transform.scale(
  //       scale: 1.1,
  //       child: Checkbox(
  //         materialTapTargetSize: MaterialTapTargetSize.padded,
  //         visualDensity: VisualDensity.adaptivePlatformDensity,
  //         value: _isClicked,
  //         onChanged: (bool? newValue) {
  //           setState(() {
  //             _isClicked = newValue!;
  //             saveOrDeleteChecked();
  //             if(_isClicked) {
  //               summ.state += widget.contract.fee ?? 0;
  //             } else {
  //               summ.state -= widget.contract.fee ?? 0;
  //             }
  //           });
  //         },
  //         side: BorderSide(
  //           color: AppColors.grey,
  //           width: 1.w,
  //         ),
  //         activeColor: AppColors.primary,
  //         checkColor: Colors.white,
  //       ),
  //     ),
  //   );
  // }

  Widget _listTile() {
    return MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            opaque: false,
            transitionsBuilder: (contextPayments, a1, a2, widget1) {
              return Opacity(
                opacity: a1.value,
                child: CharacterInfo(contract: widget.contract),
              );
            },
            transitionDuration: const Duration(milliseconds: 900),
            pageBuilder: (contextPayments, _, __) {return Container();},
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.darkGrey.withOpacity(0.08),
              blurRadius: 10.0,
              spreadRadius: 4.0,
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 14.w),
        width: 328.w,
        height: 150.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Assets.icons.fileok.svg(
                  width: 35.w,
                  height: 38.h,
                  color: widget.contract.balance!.isNegative ? AppColors.primary : AppColors.darkGrey,
                ),
                8.horizontalSpace,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 259.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.contract.number == '????????????????-1' //??????????????!
                            ? '????????-1 ???? ${_formatDate(widget.contract.date)}'
                            : '${widget.contract.number} ???? ${_formatDate(widget.contract.date)}',
                            overflow: TextOverflow.fade,
                            style: AppStyles.headerTitle().copyWith(fontSize: 18.sp),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Ionicons.chevron_forward,
                                size: 18.w,
                                color: AppColors.darkGrey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    3.verticalSpace,
                    Text(
                      '${widget.contract.type}',
                      style: AppStyles.body1(),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 12.h, bottom: 8.h),
              child: Container(
                height: 26.h,
                width: 275.w,
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: Text(
                        _formatAddress(widget.contract.address[0].addressName),
                        style: AppStyles.body3().copyWith(color: Color.fromRGBO(166, 166, 166, 1), height: 0.92),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 296.w,
              height: 1.h,
              color: AppColors.lightDarkGrey,
            ),
            8.verticalSpace,
            Row(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _autoPay(),
                    5.horizontalSpace,
                    Container(
                      height: 20.h,
                      alignment: Alignment.centerLeft,
                      child: _topUpPayment(),
                    ),
                  ],
                ),
                //16.horizontalSpace,
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      _payDay(widget.contract.date),
                      style: AppStyles.body3().copyWith(
                        height: 0.92,
                        color: widget.contract.balance!.isNegative
                          ? AppColors.primary
                          : AppColors.darkGreen,
                      ),
                    ),
                  ),
                ),
                4.horizontalSpace,
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _topUpPayment() {
    if (widget.contract.balance!.isNegative) {
      return MaterialButton(
        padding: EdgeInsets.zero,
        //materialTapTargetSize: MaterialTapTargetSize.padded,
        onPressed:() async {
          showBottomPayOneSheet(context, controller: controller, contract: widget.contract);
        },
        child: Container(
          width: 120.w,
          height: 20.h,
          alignment: Alignment.centerLeft,
          child: Text(
            '??????????????????',
            style: AppStyles.subHeader2().copyWith(color: AppColors.primary),
          ),
        ),
      );
    } else {
      return Text(
        '???????????? ${_formatValue(widget.contract.balance!)}',
        style: AppStyles.subHeader2().copyWith(color: AppColors.darkGreen),
      );
    }
  }

  Widget _autoPay() {
    return widget.contract.autopay
        ?  const Icon(
      Ionicons.sync,
      size: 18,
      color: AppColors.darkGreen,
    )
        : SizedBox.shrink();
  }

  String _formatAddress(String? addressRaw) {
    if(addressRaw == null) {
      return 'unknown';
    } else {
      String _str = addressRaw.replaceAll(RegExp(r'[^\p{Alphabetic}\p{Mark}\p{Decimal_Number}\p{Connector_Punctuation}\p{Join_Control}\s]+', unicode: true),'');
      List<String> _strArr = _str.split(' ');
      String _address = '';
      _address = _address + '${_strArr[3]}, ${_strArr[5]} ${_strArr[6]}., ${_strArr[7]} ???${_strArr[9]}, ${_strArr[10]} ${_strArr[11].toUpperCase()}';

      return _address;
    }
  }

}
