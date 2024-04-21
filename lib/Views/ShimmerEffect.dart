import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../Remote/App_Heading/heading.dart';
import 'CustomeWidget.dart';


class ShimmerEffect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Expanded(
            child: Column(children: [
      Container(
          width: 500,
          height: 200,
          child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                color: Colors.grey[300],
                width: double.infinity,
              ))),
      Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Align(
            alignment: Alignment.topLeft,
            child: HeadingText(AppHeading.latest_news, 32,context)),
      ),
      Column(
        children: List.generate(
          4,
          (index) {
                        return Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 70,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    color: Colors.grey[300],
                    width: double.infinity,
                    child: const Text(
                      '',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      )
    ])));
  }
}
