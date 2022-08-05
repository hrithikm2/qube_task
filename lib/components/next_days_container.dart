import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constants/app_constants.dart';

class NextDaysContainer extends StatelessWidget {
  const NextDaysContainer({Key? key, required this.date, required this.day})
      : super(key: key);
  final String date;
  final String day;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      width: W(context) * 11,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: day.text.size(15).make(),
            ),
          ),
          Expanded(
            flex: 2,
            child: date.text.size(15).make(),
          )
        ],
      ),
    );
  }
}
