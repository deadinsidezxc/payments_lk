import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reforce_platform/app/home/data/repository/objects_repository.dart';
import 'package:reforce_platform/common/static/styles.dart';
import 'package:reforce_platform/common/widgets/buttons.dart';
import 'package:reforce_platform/gen/assets.gen.dart';

final _sosIdProvider = StateProvider<int?>((ref) => null);

Future<void> showSosAlert(BuildContext context, {required int objectId}) =>
    showDialog(
        context: context, builder: (context) => _SosAlert(objectId: objectId));

class _SosAlert extends ConsumerWidget {
  const _SosAlert({
    required this.objectId,
    Key? key,
  }) : super(key: key);

  final int objectId;

  @override
  Widget build(BuildContext context, WidgetRef ref) => _buildBody(ref);

  Builder _buildBody(WidgetRef ref) {
    return Builder(
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r)),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20.h, horizontal: 36.w),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Вызов группы быстрого реагирования через:',
                      textAlign: TextAlign.center,
                      style: AppStyles.subHeader1()),
                  15.verticalSpace,
                  _SosTimer(start: 15, end: 0, onEnd: showGbrAlert),
                  20.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: PlatformElevatedButton(
                              onPressed: () => Navigator.pop(context),
                              text: 'отменить')),
                      15.horizontalSpace,
                      Expanded(
                          child: PlatformOultinedButton(
                              onPressed: () => showGbrAlert(context, ref),
                              text: 'вызвать'))
                    ],
                  )
                ],
              ),
            ));
  }

  void showGbrAlert(BuildContext context, WidgetRef ref) {
    ref.read(_sosIdProvider.notifier).state = objectId;
    Navigator.pop(context);
    showDialog(context: context, builder: (_) => const _GBRCalledAlert());
  }
}

class _SosTimer extends ConsumerStatefulWidget {
  const _SosTimer({
    required this.start,
    required this.end,
    required this.onEnd,
  });

  final double start;
  final double end;
  final void Function(BuildContext context, WidgetRef ref) onEnd;

  @override
  ConsumerState<_SosTimer> createState() => _SosTimerState();
}

class _SosTimerState extends ConsumerState<_SosTimer> {
  @override
  Widget build(BuildContext context) => _buildBody();

  TweenAnimationBuilder<double> _buildBody() {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: widget.start, end: widget.end),
      duration: Duration(seconds: (widget.start - widget.end).toInt()),
      onEnd: () => widget.onEnd(context, ref),
      builder: (context, value, _) => Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 110.h,
            width: 110.h,
            child: CircularProgressIndicator(
                value: value / widget.start,
                strokeWidth: 6,
                color: const Color.fromRGBO(167, 43, 42, 1),
                backgroundColor: const Color.fromRGBO(215, 216, 214, 1)),
          ),
          Text(value.round().toString(), style: AppStyles.alertNumber())
        ],
      ),
    );
  }
}

class _GBRCalledAlert extends ConsumerStatefulWidget {
  const _GBRCalledAlert();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GBRState();
}

class _GBRState extends ConsumerState<_GBRCalledAlert> {
  var _animationIsStarted = false;

  @override
  Widget build(BuildContext context) => _buildBody();

  Builder _buildBody() {
    return Builder(
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r)),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
              content: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Группа уже направлена к вам!',
                          style: AppStyles.subHeader1(),
                          textAlign: TextAlign.center),
                      SizedBox(height: 0.14.sh),
                      SizedBox(
                          width: 0.4.sw,
                          child: PlatformElevatedButton(
                              onPressed: () => Navigator.pop(context),
                              text: 'готово'))
                    ],
                  ),
                  AnimatedPositioned(
                      left: _animationIsStarted ? 0 : 200,
                      right: 0,
                      curve: Curves.fastLinearToSlowEaseIn,
                      duration: const Duration(milliseconds: 600),
                      child: Assets.images.car.image(height: 80.h))
                ],
              ),
            ));
  }

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 100),
        () => setState(() => _animationIsStarted = true));

    final repository = ListSecurityObjectsRepository();
    final id = ref.read(_sosIdProvider);
    repository.callGBR(objectId: id ?? 0);
    super.initState();
  }

  @override
  void dispose() {
    ref.invalidate(_sosIdProvider);
    super.dispose();
  }
}
