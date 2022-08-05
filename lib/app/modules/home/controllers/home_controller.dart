import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:qube_task/app/data/user_model.dart';
import 'package:qube_task/app/data/user_provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../constants/app_constants.dart';

class HomeController extends GetxController {
  RxBool isLoading = true.obs;
  final count = 0.obs;
  DateFormat format = DateFormat('dd MMM, y');
  String? youtubeUrl;

  var ufm = UserModel().obs;
  RxList<Map<String, dynamic>>? dateInfo;
  List<Map<String, dynamic>> userFeelingsData = [
    {
      "id": 1,
      "image_url": "assets/images/energetic.png",
      "title": "Energetic",
      "value": "30"
    },
    {
      "id": 2,
      "image_url": "assets/images/sad.png",
      "title": "Sad",
      "value": "10"
    },
    {
      "id": 3,
      "image_url": "assets/images/happy.png",
      "title": "Happy",
      "value": "40"
    },
    {
      "id": 4,
      "image_url": "assets/images/angry.png",
      "title": "Angry",
      "value": "1"
    },
    {
      "id": 5,
      "image_url": "assets/images/calm.png",
      "title": "Calm",
      "value": "0"
    },
    {
      "id": 6,
      "image_url": "assets/images/bored.png",
      "title": "Bored",
      "value": "0"
    },
    {
      "id": 7,
      "image_url": "assets/images/love.png",
      "title": "Love",
      "value": "0"
    },
  ];

  @override
  void onInit() {
    fetchAllData();

    dateInfo = List.generate(
        7,
        (index) => {
              "day": DateFormat('E')
                  .format(DateTime.now().add(Duration(days: index))),
              "date": DateFormat('d')
                  .format(DateTime.now().add(Duration(days: index))),
            }).obs;
    super.onInit();
  }

  void increment() => count.value++;

  Future<void> fetchAllData() async {
    isLoading(true);
    await Future.delayed(const Duration(seconds: 1));
    getUserFeelings();
    isLoading(false);
  }

  Future<void> getUserFeelings() async {
    ufm.value = await UserProvider.postUserData(userData);

    userFeelingsData = [
      {
        "id": 1,
        "image_url": "assets/images/energetic.png",
        "title": "Energetic",
        "value": ufm.value.data?.feelingPercentage?.energetic.toString()
      },
      {
        "id": 2,
        "image_url": "assets/images/sad.png",
        "title": "Sad",
        "value": ufm.value.data?.feelingPercentage?.sad.toString()
      },
      {
        "id": 3,
        "image_url": "assets/images/happy.png",
        "title": "Happy",
        "value": ufm.value.data?.feelingPercentage?.happy.toString()
      },
      {
        "id": 4,
        "image_url": "assets/images/angry.png",
        "title": "Angry",
        "value": ufm.value.data?.feelingPercentage?.angry.toString()
      },
      {
        "id": 5,
        "image_url": "assets/images/calm.png",
        "title": "Calm",
        "value": ufm.value.data?.feelingPercentage?.calm.toString()
      },
      {
        "id": 6,
        "image_url": "assets/images/bored.png",
        "title": "Bored",
        "value": ufm.value.data?.feelingPercentage?.bored.toString()
      },
      {
        "id": 7,
        "image_url": "assets/images/love.png",
        "title": "Love",
        "value": "0"
      },
    ];
    update();
    print("Hello: ${ufm.value.data?.videoArr?[0].youtubeUrl}");
  }

  Future<void> openUrl() async {
    try {
      launchUrlString(ufm.value.data?.videoArr?[0].youtubeUrl ?? "");
    } catch (e) {
      print(e);
      Get.snackbar("Something went wrong, please try again", "",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.black.withOpacity(0.8));
    }
  }
}
