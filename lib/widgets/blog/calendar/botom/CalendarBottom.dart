import 'package:blog/widgets/blog/calendar/botom/DiasDeLaSemana.dart';
import 'package:blog/widgets/blog/calendar/botom/SiguientesMeses.dart';
import 'package:blog/widgets/blog/calendar/botom/semanas/DiaSemana.dart';
import 'package:flutter/material.dart';

class CalendarBototm extends StatelessWidget {
  final int day;
  final Function setDay;
  final bool loved;
  const CalendarBototm(this.day, this.setDay, this.loved, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Positioned(
      top: 78,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 60),
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DiaSemana(),
            DiasDeLaSemana(day, setDay, loved),
            SiguientesMeses(),
          ],
        ),
      ),
    );
  }
}
