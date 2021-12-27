import 'package:blog/constants.dart';
import 'package:blog/models/Day.dart';
import 'package:blog/models/Month.dart';
import 'package:blog/widgets/utilities.dart';
import 'package:flutter/material.dart';

class DiasDeLaSemana extends StatelessWidget {
  final Day day;
  final Month month;
  final Function setDay;
  // final bool loved;
  const DiasDeLaSemana(this.day, this.setDay, this.month, {Key? key})
      : super(key: key);

  bool get _getFav => getFavourite(day);

  Widget _getText(int id) {
    return Stack(
      children: [
        _getFav ? _getHearth : SizedBox(),
        Text(
          id.toString(),
          style: TextStyle(
            color: green,
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  Widget get _getHearth => Icon(
        Icons.favorite,
        size: 30,
        color: red,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: blue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: GridView.count(
              crossAxisCount: 7,
              shrinkWrap: true,
              padding: EdgeInsets.only(right: 8),
              children: List.generate(
                month.days.length,
                (i) => month.days[i].day == day.day
                    ? Container(
                        margin: EdgeInsets.only(left: 8),
                        color: transparent,
                        child: Center(child: _getText(month.days[i].day)),
                      )
                    : GestureDetector(
                        onTap: () => setDay(i + 1),
                        child: Container(
                          margin: EdgeInsets.only(left: 8),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: _getText(month.days[i].day),
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
