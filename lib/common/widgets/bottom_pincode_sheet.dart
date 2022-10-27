import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:reforce_platform/app/home/data/repository/sections_repository.dart';
import '../../gen/assets.gen.dart';
import '../static/export_all.dart';

Future<void> showBottomPincodeSheet(BuildContext context,
        {required List<int> sectionIds,
        required int objectId,
        required ProtectionStatus status}) =>
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r)),
      ),
      context: context,
      builder: (context) => _BottomPincodeSheet(
        objectId: objectId,
        sectionIds: sectionIds,
        status: status,
      ),
    );

enum ProtectionStatus { enable, disable }

class _BottomPincodeSheet extends StatelessWidget {
  _BottomPincodeSheet(
      {Key? key,
      required this.sectionIds,
      required this.objectId,
      required this.status})
      : super(key: key);

  final _controller = TextEditingController();
  final List<int> sectionIds;
  final int objectId;
  final ProtectionStatus status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30.w, 25.h, 30.w, 10.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Введите код доступа:', style: AppStyles.header1()),
          15.verticalSpace,
          Pinput(
              onCompleted: (pincode) {
                SectionsRepository().setSectionsStatus(
                    objectId: objectId,
                    sectionIds: sectionIds,
                    pincode: pincode,
                    status: status);
                Navigator.pop(context);
              },
              defaultPinTheme: PinTheme(
                width: 45.w,
                height: 45.h,
                textStyle: AppStyles.header1(),
                decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color.fromRGBO(75, 78, 81, 1)),
                    borderRadius: BorderRadius.circular(8.r)),
              ),
              controller: _controller,
              useNativeKeyboard: false),
          const Spacer(flex: 2),
          _VirtualKeyboard(controller: _controller, status: status),
          const Spacer(),
          Text(
              '${status == ProtectionStatus.enable ? 'Постановка' : 'Снятие'} может занять пару минут, пожалуйста, подождите и обновите страницу, чтобы убедиться, что ваш объект был ${status == ProtectionStatus.enable ? 'поставлен на защиту' : 'снят с защиты'}',
              style: AppStyles.body3())
        ],
      ),
    );
  }
}

class _VirtualKeyboard extends StatelessWidget {
  const _VirtualKeyboard({required this.controller, required this.status});

  final TextEditingController controller;
  final ProtectionStatus status;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 3,
                  color: const Color.fromRGBO(239, 55, 62, 1),
                ),
              ),
              child: Column(
                children: [
                  16.verticalSpace,
                  _buildKeyboardRow(['1', '2', '3']),
                  26.verticalSpace,
                  _buildKeyboardRow(['4', '5', '6']),
                  26.verticalSpace,
                  _buildKeyboardRow(['7', '8', '9']),
                  26.verticalSpace,
                  _buildLastKeyboardRow(),
                  16.verticalSpace,
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildKeyboardRow(List<String> numbers) =>
      Row(children: [for (final numb in numbers) _numberButton(numb)]);

  Widget _buildLastKeyboardRow() => Row(children: [
        const Spacer(),
        _numberButton('0'),
        Expanded(
          child: GestureDetector(
            onTap: () {
              controller.delete();
            },
            child: Assets.images.clear.svg(width: 28.w),
          ),
        )
      ]);

  Expanded _numberButton(String number) => Expanded(
        child: GestureDetector(
          onTap: () {
            if (controller.text.length < 4) {
              controller.text += number;
            }
          },
          child: Text(
            number,
            style: AppStyles.header1(),
            textAlign: TextAlign.center,
          ),
        ),
      );
}
