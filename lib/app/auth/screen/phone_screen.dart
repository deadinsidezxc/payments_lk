import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:reforce_platform/common/static/styles.dart';
import 'package:reforce_platform/common/widgets/buttons.dart';
import 'package:reforce_platform/gen/assets.gen.dart';

import '../riverpod/riverpod.dart';
import 'pincode_screen.dart';

class PhoneAuthScreen extends ConsumerWidget {
  PhoneAuthScreen({Key? key}) : super(key: key);

  final _maskFormatter = MaskTextInputFormatter(
      mask: '+7 (###) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      phoneAuthProvider,
      ((_, next) {
        if (next == PhoneAuthState.smsSended) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    PincodeScreen(phone: _maskFormatter.getUnmaskedText())),
          );
        }
      }),
    );

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding:
              EdgeInsets.only(left: 36.w, right: 36.w, top: 70.h, bottom: 45.h),
          child: Column(
            children: [
              Assets.images.logo.svg(),
              const Spacer(flex: 2),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: _buildContent(ref),
              ),
              const Spacer(flex: 3),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: _buildButtons(ref),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column _buildContent(WidgetRef ref) {
    final state = ref.watch(phoneAuthProvider);
    return Column(
      children: [
        Text(
          'Введите ваш номер телефона для доступа в личный кабинет',
          style: AppStyles.headerTitle(),
          textAlign: TextAlign.center,
        ),
        45.verticalSpace,
        if (state == PhoneAuthState.initial ||
            state == PhoneAuthState.smsSended)
          _buildTextField(isError: false),
        if (state == PhoneAuthState.phoneNotCorrect)
          _buildErrorColumn(text: 'Номер введен некорректно'),
        if (state == PhoneAuthState.phoneNotFound)
          _buildErrorColumn(text: 'Данного номера нет в базе'),
      ],
    );
  }

  Column _buildErrorColumn({required String text}) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _buildTextField(isError: true),
      10.verticalSpace,
      Text(
        text,
        style: AppStyles.subHeader2()
            .copyWith(color: const Color.fromRGBO(244, 126, 40, 1)),
      )
    ]);
  }

  TextField _buildTextField({required bool isError}) {
    final borderStyle = _textFieldBorder(isError
        ? const Color.fromRGBO(244, 126, 40, 1)
        : const Color.fromRGBO(239, 55, 62, 1));

    final suffixIcon = isError
        ? const Icon(
            Icons.error,
            color: Color.fromRGBO(244, 126, 40, 1),
          )
        : null;

    return TextField(
      inputFormatters: [_maskFormatter],
      keyboardType: TextInputType.number,
      style: AppStyles.body1(),
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          enabledBorder: borderStyle,
          focusedBorder: borderStyle,
          labelStyle: AppStyles.body2()
              .copyWith(color: const Color.fromRGBO(177, 178, 178, 1)),
          labelText: 'Номер телефона'),
    );
  }

  OutlineInputBorder _textFieldBorder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: color,
      ),
    );
  }

  Row _buildButtons(WidgetRef ref) {
    return Row(
      children: [
        Expanded(
            child: PlatformOultinedButton(onPressed: () {}, text: 'назад')),
        8.horizontalSpace,
        Expanded(
          child: PlatformElevatedButton(
              onPressed: () {
                ref
                    .read(phoneAuthProvider.notifier)
                    .sendSMS(phone: _maskFormatter.getUnmaskedText());
              },
              text: 'далее'),
        ),
      ],
    );
  }
}
