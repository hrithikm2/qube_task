import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:qube_task/constants/app_images.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../components/current_day_container.dart';
import '../../../../components/faded_feeling_container.dart';
import '../../../../components/feeling_container.dart';
import '../../../../components/next_days_container.dart';
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
                                      "0")
                                  ? FadedFeelingContainer(
                                      title: controller.userFeelingsData[index]
                                          ['title'],
                                      imageUrl: controller
                                          .userFeelingsData[index]['image_url'],
                                    )
                                  : FeelingContainer(
                                      imageUrl: controller
                                          .userFeelingsData[index]['image_url'],
                                      title: controller.userFeelingsData[index]
                                          ['title'],
                                      value: controller.userFeelingsData[index]
                                          ['value'],
                                    )),
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
                                ? CurrentDayContainer(
                                    date: controller.dateInfo?[index]['date'],
                                    day: controller.dateInfo?[index]['day'],
                                  )
                                : NextDaysContainer(
                                    date: controller.dateInfo?[index]['date'],
                                    day: controller.dateInfo?[index]['day'],
                                  )),
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
