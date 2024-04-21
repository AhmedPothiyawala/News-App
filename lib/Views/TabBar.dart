import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_mvvm_template/App_Controllers/TabController.dart';
import 'Dashboard.dart';
import '../Remote/Colors/color.dart';
import 'NoRecord.dart';

class Tabbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColors.kPrimaryLightColor
          : AppColors.kPrimaryDarkColor,
      body: GetBuilder<MyTabController>(
        init: MyTabController(),
        builder: (controller) => Column(
          children: [
            TabBar(
              labelColor: Theme.of(context).brightness == Brightness.light
                  ? AppColors.kPrimaryDarkColor
                  : AppColors.kPrimaryLightColor,
              labelStyle: TextStyle(
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColors.kPrimaryDarkColor
                      : AppColors.kPrimaryLightColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
              unselectedLabelColor: AppColors.kPrimaryUnselectedColor,
              unselectedLabelStyle:
                  TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              controller: controller.tabController,
              indicatorWeight: 2,
              indicatorPadding: EdgeInsets.only(top: 43),
              indicatorSize: TabBarIndicatorSize.label,
              automaticIndicatorColorAdjustment: true,
              indicatorColor: AppColors.kPrimary_active_color,
              indicator: BoxDecoration(
                color: AppColors.kPrimary_active_color,
                borderRadius: BorderRadius.all(
                  Radius.circular(3),
                ),
              ),
              tabs: controller.tabs,
            ),
            Expanded(
              child: TabBarView(
                controller: controller.tabController,
                children: [
                  Dashboard(),
                  NoRecord(),
                  NoRecord(),
                  NoRecord(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
