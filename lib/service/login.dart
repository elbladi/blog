import 'package:blog/models/Calendar.dart';
import 'package:blog/models/CurrentData.dart';
import 'package:blog/models/Month.dart';

Future<CurrentData> loadCurrentData() async {
  try {
    final calendar = Calendar.getToday();
    final month = await Month.getFromDB(calendar);
    final today = month.days.firstWhere((dia) => dia.day == calendar.day);
    return new CurrentData(calendar, month, today);
  } catch (e) {
    throw e;
  }
}

Future<CurrentData> fetchMonthDetails(Calendar calendar) async {
  final month = await Month.getFromDB(calendar);
  final firstDay = month.days.firstWhere((dia) => dia.day == 1);
  return new CurrentData(calendar, month, firstDay);
}
