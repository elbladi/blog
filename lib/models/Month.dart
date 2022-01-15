import 'package:blog/models/Calendar.dart';
import 'package:blog/models/Day.dart';
import 'package:blog/models/Memory.dart';
import 'package:blog/widgets/utilities.dart';

class Month {
  String id;
  List<Day> days;

  Month(this.id, this.days);

  static Future<Month> getFromDB(Calendar calendar) async {
    try {
      final doc = await instance
          .collection(calendar.year.toString())
          .doc(calendar.month.toLowerCase())
          .get();
      if (!doc.exists) throw "error aqui mero";
      List<dynamic> daysData = doc.data()!["days"];

      List<Day> days = List.generate(daysData.length, (i) {
        bool exist = daysData[i]["exist"];
        if (exist) {
          Memory memory = Memory.getMemoryFromDB(daysData[i]["memory"]);
          return Day(daysData[i]["day"], exist, memory);
        }
        return Day(daysData[i]["day"], exist, null);
      });
      return Month(calendar.month, days);
    } catch (e) {
      throw "Error Loading";
    }
  }
}
