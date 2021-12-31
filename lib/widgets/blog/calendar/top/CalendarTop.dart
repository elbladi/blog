import 'package:blog/responsive/utilitites.dart';
import 'package:flutter/material.dart';
import 'package:blog/constants.dart';

class CalendarTop extends StatelessWidget {
  final String month;
  final int year;
  const CalendarTop(this.year, this.month, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: isWeb ? null : EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              color: red,
            ),
            width: isWeb ? 65 : width * 0.2,
            height: 74,
            child: Center(
                child: RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      year.toString(),
                      style: TextStyle(
                        color: green,
                        fontSize: 22,
                      ),
                    ))),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: blue,
              ),
              width: width * 0.5,
              height: 74,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: new Text(
                      month,
                      style: TextStyle(
                        color: green,
                        fontSize: 44,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
