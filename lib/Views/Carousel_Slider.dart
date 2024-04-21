import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_template/App_Controllers/ApiController.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Remote/App_Heading/heading.dart';
import '../Remote/Colors/color.dart';
import '../Remote/Function/CustomeFunctions.dart';
import 'CustomeWidget.dart';
import 'Detail_View.dart';
import 'NewsList.dart';

class NewsCarouselSlider extends StatelessWidget {
  ApiController apiController;
  NewsCarouselSlider(this.apiController);

  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.zero, children: [
      Padding(
          padding: const EdgeInsets.only(top: 20),
          child: CarouselSlider.builder(
              options: CarouselOptions(
                height: 275.0,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayCurve: Curves.easeIn,
                enableInfiniteScroll: true,
                padEnds: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
              itemCount: apiController.articles.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return Column(children: [
                  InkWell(
                    child: Container(
                      width: 500,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            apiController.articles[index].urlToImage,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, top: 10, bottom: 10),
                        child: Stack(
                          children: [
                            Align(
                                alignment: Alignment.topLeft,
                                child: CustomeText(
                                    formatRelativeTime(DateTime.now()
                                        .difference(DateTime.parse(apiController
                                            .articles[index].publishedAt))),
                                    2,
                                    false,
                                    context)),
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                    padding: const EdgeInsets.only(right: 60.0),
                                    child: CustomeText(
                                        apiController.articles[index].title,
                                        2,
                                        false,
                                        context)))
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      Get.to(() => DetailView(apiController.articles[index]));
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: AnimatedSmoothIndicator(
                      activeIndex: apiController.articles
                          .indexOf(apiController.articles[index]),
                      count: apiController.articles.length,
                      effect: JumpingDotEffect(
                        activeDotColor: AppColors.kPrimaryDarkColor,
                        dotColor: AppColors.kPrimary_active_color,
                        dotHeight: 9,
                        dotWidth: 9,
                      ),
                    ),
                  ),
                ]);
              })),
      Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: HeadingText(AppHeading.latest_news, 32, context),
      ),
      ShowNewsList(apiController)
    ]);
  }
}
