import 'package:blog/models/Calendar.dart';
import 'package:blog/models/Day.dart';
import 'package:blog/models/Month.dart';
import 'package:blog/responsive/utilitites.dart';
import 'package:blog/widgets/blog/calendar/botom/DiasDeLaSemana.dart';
import 'package:blog/widgets/blog/calendar/botom/SiguientesMeses.dart';
import 'package:blog/widgets/blog/calendar/botom/semanas/DiaSemana.dart';
import 'package:flutter/material.dart';

class CalendarBototm extends StatelessWidget {
  final Day day;
  final Function setDay;
  final Month month;
  final Calendar calendar;
  final Function changeMonth;
  final Function setToday;
  const CalendarBototm(this.day, this.setDay, this.month, this.calendar,
      this.changeMonth, this.setToday,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Positioned(
      top: 78,
      left: isWeb ? 10 : null,
      child: Container(
        padding: isWeb ? null : EdgeInsets.symmetric(horizontal: 60),
        width: isWeb ? 300 : width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DiaSemana(),
            DiasDeLaSemana(day, setDay, month, calendar),
            SiguientesMeses(
              calendar,
              changeMonth,
              setToday,
            ),
          ],
        ),
      ),
    );
  }
}
