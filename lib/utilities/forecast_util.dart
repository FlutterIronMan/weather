import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Util {
  static String getFormatedDate(DateTime dateTime) {
    return DateFormat('EEE, MMM d, y').format(dateTime);
  }

  static Widget getItem(IconData iconData, int value, String units) {
    return Column(
      children: [
        Icon(
          iconData,
          color: Colors.teal,
          size: 28,
        ),
        SizedBox(height: 10),
        Text(
          '$value',
          style: TextStyle(fontSize: 20, color: Colors.teal),
        ),
        SizedBox(height: 10),
        Text(
          '$units',
          style: TextStyle(fontSize: 15, color: Colors.teal),
        ),
      ],
    );
  }
}
