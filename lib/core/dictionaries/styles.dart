import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_api/core/dictionaries/colors.dart';

class AppStyles {
  static TextStyle _basicFont() =>
      const TextStyle(fontFamily: 'HelveticaNeueCyr', color: AppColors.darkGrey);

  // Figma - Заголовок основной
  static TextStyle header1() =>
      _basicFont().copyWith(fontSize: 20.sp, fontWeight: FontWeight.w400);

  // Figma - Заголовок вкладки
  static TextStyle headerTitle() =>
      _basicFont().copyWith(fontSize: 20.sp, fontWeight: FontWeight.w500);

  // Figma - заголовок онбординг
  static TextStyle headerOnboarding() =>
      _basicFont().copyWith(fontSize: 24.sp, fontWeight: FontWeight.w500);

  // Figma - подзаголовок главный
  static TextStyle subHeader1() =>
      _basicFont().copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500);

  // Figma - подзаголовок
  static TextStyle subHeader2() =>
      _basicFont().copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500);

  // Figma - Тело текста главный
  static TextStyle body1() =>
      _basicFont().copyWith(fontSize: 16.sp, fontWeight: FontWeight.w300);

  // Figma - Тело текста
  static TextStyle body2() =>
      _basicFont().copyWith(fontSize: 14.sp, fontWeight: FontWeight.w300);

  // Figma - Текст мелкий
  static TextStyle body3() =>
      _basicFont().copyWith(fontSize: 12.sp, fontWeight: FontWeight.w300);

  // Figma - Тело - ссылка
  static TextStyle bodyLink() => _basicFont().copyWith(
      fontSize: 13.sp,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.underline);

  // Figma - Кнопка вкл
  static TextStyle buttonOn() =>
      _basicFont().copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500);

  // Figma - Кнопка выкл
  static TextStyle buttonOff() =>
      _basicFont().copyWith(fontSize: 14.sp, fontWeight: FontWeight.w300);
}
