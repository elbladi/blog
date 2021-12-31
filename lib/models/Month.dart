import 'package:blog/data/monthsData.dart';
import 'package:blog/models/Day.dart';
import 'package:blog/models/Memory.dart';

class Month {
  String id;
  List<Day> days;

  Month(this.id, this.days);

  static Month getFromDB(String month) {
    //request return...
    final DB = fromDB();
    final daysData = DB[month];
    List<Day> days = List.generate(daysData.length, (i) {
      bool exist = daysData[i]["exist"];
      if (exist) {
        Memory memory = Memory.getMemoryFromDB(daysData[i]["memory"]);
        return Day(daysData[i]["day"], exist, memory);
      }
      return Day(daysData[i]["day"], exist, null);
    });
    return Month(month, days);
  }
}
