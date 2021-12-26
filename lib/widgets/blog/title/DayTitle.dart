import 'package:blog/constants.dart';
import 'package:flutter/material.dart';

class DayTitle extends StatelessWidget {
  final Function onPress;
  const DayTitle(this.onPress, {Key? key}) : super(key: key);

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
                "15 Diciembre 2021",
                style: TextStyle(
                  color: blue,
                  fontSize: 27,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
