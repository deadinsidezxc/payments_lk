import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reforce_platform/app/payments/presentation/widgets/widgets_new_back/payments.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../../../../../common/static/colors.dart';
import '../../../../../common/static/styles.dart';
import '../../../riverpod/riverpod.dart';
import 'dogovors.dart';

class CustomBottomSheet extends ConsumerStatefulWidget {
  const CustomBottomSheet({ Key? key,}) : super(key: key);

  @override
  CustomBottomSheetState createState() => CustomBottomSheetState();
}

mixin ShowableBottomPaySheet {
  Future<void> showBottomPaySheet(BuildContext context, {required AnimationController controller}) async {
    await showModalBottomSheet(
      isScrollControlled: true,
      transitionAnimationController: controller,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r)),
      ),
      context: context,
      builder: (context) => FractionallySizedBox(
        heightFactor: 0.4,
        child: Payments(),
      ),
    );
  }
}

class CustomBottomSheetState extends ConsumerState<CustomBottomSheet> with ShowableBottomPaySheet, TickerProviderStateMixin{
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    ref.read(summProvider);
    ref.read(checkedProvider);
    ref.read(countProvider);

    controller = BottomSheet.createAnimationController(this);
    controller.duration = Duration(milliseconds: 500);
    controller.reverseDuration = Duration(milliseconds: 300);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
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

  @override
  Widget build(BuildContext context) {
    final summ = ref.watch(summProvider);
    final checked = ref.watch(checkedProvider);
    final counter = ref.watch(countProvider);
    return AnimatedSize(
      curve: Curves.easeIn,
      duration: Duration(milliseconds: 300),
      alignment: Alignment.topCenter,
      child: Container(
        height: checked.isNotEmpty ? 60.h : 0.h,
        width: 1.sw,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.primaryBackgroundContracts,
          border: Border(
            top: BorderSide(color: Colors.black12, width: 1.w),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.h),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  width: 160.w,
                  height: 40.h,
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GradientText(
                        '${_formatValue(summ)} Р в месяц',
                        style: AppStyles.subHeader1(),
                        gradientDirection: GradientDirection.ttb,
                        gradientType: GradientType.linear,
                        colors: const [
                          Color.fromRGBO(85, 88, 91, 1),
                          AppColors.darkGrey,
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GradientText(
                            '$counter',
                            style: AppStyles.body3(),
                            gradientDirection: GradientDirection.ttb,
                            gradientType: GradientType.linear,
                            colors: const [
                              Color.fromRGBO(85, 88, 91, 1),
                              AppColors.darkGrey,
                            ],
                          ),
                          const Dogovors(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //50.horizontalSpace,
              SizedBox(
                height: 38.h,
                width: 95.w,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.white,
                    primary: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  onPressed: () {
                    showBottomPaySheet(context, controller: controller);
                  },
                  child: Center(
                    child: Text(
                      'оплатить',
                      style: AppStyles.buttonOn().copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
