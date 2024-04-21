import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../App_Controllers/ApiController.dart';
import '../Remote/Colors/color.dart';
import 'Carousel_Slider.dart';
import 'ShimmerEffect.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final ApiController apiController = Get.put(ApiController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kPrimaryColor,
        body: Obx(() => apiController.articles.isEmpty
            ? ShimmerEffect()
            : NewsCarouselSlider(apiController)));
  }
}
