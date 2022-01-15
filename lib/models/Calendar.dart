import 'package:blog/data/monthsData.dart';

class Calendar {
  int year;
  String month;
  int day;

  Calendar(this.year, this.month, this.day);

  static Calendar getToday() {
    final now = DateTime.now();
    String month = months[now.month - 1];
    return new Calendar(now.year, month, now.day);
  }

  @override
  String toString() {
    return '$year/$month/$day';
  }
}
