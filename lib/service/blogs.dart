import 'package:blog/models/Calendar.dart';
import 'package:blog/widgets/utilities.dart';

Future<void> updateBlog(
    String content, Calendar calendar, int day, bool fav) async {
  final ref = instance
      .collection(calendar.year.toString())
      .doc(calendar.month.toLowerCase());

  final doc = await ref.get();
  if (doc.exists) {
    List<dynamic> daysData = doc.data()!["days"];
    final day2Update = daysData.firstWhere((_day) => _day["day"] == day);
    if (day2Update["exist"]) {
      //update the shit
    } else {
      day2Update["memory"] = {
        "favorite": fav,
        "content": content,
      };
      day2Update["exist"] = true;
    }
    await ref.update({"days": daysData});
  }
}
