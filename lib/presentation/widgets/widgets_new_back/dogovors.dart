import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_api/main.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../core/dictionaries/colors.dart';
import '../../../core/dictionaries/styles.dart';

class Dogovors extends ConsumerWidget {

  const Dogovors({ Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checked = ref.watch(checkedProvider);
    if(checked.length > 4) {
      return GradientText(
        ' договоров',
        style: AppStyles.body3(),
        gradientDirection: GradientDirection.ttb,
        gradientType: GradientType.linear,
        colors: const [
          Color.fromRGBO(85, 88, 91, 1),
          AppColors.darkGrey,
        ],
      );
    } else {
      if(checked.length > 1) {
        return GradientText(
          ' договора',
          style: AppStyles.body3(),
          gradientDirection: GradientDirection.ttb,
          gradientType: GradientType.linear,
          colors: const [
            Color.fromRGBO(85, 88, 91, 1),
            AppColors.darkGrey,
          ],
        );
      } else {
        return GradientText(
          ' договор',
          style: AppStyles.body3(),
          gradientDirection: GradientDirection.ttb,
          gradientType: GradientType.linear,
          colors: const [
            Color.fromRGBO(85, 88, 91, 1),
            AppColors.darkGrey,
          ],
        );
      }
    }
  }
}

class DogovorsPayment extends ConsumerWidget {

  const DogovorsPayment({ Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checked = ref.watch(checkedProvider);
    if(checked.length > 4) {
      return Text(
        ' договоров',
        style: AppStyles.buttonOn(),
      );
    } else {
      if(checked.length > 1) {
        return Text(
          ' договора',
          style: AppStyles.buttonOn(),
        );
      } else {
        return Text(
          ' договор',
          style: AppStyles.buttonOn(),
        );
      }
    }
  }
}