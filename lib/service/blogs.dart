import 'package:blog/models/Calendar.dart';
import 'package:blog/widgets/utilities.dart';

void updateBlog(String content, Calendar calendar, int day) async {
  final ref = instance
      .collection(calendar.year.toString())
      .doc(calendar.month.toLowerCase());

  print("aqui mero?");
  final doc = await ref.get();
  if (doc.exists) {
    List<dynamic> daysData = doc.data()!["days"];
    final day2Update = daysData.firstWhere((_day) => _day["day"] == day);
    if (day2Update["exist"]) {
      //update the shit
    } else {
      day2Update["memory"] = {
        "favorite": false,
        "content": content,
      };
      day2Update["exist"] = true;
      // final updatedList = List.generate(daysData.length, (i) {
      //   if(daysData[i]["day"] == day){

      //   }
      //   return daysData[i];
      // });
    }
  }

  // await doc.update({
  //   "days": FieldValue.arrayUnion([
  //     {
  //       "day": day,
  //       "exist": true,
  //       "memory": {
  //         "content": content,
  //         "favorite": false,
  //       },
  //     }
  //   ])
  // });
}
