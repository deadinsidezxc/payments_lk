import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reforce_platform/gen/assets.gen.dart';
import '../../../../common/static/styles.dart';
import '../../../../common/widgets/bottom_pincode_sheet.dart';
import '../../data/model/security_object/security_object.dart';
import '../../data/model/security_section/security_section.dart';

class ObjectInformationTab extends StatelessWidget {
  const ObjectInformationTab({required this.object, Key? key})
      : super(key: key);

  final SecurityObject object;

  @override
  Widget build(BuildContext context) {
    return _body();
  }

  SingleChildScrollView _body() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            15.verticalSpace,
            Text('Управление охраны',
                style: AppStyles.subHeader1()
                    .copyWith(color: const Color.fromRGBO(75, 78, 81, 1))),
            18.verticalSpace,
            SizedBox(
              height: 150,
              child: Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) => _ObjectSectionItem(
                        section: object.sections![index],
                        objectId: object.id ?? 0)),
                    separatorBuilder: (BuildContext context, int index) =>
                        18.horizontalSpace,
                    itemCount: object.sections?.length ?? 0),
              ),
            ),
            10.verticalSpace,
            Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: Row(
                children: [
                  Text('Устройства',
                      style: AppStyles.subHeader1().copyWith(
                          color: const Color.fromRGBO(75, 78, 81, 1))),
                  const Spacer(),
                  Assets.images.edit.svg(height: 28.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ObjectSectionItem extends StatelessWidget {
  const _ObjectSectionItem(
      {required this.section, required this.objectId, Key? key})
      : super(key: key);

  final int objectId;
  final SecuritySection section;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showBottomPincodeSheet(context,
          sectionIds: [section.id ?? 0],
          objectId: objectId,
          status: section.securityStatus == SecuritySectionStatus.protected
              ? ProtectionStatus.disable
              : ProtectionStatus.enable),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          section.securityStatus!.circleSVG.svg(width: 0.23.sw),
          8.verticalSpace,
          Text(section.name ?? '',
              style: AppStyles.body3()
                  .copyWith(color: const Color.fromRGBO(75, 78, 81, 1))),
          Text(section.securityStatus!.text,
              style: AppStyles.body3()
                  .copyWith(color: const Color.fromRGBO(177, 178, 178, 1))),
        ],
      ),
    );
  }
}
