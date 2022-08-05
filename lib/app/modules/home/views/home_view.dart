import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:qube_task/constants/app_images.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../constants/app_constants.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(
                  Icons.keyboard_arrow_left,
                  color: Colors.black,
                  size: 36,
                ),
                onPressed: () {},
              ),
              title:
                  "Your Feelings History".text.black.size(20).semiBold.make(),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      "Your feelings from last 30 days".text.size(16).make(),
                      10.heightBox,
                      SizedBox(
                        height: H(context) * 15,
                        child: GetBuilder<HomeController>(
                          init: HomeController(),
                          builder: (value) => ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: homeController.userFeelingsData.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => (controller
                                        .userFeelingsData[index]['value'] ==
                                    0)
                                ? Opacity(
                                    opacity: 0.3,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: feeling_container_color),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                    height: H(context) * 5,
                                                    child: ""
                                                        .text
                                                        .size(12)
                                                        .fontWeight(
                                                            FontWeight.w200)
                                                        .makeCentered()),
                                                Container(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  height: H(context) * 5,
                                                  width: H(context) * 5,
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: appGreen,
                                                  ),
                                                  child: Center(
                                                    child: ExtendedImage.asset(
                                                        '${controller.userFeelingsData[index]['image_url']}',
                                                        colorBlendMode:
                                                            BlendMode.darken),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          4.heightBox,
                                          "${controller.userFeelingsData[index]['title']}"
                                              .text
                                              .makeCentered()
                                        ],
                                      ),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: feeling_container_color),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                  height: H(context) * 5,
                                                  child:
                                                      "${controller.userFeelingsData[index]['value']}%"
                                                          .text
                                                          .size(12)
                                                          .fontWeight(
                                                              FontWeight.w200)
                                                          .makeCentered()),
                                              Container(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                height: H(context) * 5,
                                                width: H(context) * 5,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: appGreen,
                                                ),
                                                child: Center(
                                                  child: ExtendedImage.asset(
                                                      '${controller.userFeelingsData[index]['image_url']}',
                                                      colorBlendMode:
                                                          BlendMode.darken),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        4.heightBox,
                                        "${controller.userFeelingsData[index]['title']}"
                                            .text
                                            .makeCentered()
                                      ],
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      10.heightBox,
                    ],
                  ),
                ),
                Divider(color: dividerColor),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: const Color(0xffC6E5F7),
                            borderRadius: BorderRadius.circular(5)),
                        child: controller.format
                            .format(DateTime.now())
                            .text
                            .size(12)
                            .make(),
                      ),
                      25.heightBox,
                      SizedBox(
                        height: H(context) * 10,
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: 7,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => (DateFormat('E')
                                      .format(DateTime.now()) ==
                                  controller.dateInfo?[index]['day'])
                              ? Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  width: W(context) * 11,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Color.fromARGB(1, 0, 0, 0),
                                            blurRadius: 25.0,
                                            offset: Offset(2, 2)),
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xff4f4f4f)),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child:
                                              "${controller.dateInfo?[index]["day"]}"
                                                  .text
                                                  .size(15)
                                                  .color(
                                                      const Color(0xffa7a7a7))
                                                  .make(),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child:
                                            "${controller.dateInfo?[index]["date"]}"
                                                .text
                                                .size(15)
                                                .white
                                                .make(),
                                      )
                                    ],
                                  ),
                                )
                              : Container(
                                  margin: const EdgeInsets.only(right: 5),
                                  width: W(context) * 11,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child:
                                              "${controller.dateInfo?[index]["day"]}"
                                                  .text
                                                  .size(15)
                                                  .make(),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child:
                                            "${controller.dateInfo?[index]["date"]}"
                                                .text
                                                .size(15)
                                                .make(),
                                      )
                                    ],
                                  ),
                                ),
                        ),
                      ),
                      10.heightBox,
                    ],
                  ),
                ),
                Divider(color: dividerColor),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      16.heightBox,
                      Row(children: [
                        SizedBox(
                            width: W(context) * 20,
                            child: "9AM - 12AM".text.make()),
                        (W(context) * 10).widthBox,
                        ExtendedImage.asset('assets/images/love.png'),
                        (W(context) * 2).widthBox,
                        "Love".text.make()
                      ]),
                      32.heightBox,
                      Row(children: [
                        SizedBox(
                            width: W(context) * 20,
                            child: "1PM - 4PM".text.make()),
                        (W(context) * 10).widthBox,
                        ExtendedImage.asset('assets/images/angry.png'),
                        (W(context) * 2).widthBox,
                        "Angry".text.make()
                      ]),
                      32.heightBox,
                      Row(children: [
                        SizedBox(
                            width: W(context) * 20,
                            child: "4PM - 6PM".text.make()),
                        (W(context) * 10).widthBox,
                        ExtendedImage.asset('assets/images/angry.png'),
                        (W(context) * 2).widthBox,
                        "Angry".text.make()
                      ]),
                      16.heightBox,
                    ],
                  ),
                ),
                Divider(color: dividerColor),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24.0, 20.0, 0.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      "You May Find This Interesting".text.size(18).make(),
                      10.heightBox,
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit euismod risus elementum magna scelerisque nunc sed varius. Tellus quis tristique adipiscing sed metus, sit ac adipiscing. Leo aenean sed eu purus maecenas posuere "
                          .text
                          .color(Colors.black.withOpacity(0.4))
                          .make(),
                      10.heightBox,
                    ],
                  ),
                ),
                Obx(
                  () => SizedBox(
                    height: 128,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount:
                          controller.ufm.value.data?.videoArr?.length ?? 0,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Padding(
                        padding: (index == 0)
                            ? const EdgeInsets.only(left: 24)
                            : EdgeInsets.zero,
                        child: Container(
                            height: 128,
                            width: 208,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                      workoutImage,
                                    ))),
                            child: GestureDetector(
                              onTap: () => controller.openUrl(),
                              child: Center(
                                child: Image.asset(youtubeImage),
                              ),
                            )),
                      ),
                    ),
                  ),
                ),
                10.heightBox,
              ],
            )),
        Obx(
          () => Visibility(
            visible: controller.isLoading.value,
            child: Container(
              height: double.maxFinite,
              width: double.maxFinite,
              color: appGreen.withOpacity(0.5),
              child: const CircularProgressIndicator.adaptive(),
            ),
          ),
        )
      ],
    );
  }
}
