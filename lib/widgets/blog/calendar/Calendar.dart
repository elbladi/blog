import 'package:blog/widgets/blog/calendar/Ligas.dart';
import 'package:blog/widgets/blog/calendar/botom/CalendarBottom.dart';
import 'package:blog/widgets/blog/calendar/top/CalendarTop.dart';
import 'package:flutter/material.dart';

class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Container(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            CalendarTop(),
            CalendarBototm(),
            Ligas(),
          ],
        ),
      ),
    );
  }
}
