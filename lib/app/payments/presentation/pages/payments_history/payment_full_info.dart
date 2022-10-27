import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/static/colors.dart';
import '../../../../../common/static/styles.dart';
import '../../../data/contracts_data/contract_model/contract_model.dart';
import '../../../data/payment_history_data/payments_history_model/payments_history_model.dart';
import '../../../data/payment_history_data/services_model/services_model.dart';

class TransactionInfo extends StatelessWidget {
  final PaymentsHistoryModel payment;
  final ContractModel contract;

  const TransactionInfo({Key? key, required this.payment, required this.contract}) : super(key: key);


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

  Color _color() {
    return payment.type == 'unknown'
        ? AppColors.lightDarkGrey
        : payment.type == 'lk' || payment.type == 'site'
            ? AppColors.darkGreen
            : AppColors.darkGrey;
  }

  String _checkType(String? type) {
    if(type == null) {
      return 'null';
    } else {
      switch(type) {
        case 'unknown' : return 'неизвестно';
        case 'lk' : return 'оплата через приложение';
        case 'site' : return 'оплата через сайт';
      }
    }
    return 'абонентская плата';
  }

  String _formatDate(String? dateRaw) {
    if(dateRaw == null) {
      return 'null date';
    } else {
      return dateRaw.split(' ')[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _header(payment),
        _body(),
      ],
    );
  }

  Widget _header(PaymentsHistoryModel payment) {
    return Container(
      width: 1.sw,
      height: 220.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16.r),
          topLeft: Radius.circular(16.r),
        ),
        color: _color(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          12.verticalSpace,
          Text(
            payment.date!,
            style: AppStyles.subHeader2().copyWith(color: Colors.white),
          ),
          33.verticalSpace,
          Text(
            payment.type == 'unknown'
                ? 'Неизвестно'
                : payment.type == 'lk' || payment.type == 'site' ? 'Пополнение' : 'Списание',
            style: AppStyles.buttonOn().copyWith(color: Colors.white, fontSize: 16.sp),
          ),
          12.verticalSpace,
          Text(
            payment.type == 'unknown'
                ? '? р'
                : payment.type == 'lk' || payment.type == 'site'
                ? '+ ${_formatValue(payment.price!.abs())} р'
                : '- ${_formatValue(payment.price!.abs())} р',
            style: AppStyles.header1().copyWith(color: Colors.white, fontSize: 36.sp),
          ),
          33.verticalSpace,
          Text(
            _checkType(payment.type),
            style: AppStyles.body3().copyWith(color: Colors.white, fontSize: 14.sp),
          ),
        ],
      ),
    );
  }

  Widget _body() {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Договор № ${contract.number} от ${_formatDate(contract.date)}',
                  style: AppStyles.subHeader1(),
                ),
                12.verticalSpace,
                Text(
                  '${contract.type}',
                  style: AppStyles.body3().copyWith(fontSize: 14.sp),
                ),
                24.verticalSpace,
                _billBody(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _billBody() {
    if(payment.services.isEmpty) {
      return SizedBox.shrink();
    } else {
      return ListView.separated(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: payment.services.length,
        separatorBuilder: (context, index) => 45.verticalSpace,
        itemBuilder: (context, index) => _serviceTile(payment.services[index]),
      );
    }
  }

  Widget _serviceTile(Services service) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${service.name}',
          style: AppStyles.subHeader1().copyWith(decoration: TextDecoration.underline),
        ),
        12.verticalSpace,
        Text(
          '${service.address}',
          style: AppStyles.body3(),
        ),
        16.verticalSpace,
        Row(
          children: [
            Text(
              '${service.type}',
              style: AppStyles.subHeader2(),
            ),
            Expanded(
              child: Text(
                '${(service.price ?? 0) * (service.count ?? 0)} р',
                textAlign: TextAlign.end,
                style: AppStyles.header1().copyWith(fontSize: 16.sp),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
