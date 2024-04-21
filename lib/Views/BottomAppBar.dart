import 'package:flutter/material.dart';
import 'package:flutter_mvvm_template/Views/CustomeWidget.dart';
import 'package:get/get.dart';
import '../App_Controllers/ExitController.dart';
import '../Remote/App_Heading/heading.dart';
import '../Remote/App_Heading/images.dart';
import '../App_Controllers/BottomController.dart';
import '../Remote/Colors/color.dart';
import '../App_Controllers/Global.dart';

class BottomAppBarView extends GetView<BottomNavigationController> {
  final BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());
  final exitConfirmationController = Get.put(ExitConfirmationController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => exitConfirmationController.showExitConfirmation(),
      child: Scaffold(
          backgroundColor: Theme.of(context).brightness == Brightness.light
              ? AppColors.kPrimaryLightColor
              : AppColors.kPrimaryDarkColor,
          appBar: AppBar(
            backgroundColor: Theme.of(context).brightness == Brightness.light
                ? AppColors.kPrimaryLightColor
                : AppColors.kPrimaryDarkColor,
            elevation: 0.00,
            title: Obx(
              () => controller.selectedIndex == 3
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Image.asset(
                            width: 160,
                            '${ImagesHeading.app_logo}',
                          ))),
            ),
          ),
          body: Obx(() => pages[controller.selectedIndex.value]),
          bottomNavigationBar: Obx(
            () => BottomNavigationBar(
              selectedItemColor: AppColors.kPrimary_active_color,
              unselectedItemColor: AppColors.kPrimaryDarkColor,
              selectedFontSize: 15,
              selectedLabelStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              currentIndex: controller.selectedIndex.value,
              onTap: controller.onTap,
              items: [
                BottomBarItem(AppHeading.home, Icons.home),
                BottomBarItem(AppHeading.search, Icons.search),
                BottomBarItem(AppHeading.favourite, Icons.favorite_rounded),
                BottomBarItem(AppHeading.settings, Icons.settings),
              ],
            ),
          )),
    );
  }
}
