import 'package:blog/constants.dart';
import 'package:blog/models/Calendar.dart';
import 'package:blog/responsive/utilitites.dart';
import 'package:flutter/material.dart';

class DayTitle extends StatefulWidget {
  final Function onPress;
  final Function setDay;
  final int day;
  final Calendar calendar;

  const DayTitle(this.onPress, this.day, this.calendar, this.setDay, {Key? key})
      : super(key: key);

  @override
  State<DayTitle> createState() => _DayTitleState();
}

class _DayTitleState extends State<DayTitle> {
  late double _startPosition;

  @override
  void initState() {
    _startPosition = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onPress(),
      onHorizontalDragStart: (details) {
        this.setState(() {
          _startPosition = details.localPosition.dx;
        });
      },
      onHorizontalDragEnd: (details) {
        if (_startPosition < details.velocity.pixelsPerSecond.dx) {
          if (widget.day != 1) widget.setDay(widget.day - 1);
        } else {
          if (widget.day < 30) widget.setDay(widget.day + 1);
        }
        this.setState(() {
          _startPosition = 0;
        });
      },
      child: Padding(
        padding: EdgeInsets.only(left: isWeb ? 20 : 10),
        child: Row(
          children: [
            Icon(Icons.calendar_today, color: red),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                '${widget.day} ${widget.calendar.month} ${widget.calendar.year}',
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
