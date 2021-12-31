import 'package:blog/data/monthsData.dart';
import 'package:blog/models/Calendar.dart';
import 'package:blog/models/CurrentData.dart';
import 'package:blog/models/Month.dart';

CurrentData loadCurrentData() {
  final calendar = Calendar.getToday();
  final month = Month.getFromDB(calendar.month);
  final today = month.days.firstWhere((dia) => dia.day == calendar.day);
  return new CurrentData(calendar, month, today);
}

CurrentData fetchMonthDetails(Calendar calendar) {
  final month = Month.getFromDB(calendar.month);
  final firstDay = month.days.firstWhere((dia) => dia.day == 1);
  return new CurrentData(calendar, month, firstDay);
}
