import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get_connect.dart';
import 'package:qube_task/app/data/user_model.dart';

import '../../constants/app_constants.dart';

abstract class UserProvider extends GetConnect {
  static Future<UserModel> postUserData(Map data) async {
    var response = await api_DIO.post(baseURL + userFeelingEndPoint,
        data: data, options: Options(headers: {"X-Api-Key": apiKey}));
    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.data));
    } else {
      return UserModel.fromJson(response.data);
    }
  }
}
