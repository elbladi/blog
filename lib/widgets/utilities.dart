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
