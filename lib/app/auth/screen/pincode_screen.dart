import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:reforce_platform/common/constants.dart';
import 'package:reforce_platform/gen/assets.gen.dart';
import '../../../common/static/export_all.dart';

class PincodeScreen extends StatelessWidget {
  const PincodeScreen({required this.phone, Key? key}) : super(key: key);

  final String phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(36.w, 70.h, 36.w, 45.h),
        child: Column(
          children: [
            Assets.images.logo.svg(),
            const Spacer(flex: 2),
            Text(
              K.authPincodeText,
              style: AppStyles.header1(),
            ),
            30.verticalSpace,
            AspectRatio(
              aspectRatio: 5 / 1,
              child: _pincodePinput(),
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }

  Pinput _pincodePinput() {
    return Pinput(
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          RegExp(r'[0-9]'),
        ),
      ],
      defaultPinTheme: PinTheme(
        textStyle: AppStyles.header1(),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.authPincode,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
