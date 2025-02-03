import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parotia_task/core/theme/colors.dart';
import 'package:parotia_task/core/theme/font_weight_helper.dart';

class TextStyles {
  static TextStyle font20BlackMedium = getTextStyle(
      color: Colors.black,
      fontWeight: FontWeightHelper.regular,
      fontSize: 22.sp);

  static TextStyle font20BlackBold = getTextStyle(
      color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.sp);

  static TextStyle font18lightGreyLight = getTextStyle(
      color: ColorsManager.lightGreyColor,
      fontWeight: FontWeightHelper.light,
      fontSize: 18.sp);

  static TextStyle font17darkGreyLight = getTextStyle(
      color: ColorsManager.darkGreyColor,
      fontWeight: FontWeightHelper.regular,
      fontSize: 15.sp);

  // static TextStyle font17darkGreyLight = getTextStyle(
  //     color: ColorsManager.darkGreyColor,
  //     fontWeight: FontWeightHelper.regular,
  //     fontSize: 17.sp);

  static TextStyle getTextStyle(
      {Color? color, FontWeight? fontWeight, double? fontSize}) {
    return TextStyle(
      fontSize: fontSize ?? 14.sp,
      fontWeight: fontWeight ?? FontWeightHelper.regular,
      color: color ?? Colors.black,
      // fontFamily: GoogleFonts.akatab().fontFamily,
    );
  }
}

extension TextStyleHelper on TextStyle {
  TextStyle get w400 => copyWith(fontWeight: FontWeightHelper.regular);
  TextStyle get w500 => copyWith(fontWeight: FontWeightHelper.medium);
  TextStyle get w600 => copyWith(fontWeight: FontWeightHelper.semiBold);
  TextStyle get w700 => copyWith(fontWeight: FontWeightHelper.bold);
  TextStyle get w800 => copyWith(fontWeight: FontWeightHelper.extraBold);
}
