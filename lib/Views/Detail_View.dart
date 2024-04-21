import 'package:flutter/material.dart';
import 'package:flutter_mvvm_template/Remote/Model/News_Model.dart';
import 'package:get/get.dart';
import '../Remote/Colors/color.dart';
import '../Remote/Function/CustomeFunctions.dart';
import 'CustomeWidget.dart';

class DetailView extends StatelessWidget {
  Article article;
  DetailView(this.article);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height:
                size.height * 0.35, // Set the desired height for the app bar
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(article.urlToImage),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 35.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back_outlined,
                        size: 35,
                        color: AppColors.kPrimaryLightColor,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 10),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: CustomeText(
                        formatRelativeTime(DateTime.now()
                            .difference(DateTime.parse(article.publishedAt))),
                        1,
                        false,context),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15.0, top: 20),
            child: Row(
              children: [
                Container(
                  width: 7,
                  height: 50,
                  color: AppColors.kPrimary_active_color,
                  child: Divider(
                    height: 90,
                    thickness: 1,
                    color: AppColors.kPrimary_active_color,
                  ),
                ),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 5.0),
                      child: BoldText(
                        article.title,
                        2,
                      )),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15, top: 30),
            child: DetailText(
                '${article.title}\n\n${article.description}\n\n${article.content}'),
          )
        ]),
      ),
    );
  }
}
