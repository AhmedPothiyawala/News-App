import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ExitConfirmationController extends GetxController {
  Future<bool> showExitConfirmation() async {
    final result = await Get.dialog(
      AlertDialog(
        title: Text('Are you sure you want to exit?'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(result: false);
            },
            child: Text('No'),
          ),
          TextButton(
            onPressed: () {
              Get.back(result: true);
              if (Platform.isIOS) {
                exit(0);
              } else {
                SystemNavigator.pop(animated: true);
              }
            },
            child: Text('Yes'),
          ),
        ],
      ),
      barrierDismissible: false,
    );
    return result ?? false;
  }
}
