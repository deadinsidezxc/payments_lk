import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reforce_platform/app/home/data/model/security_object/security_object.dart';
import 'package:reforce_platform/app/home/riverpod/riverpod.dart';
import 'package:reforce_platform/common/static/styles.dart';
import 'package:reforce_platform/common/string.dart';
import 'package:reforce_platform/common/widgets/bottom_pincode_sheet.dart';
import '../../../../common/widgets/sos_alert.dart';
import '../../../../gen/assets.gen.dart';
import 'object_tabbar.dart';

class SecurityObjectScreen extends ConsumerWidget {
  const SecurityObjectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final object = ref.watch(selectedObjectProvider);
    return LayoutBuilder(
      builder: (context, constraints) => RefreshIndicator(
        color: const Color.fromRGBO(239, 55, 62, 1),
        onRefresh: () => ref.refresh(listObjectsProvider.future),
        child: object == null
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: SizedBox(
                  height: constraints.maxHeight,
                  child: Scaffold(
                    appBar: _appBar(context, ref, object),
                    body: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildHeader(object),
                        Expanded(child: ObjectTabbar(object: object)),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  Builder _buildHeader(SecurityObject object) {
    return Builder(
      builder: (context) => Container(
        decoration: ShapeDecoration(
          color: _securityStatusColor(object.securityStatus),
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(
                double.infinity,
                40.r,
              ),
            ),
          ),
        ),
        padding: EdgeInsets.only(top: 3.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(object.securityStatus.text.capitalize,
                style: AppStyles.headerTitle().copyWith(color: Colors.white)),
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 10.h),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                object.electricityStatus!.genSVG.svg(
                                    color: Colors.white,
                                    height: 18.h,
                                    width: 18.w),
                                8.horizontalSpace,
                                Text(object.electricityStatus!.text,
                                    style: AppStyles.body3()
                                        .copyWith(color: Colors.white)),
                              ],
                            ),
                            5.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                object.batteryStatus!.genSVG.svg(
                                    color: Colors.white,
                                    height: 11.h,
                                    width: 21.w),
                                8.horizontalSpace,
                                Text('батарея\n100%',
                                    style: AppStyles.body3()
                                        .copyWith(color: Colors.white)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () => showBottomPincodeSheet(context,
                          objectId: object.id ?? 0,
                          sectionIds:
                              object.sections?.map((e) => e.id ?? 0).toList() ??
                                  [],
                          status: object.securityStatus ==
                                  SecurityObjectStatus.notProtected
                              ? ProtectionStatus.enable
                              : ProtectionStatus.disable),
                      child: object.securityStatus.genCircleSVG
                          .svg(width: 0.28.sw),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        8.horizontalSpace,
                        object.sosStatus == SosStatus.available
                            ? GestureDetector(
                                onTap: () => showSosAlert(context,
                                    objectId: object.id ?? 0),
                                child: object.sosStatus!.genSVG
                                    .svg(height: 0.13.sw))
                            : object.sosStatus!.genSVG.svg(height: 0.13.sw)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            25.verticalSpace
          ],
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context, WidgetRef ref, SecurityObject object) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: _securityStatusColor(object.securityStatus),
      leading: IconButton(
        icon: Assets.images.backButton.svg(height: 32.h),
        onPressed: () => {Navigator.pop(context)},
      ),
      title: Text(object.name ?? '',
          style: AppStyles.headerTitle().copyWith(color: Colors.white)),
      actions: [
        IconButton(
          icon: Assets.images.settings.svg(height: 23.h),
          onPressed: () {},
        ),
      ],
    );
  }

  Color _securityStatusColor(SecurityObjectStatus status) {
    switch (status) {
      case SecurityObjectStatus.protected:
        return const Color.fromRGBO(75, 78, 81, 1);
      case SecurityObjectStatus.partially:
        return const Color.fromRGBO(75, 78, 81, 1);
      case SecurityObjectStatus.notProtected:
        return const Color.fromRGBO(177, 178, 178, 1);
      case SecurityObjectStatus.incident:
        return const Color.fromRGBO(167, 43, 42, 1);
      case SecurityObjectStatus.undefined:
        return const Color.fromRGBO(177, 178, 178, 1);
    }
  }
}
