import 'package:flutter/material.dart';
import '../Remote/Colors/color.dart';

class NoRecord extends StatelessWidget {
  const NoRecord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No Record Found',
        style: TextStyle(
            color: Theme.of(context).brightness == Brightness.light
                ? AppColors.kPrimaryDarkColor
                : AppColors.kPrimaryLightColor,
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
