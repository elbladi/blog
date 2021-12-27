import 'package:blog/constants.dart';
import 'package:blog/models/Day.dart';
import 'package:blog/models/Month.dart';
import 'package:blog/widgets/utilities.dart';
import 'package:flutter/material.dart';

class DiasDeLaSemana extends StatelessWidget {
  final Day day;
  final Month month;
  final Function setDay;
  const DiasDeLaSemana(this.day, this.setDay, this.month, {Key? key})
      : super(key: key);

  Color _getColor(int id) {
    return month.days[id - 1].exist ? green : transparent;
  }

  Widget _getText(int id, bool fav) {
    return Stack(
      children: [
        fav ? _getHearth : SizedBox(),
        Center(
          child: Text(
            id.toString(),
            style: TextStyle(
              color: _getColor(id),
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }

  Widget get _getHearth => Positioned.fill(
        child: Icon(
          Icons.favorite,
          size: 30,
          color: red,
        ),
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
                        margin: const EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: transparent,
                        ),
                        child: Center(
                          child: _getText(
                            month.days[i].day,
                            getFavourite(month.days[i]),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () => setDay(i + 1),
                        child: Container(
                          margin: const EdgeInsets.only(left: 8),
                          child: Center(
                            child: _getText(
                              month.days[i].day,
                              getFavourite(month.days[i]),
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
