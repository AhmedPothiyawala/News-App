import 'package:flutter/material.dart';

import '../Colors/color.dart';

TextStyle carousel_style(size, BuildContext context) {
  return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: size,
      color: Theme.of(context).brightness == Brightness.light
          ? AppColors.kPrimaryDarkColor
          : AppColors.kPrimaryLightColor);
}

TextStyle normal_style(context) {
  return TextStyle(
      color: Theme.of(context).brightness == Brightness.light
          ? AppColors.kPrimaryDarkColor
          : AppColors.kPrimaryLightColor,
      fontSize: 15);
}

TextStyle detailview_style() {
  return TextStyle(color: AppColors.kPrimaryDarkColor, fontSize: 15);
}

TextStyle list_style(context) {
  return TextStyle(
      color: Theme.of(context).brightness == Brightness.light
          ? AppColors.kPrimaryDarkColor
          : AppColors.kPrimaryLightColor,
      fontSize: 15);
}

TextStyle bold_style() {
  return TextStyle(
      color: AppColors.kPrimaryDarkColor,
      fontSize: 20,
      fontWeight: FontWeight.bold);
}

TextStyle menubold_style() {
  return TextStyle(
      color: AppColors.kPrimaryDarkColor,
      fontSize: 20,
      fontWeight: FontWeight.bold);
}

TextStyle settings(context) {
  return TextStyle(
      color: Theme.of(context).brightness == Brightness.light
          ? AppColors.kPrimaryDarkColor
          : AppColors.kPrimaryLightColor,
      fontSize: 20,
      fontWeight: FontWeight.bold);
}

TextStyle settings_normal(Color color) {
  return TextStyle(color: color, fontSize: 13, fontWeight: FontWeight.normal);
}
