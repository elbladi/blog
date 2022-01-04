import 'package:blog/models/Calendar.dart';
import 'package:blog/models/CurrentData.dart';
import 'package:blog/models/Day.dart';
import 'package:blog/models/Month.dart';
import 'package:flutter/material.dart';

@immutable
class BlogState {
  final CurrentData currentData;

  BlogState({
    required this.currentData,
  });

  factory BlogState.initial() => BlogState(
        currentData: new CurrentData(
          Calendar.getToday(),
          Month(Calendar.getToday().month, []),
          Day(1, false, null),
        ),
      );

  BlogState copyWith({
    CurrentData? currentData,
  }) {
    return BlogState(
      currentData: currentData ?? this.currentData,
    );
  }
}
