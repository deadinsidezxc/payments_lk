import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reforce_platform/common/static/styles.dart';
import 'package:reforce_platform/gen/assets.gen.dart';

class ObjectEventsTab extends StatelessWidget {
  const ObjectEventsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          10.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _makeChip(text: 'день'),
              _makeChip(text: 'неделя'),
              _makeChip(text: 'месяц'),
              _makeChip(text: 'период'),
              8.horizontalSpace,
              Assets.images.filture.svg(height: 28.h),
            ],
          )
        ],
      ),
    );
  }

  ActionChip _makeChip({required String text}) => ActionChip(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      padding: EdgeInsets.zero,
      side: const BorderSide(color: Color.fromRGBO(75, 78, 81, 1)),
      backgroundColor: Colors.white,
      label: Text(text,
          style: AppStyles.body2()
              .copyWith(color: const Color.fromRGBO(75, 78, 81, 1))),
      onPressed: () {});
}
