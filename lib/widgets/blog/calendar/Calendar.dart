import 'package:blog/widgets/blog/calendar/Ligas.dart';
import 'package:blog/widgets/blog/calendar/botom/CalendarBottom.dart';
import 'package:blog/widgets/blog/calendar/top/CalendarTop.dart';
import 'package:flutter/material.dart';

class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CalendarTop(),
          CalendarBototm(),
          Positioned(
            left: 90,
            top: 60,
            child: Container(
              width: width - 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (i) => Ligas()).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
