import 'package:blog/constants.dart';
import 'package:blog/models/Calendar.dart';
import 'package:blog/models/Day.dart';
import 'package:flutter/material.dart';

enum Size { small, medium, large }

double getWidth(double width, Size size) {
  switch (size) {
    case Size.small:
      return width * 0.2;
    case Size.medium:
      return width * 0.5;
    case Size.large:
      return width * 0.7;
    default:
      return width * 0.5;
  }
}

List<BoxShadow> getShadows() {
  return [
    BoxShadow(
      color: Colors.black.withOpacity(0.5),
      spreadRadius: 1,
      blurRadius: 10,
      offset: Offset(0, 3),
    ),
  ];
}

bool getFavourite(Day day) {
  if (!day.exist) return false;
  return day.memory!.favorite;
}

bool isAfter(Calendar calendar, Day selectedDay) {
  final monthId = months.indexOf(calendar.month) + 1;
  final newDate = new DateTime(calendar.year, monthId, selectedDay.day);
  final now = new DateTime.now();
  return newDate.isAfter(now);
}
