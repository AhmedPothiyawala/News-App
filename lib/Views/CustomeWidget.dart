import 'package:flutter_mvvm_template/Remote/Colors/color.dart';
import 'package:flutter_mvvm_template/Remote/TextStyle/CustomeTextStyle.dart';
import 'package:flutter/material.dart';

BottomNavigationBarItem BottomBarItem(String label, IconData iconData) {
  return BottomNavigationBarItem(
      icon: Icon(iconData),
      label: label,
      backgroundColor: AppColors.kPrimaryColor);
}

Text HeadingText(String label, double size, BuildContext context) {
  return Text(label, maxLines: 1, style: carousel_style(size, context));
}

Text CustomeText(
    String label, int maxliines, bool listile, BuildContext context) {
  return Text(label,
      maxLines: maxliines,
      style: listile ? list_style(context) : normal_style(context));
}

Text BoldText(String label, int maxliines) {
  return Text(label, maxLines: maxliines, style: bold_style());
}

Text MenuText(String label, int maxliines) {
  return Text(label, maxLines: maxliines, style: menubold_style());
}

Text DetailText(String label) {
  return Text(label, style: detailview_style());
}

Text SettingText(String label, BuildContext context) {
  return Text(label, style: settings(context));
}

Text SettingNormal(String label, Color color) {
  return Text(label, style: settings_normal(color));
}
