import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constants/app_constants.dart';

class FadedFeelingContainer extends StatelessWidget {
  const FadedFeelingContainer(
      {Key? key, required this.imageUrl, required this.title})
      : super(key: key);
  final String imageUrl;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.3,
      child: Padding(
        padding: const EdgeInsets.only(right: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: H(context) * 10,
              width: W(context) * 10,
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Vx.gray200,
                        blurRadius: 6.0,
                        offset: Offset(5, 4)),
                  ],
                  borderRadius: BorderRadius.circular(20),
                  color: feeling_container_color),
              child: Column(
                children: [
                  SizedBox(
                      height: H(context) * 5,
                      child: ""
                          .text
                          .size(12)
                          .fontWeight(FontWeight.w200)
                          .makeCentered()),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: H(context) * 5,
                    width: H(context) * 5,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: appGreen,
                    ),
                    child: Center(
                      child: ExtendedImage.asset(imageUrl,
                          colorBlendMode: BlendMode.darken),
                    ),
                  )
                ],
              ),
            ),
            4.heightBox,
            title.text.makeCentered()
          ],
        ),
      ),
    );
  }
}
