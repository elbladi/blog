import 'package:blog/constants.dart';
import 'package:flutter/material.dart';

class DayTitle extends StatelessWidget {
  final Function onPress;
  final int day;
  const DayTitle(this.onPress, this.day, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress(),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          children: [
            Icon(Icons.calendar_today, color: red),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                '$day $mes $year',
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
