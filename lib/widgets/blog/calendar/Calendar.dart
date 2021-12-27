import 'package:blog/widgets/blog/calendar/Ligas.dart';
import 'package:blog/widgets/blog/calendar/botom/CalendarBottom.dart';
import 'package:blog/widgets/blog/calendar/top/CalendarTop.dart';
import 'package:flutter/material.dart';

class Calendar extends StatelessWidget {
  final int day;
  final Function setDay;
  final bool loved;
  const Calendar(this.day, this.setDay, this.loved, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Container(
        width: width,
        height: height - height * 0.5,
        child: Stack(
          children: [
            CalendarTop(),
            CalendarBototm(day, setDay, loved),
            Ligas(),
          ],
        ),
      ),
    );
  }
}
