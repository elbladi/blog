import 'package:blog/constants.dart';
import 'package:blog/models/Calendar.dart';
import 'package:blog/responsive/utilitites.dart';
import 'package:flutter/material.dart';

class DayTitle extends StatelessWidget {
  final Function onPress;
  final int day;
  final Calendar calendar;

  const DayTitle(this.onPress, this.day, this.calendar, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress(),
      child: Padding(
        padding: EdgeInsets.only(left: isWeb ? 20 : 10),
        child: Row(
          children: [
            Icon(Icons.calendar_today, color: red),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                '$day ${calendar.month} ${calendar.year}',
                style: TextStyle(
                  color: blue,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
