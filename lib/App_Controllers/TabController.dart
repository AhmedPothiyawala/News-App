import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../Remote/App_Heading/heading.dart';

class MyTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void onInit() {
    tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void onClose() {
    tabController!.dispose();
  }

  final List<Tab> tabs = [
    Tab(text: AppHeading.allnews),
    Tab(text: AppHeading.business),
    Tab(text: AppHeading.politics),
    Tab(text: AppHeading.tech),
  ];
}
