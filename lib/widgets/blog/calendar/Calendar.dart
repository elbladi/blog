import 'package:blog/models/Calendar.dart';
import 'package:blog/models/Day.dart';
import 'package:blog/models/Month.dart';
import 'package:blog/responsive/utilitites.dart';
import 'package:blog/widgets/blog/calendar/Ligas.dart';
import 'package:blog/widgets/blog/calendar/botom/CalendarBottom.dart';
import 'package:blog/widgets/blog/calendar/top/CalendarTop.dart';
import 'package:flutter/material.dart';

class CalendarWidget extends StatelessWidget {
  final Day day;
  final Function setDay;
  final Month month;
  final Calendar calendar;
  final Function changeMonth;
  const CalendarWidget(
      this.day, this.setDay, this.month, this.calendar, this.changeMonth,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Container(
      margin:
          isWeb ? EdgeInsets.only(left: 20, top: 20) : EdgeInsets.only(top: 50),
      child: Container(
        width: isWeb ? 316 : width,
        height: isWeb ? double.infinity : height - height * 0.5,
        child: Stack(
          children: [
            CalendarTop(calendar.year, calendar.month),
            CalendarBototm(day, setDay, month, calendar, changeMonth),
            Ligas(),
          ],
        ),
      ),
    );
  }
}
