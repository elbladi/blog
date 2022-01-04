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
    if (!day2Update["exist"]) {
      day2Update["exist"] = true;
    }
    day2Update["memory"] = {
      "favorite": fav,
      "content": content,
    };
    await ref.update({"days": daysData});
  }
}

Future<void> updateFav(int year, String month, int day, bool fav) async {
  final ref = instance.collection(year.toString()).doc(month.toLowerCase());
  final doc = await ref.get();
  List<dynamic> daysData = doc.data()!["days"];
  final day2Update = daysData.firstWhere((_day) => _day["day"] == day);
  day2Update["memory"] = {
    "favorite": fav,
    "content": day2Update["memory"]["content"],
  };
  await ref.update({"days": daysData});
}

Future<void> deleteMemory(int year, String month, int day) async {
  final ref = instance.collection(year.toString()).doc(month.toLowerCase());
  final doc = await ref.get();
  List<dynamic> daysData = doc.data()!["days"];
  final day2Update = daysData.firstWhere((_day) => _day["day"] == day);
  day2Update["exist"] = false;
  day2Update["memory"] = null;
  await ref.update({"days": daysData});
}
