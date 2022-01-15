import 'package:blog/constants.dart';
import 'package:blog/models/Calendar.dart';
import 'package:blog/models/Day.dart';
import 'package:blog/models/Month.dart';
import 'package:blog/widgets/utilities.dart';
import 'package:flutter/material.dart';

class DiasDeLaSemana extends StatelessWidget {
  final Day day;
  final Month month;
  final Function setDay;
  final Calendar calendar;
  const DiasDeLaSemana(this.day, this.setDay, this.month, this.calendar,
      {Key? key})
      : super(key: key);

  Color _getColor(int id) {
    return month.days[id - 1].exist ? green : transparent;
  }

  Widget _getText(int id, bool fav) {
    return Stack(
      children: [
        fav ? _getHearth : SizedBox(),
        Center(
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              id.toString(),
              style: TextStyle(
                color: _getColor(id),
                fontSize: 20,
              ),
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

  Map<String, int> getDetails() {
    final monthId = months.indexOf(month.id);
    final firstDay = new DateTime(calendar.year, monthId + 1, 1);
    return {
      "weekday": firstDay.weekday,
      "lenght": month.days.length + (firstDay.weekday - 1)
    };
  }

  @override
  Widget build(BuildContext context) {
    final details = getDetails();
    int startAt = details["weekday"]! - 1;
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
                details["lenght"]!,
                (i) => startAt >= i + 1
                    ? SizedBox()
                    : day.day == (i + 1 - startAt)
                        ? Container(
                            margin: const EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: transparent,
                            ),
                            child: Center(
                              child: _getText(
                                (i + 1 - startAt),
                                getFavourite(month.days[i - startAt]),
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              setDay(i + 1 - startAt);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 8),
                              child: Center(
                                child: _getText(
                                  (i + 1 - startAt),
                                  getFavourite(month.days[(i - startAt)]),
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
