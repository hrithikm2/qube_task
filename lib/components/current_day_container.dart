import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constants/app_constants.dart';

class CurrentDayContainer extends StatelessWidget {
  const CurrentDayContainer({Key? key, required this.day, required this.date})
      : super(key: key);
  final String day;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Container(
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: day.text.size(15).color(const Color(0xffa7a7a7)).make(),
            ),
          ),
          Expanded(
            flex: 3,
            child: date.text.size(15).white.make(),
          )
        ],
      ),
    );
  }
}
