import 'package:blog/models/Calendar.dart';
import 'package:flutter/material.dart';
import 'package:blog/constants.dart';

class SiguientesMeses extends StatelessWidget {
  final Calendar calendar;
  final Function changeMonth;
  final Function setToday;
  const SiguientesMeses(this.calendar, this.changeMonth, this.setToday,
      {Key? key})
      : super(key: key);

  List<String> _getMonths() {
    final index = months.indexOf(calendar.month);
    if (index == 0) {
      return [months[11], months[1]];
    }
    if (index == 11) {
      return [months[10], months[0]];
    }
    return [months[index - 1], months[index + 1]];
  }

  Widget _getText(String monthName, int index) {
    return GestureDetector(
      onTap: () => changeMonth(index),
      child: Text(
        monthName,
        style: TextStyle(
          color: blue,
          fontSize: 13,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final _months = _getMonths();
    return Container(
      width: width - width * 0.3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _getText(_months[0], 0),
          GestureDetector(
            onTap: () => setToday(),
            child: Text(
              "hoy",
              style: TextStyle(
                color: blue,
                fontSize: 13,
              ),
            ),
          ),
          _getText(_months[1], 1),
        ],
      ),
    );
  }
}
