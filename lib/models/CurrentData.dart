import 'package:blog/models/Calendar.dart';
import 'package:blog/models/Day.dart';
import 'package:blog/models/Month.dart';

class CurrentData {
  Calendar calendar;
  Month month;
  Day day;

  CurrentData(this.calendar, this.month, this.day);
}
