import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Remote/Colors/color.dart';

class SetingList extends StatelessWidget {
  final title, checkbox;
  SetingList(this.title, this.checkbox);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        tileColor: Theme.of(context).brightness == Brightness.light
            ? AppColors.kPrimaryLightColor
            : AppColors.kPrimaryDarkColor,
        title: Text(
          title,
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.light
                ? AppColors.kPrimaryDarkColor
                : AppColors.kPrimaryLightColor,
          ),
        ),
        trailing: checkbox == null
            ? Icon(Icons.navigate_next_outlined)
            : CupertinoSwitch(
                activeColor: AppColors.kPrimary_active_color,
                value: checkbox,
                onChanged: (value) {},
              ));
  }
}
