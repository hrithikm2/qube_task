import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

const Color feeling_container_color = Color(0xfff1f2f3);
const Color appGreen = Color(0xff85C454);
Color dividerColor = const Color(0xff000000).withOpacity(0.3);
const Map<String, dynamic> userData = {
  "user_id": 3206161992,
  "feeling_date": "15-04-2022"
};
const String baseURL = "https://www.qubehealth.com/qube_services/api/";

const String userFeelingEndPoint = "testservice/getListOfUserFeeling";

const String apiKey = "f6d646a6c2f2df883ea0cccaa4097358ede98284";

double W(BuildContext context) => context.safePercentWidth;
double H(BuildContext context) => context.safePercentHeight;

Dio api_DIO = Dio();
