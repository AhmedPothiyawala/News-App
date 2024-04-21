import 'package:flutter/material.dart';
import 'package:flutter_mvvm_template/App_Controllers/ApiController.dart';
import 'package:flutter_mvvm_template/Remote/Model/News_Model.dart';
import 'package:flutter_mvvm_template/Views/NoRecord.dart';
import 'package:get/get.dart';

import '../Remote/Colors/color.dart';
import '../Remote/Function/CustomeFunctions.dart';
import 'CustomeWidget.dart';
import 'Detail_View.dart';

class FavouriteVedios extends StatelessWidget {
  final ApiController apiController = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: apiController.loadTasks(),
            builder: (context, dataSnapshot) {
              if (dataSnapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                if (dataSnapshot.error != null) {
                  return Center(
                    child: Text('Something went wrong'),
                  );
                } else {
                  return apiController.allArticles.length == 0
                      ? Padding(
                          padding: EdgeInsets.only(
                            top: Get.height * 0.4,
                          ),
                          child: NoRecord(),
                        )
                      : Obx(
                          () => ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: apiController.allArticles.length,
                              itemBuilder: (context, index) {
                                Article article =
                                    apiController.allArticles[index];
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FittedBox(
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(() => DetailView(article));
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.94,
                                        padding: EdgeInsets.zero,
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          ),
                                          color: Theme.of(context).brightness ==
                                                  Brightness.light
                                              ? AppColors.kPrimaryLightColor
                                              : AppColors.kPrimaryDarkColor,
                                          elevation: 10,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                child: ConstrainedBox(
                                                    constraints: BoxConstraints(
                                                      minWidth:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.1,
                                                      minHeight:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.1,
                                                      maxWidth:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.4,
                                                      maxHeight:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.3,
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  4.0)),
                                                      child: Image.network(
                                                          article.urlToImage,
                                                          fit: BoxFit.fill),
                                                    )),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.5,
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          10, 10, 0, 0),
                                                      child: CustomeText(
                                                          article.title,
                                                          2,
                                                          true,
                                                          context),
                                                    ),
                                                  ),
                                                  FittedBox(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.38,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .fromLTRB(
                                                                    5,
                                                                    25,
                                                                    0,
                                                                    5),
                                                            child: CustomeText(
                                                                '${formatRelativeTime(DateTime.now().difference(DateTime.parse(article.publishedAt)))}',
                                                                2,
                                                                true,
                                                                context),
                                                          ),
                                                        ),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 5),
                                                            child: Obx(
                                                              () => IconButton(
                                                                icon: apiController
                                                                        .allArticles
                                                                        .any((articsssle) =>
                                                                            articsssle.title ==
                                                                            article
                                                                                .title)
                                                                    ? Icon(Icons
                                                                        .favorite_rounded)
                                                                    : Icon(Icons
                                                                        .favorite_border),
                                                                onPressed: () {
                                                                  if (apiController
                                                                          .allArticles
                                                                          .length ==
                                                                      0) {
                                                                    apiController
                                                                        .addTask(
                                                                            apiController.allArticles[index]);
                                                                    Get.snackbar(
                                                                        'Successfully',
                                                                        'Record Added',
                                                                        backgroundColor:
                                                                            Colors
                                                                                .green,
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .check_circle_rounded,
                                                                          size:
                                                                              30,
                                                                        ),
                                                                        snackPosition:
                                                                            SnackPosition.TOP);
                                                                  } else {
                                                                    if (apiController
                                                                        .allArticles
                                                                        .any((articsssle) =>
                                                                            articsssle.title ==
                                                                            article.title)) {
                                                                      apiController
                                                                          .remove_favourite(
                                                                              apiController.allArticles[index]);

                                                                      Get.snackbar(
                                                                          'Removed From Favourite',
                                                                          article
                                                                              .title,
                                                                          backgroundColor: Colors
                                                                              .red,
                                                                          icon:
                                                                              Icon(
                                                                            Icons.delete,
                                                                            size:
                                                                                30,
                                                                          ),
                                                                          snackPosition:
                                                                              SnackPosition.TOP);
                                                                    } else {
                                                                      apiController
                                                                          .addTask(
                                                                              apiController.allArticles[index]);
                                                                      Get.snackbar(
                                                                          'Successfully',
                                                                          'Record Added',
                                                                          backgroundColor: Colors
                                                                              .green,
                                                                          icon:
                                                                              Icon(
                                                                            Icons.check_circle_rounded,
                                                                            size:
                                                                                30,
                                                                          ),
                                                                          snackPosition:
                                                                              SnackPosition.TOP);
                                                                    }
                                                                  }
                                                                },
                                                              ),
                                                            ))
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        );
                }
              }
            }),
      ),
    );
  }
}
