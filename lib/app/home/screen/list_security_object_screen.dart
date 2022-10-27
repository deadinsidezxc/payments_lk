import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reforce_platform/app/home/screen/object/security_object_screen.dart';
import 'package:reforce_platform/gen/assets.gen.dart';
import '../../../common/static/export_all.dart';
import '../../../common/widgets/sos_alert.dart';
import '../data/model/security_object/security_object.dart';
import '../riverpod/riverpod.dart';

class ListSecurityObjectScreen extends ConsumerWidget {
  const ListSecurityObjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: _buildAppBar(),
      body: _body(ref),
    );
  }

  Widget _body(WidgetRef ref) {
    return ref.watch(listObjectsProvider).when(
          error: (error, stack) =>
              const Center(child: Text('Произошла неизвестная ошибка')),
          loading: () => const Center(
              child: CircularProgressIndicator(
                  color: Color.fromRGBO(239, 55, 62, 1))),
          data: (objects) => Container(
            padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 0),
            alignment: Alignment.center,
            child: RefreshIndicator(
              color: const Color.fromRGBO(239, 55, 62, 1),
              onRefresh: () => ref.refresh(listObjectsProvider.future),
              child: ListView.separated(
                itemCount: objects.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(height: 10),
                itemBuilder: (BuildContext context, int index) =>
                    _SecurityObjectCard(objects[index]),
              ),
            ),
          ),
        );
  }

  AppBar _buildAppBar() => AppBar(
        elevation: 0,
        title: Text('Главное',
            style: AppStyles.headerTitle()
                .copyWith(color: const Color.fromRGBO(75, 78, 81, 1))),
        actions: [
          IconButton(
              icon: Assets.images.search.svg(height: 24.h, width: 24.w),
              onPressed: () {}),
          IconButton(
              icon: Assets.images.sort.svg(height: 28.h, width: 28.w),
              onPressed: () {}),
        ],
        backgroundColor: Colors.white,
      );
}

class _SecurityObjectCard extends ConsumerWidget {
  const _SecurityObjectCard(this.object, {Key? key}) : super(key: key);

  final SecurityObject object;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(selectedIdProvider.notifier).state = object.id;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const SecurityObjectScreen(),
          ),
        );
      },
      child: _body(ref, object),
    );
  }

  Container _body(WidgetRef ref, SecurityObject object) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 6,
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.w, 16.h, 1.w, 14.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    12.verticalSpace,
                    _buildAddress(),
                    10.verticalSpace,
                    _buildIcons(),
                  ],
                ),
              ),
            ),
            Expanded(
              child: object.sosStatus == SosStatus.available
                  ? _buildSosButton(ref, id: object.id ?? 0)
                  : const SizedBox.shrink(),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          object.securityStatus.genSVG.svg(height: 40.h),
          10.horizontalSpace,
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(object.name ?? '',
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.header1()
                        .copyWith(color: const Color.fromRGBO(75, 78, 81, 1))),
                2.verticalSpace,
                Text(object.securityStatus.text,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.body1()
                        .copyWith(color: const Color.fromRGBO(75, 78, 81, 1)))
              ],
            ),
          )
        ],
      );

  Widget _buildAddress() => Text(
        object.address ?? '',
        style: AppStyles.body3()
            .copyWith(color: const Color.fromRGBO(166, 166, 166, 1)),
      );

  Widget _buildIcons() => Row(
        children: [
          if (object.electricityStatus != null) ...[
            object.electricityStatus!.genSVG.svg(height: 20.h),
            12.horizontalSpace,
          ],
          object.batteryStatus?.genSVG.svg(height: 15.h) ??
              const SizedBox.shrink(),
        ],
      );

  Builder _buildSosButton(WidgetRef ref, {required int id}) =>
      Builder(builder: (context) {
        return GestureDetector(
          onTap: () => showSosAlert(context, objectId: id),
          child: Container(
            padding: EdgeInsets.only(left: 3.w),
            decoration: ShapeDecoration(
              color: const Color.fromRGBO(75, 78, 81, 1),
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.horizontal(
                  left: Radius.elliptical(
                    16.r,
                    double.infinity,
                  ),
                ),
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              'SOS',
              style: AppStyles.subHeader2().copyWith(color: Colors.white),
            ),
          ),
        );
      });
}
