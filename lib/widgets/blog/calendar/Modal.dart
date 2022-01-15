import 'package:blog/constants.dart';
import 'package:flutter/material.dart';

class Modal extends StatelessWidget {
  final String? month;
  final int? year;
  final Function? selectMonth;
  final Function? selectYear;

  Modal({this.month, this.selectMonth, this.year, this.selectYear});

  List<Widget> getGrid(BuildContext ctx) {
    if (month != null && selectMonth != null) {
      return months.map(
        (m) {
          bool selected = month == m;
          return GestureDetector(
            onTap: () {
              if (selected) return;
              selectMonth!(m);
              Navigator.of(ctx).pop();
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: red),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 2,
                    offset: Offset(1, 2),
                  ),
                ],
                color: selected ? blue : white,
              ),
              child: Center(
                child: Text(
                  m.substring(0, 3),
                  style: TextStyle(
                    color: selected ? white : blue,
                  ),
                ),
              ),
            ),
          );
        },
      ).toList();
    } else {
      List<int> years = [
        year! - 4,
        year! - 3,
        year! - 2,
        year! - 1,
        year!,
        year! + 1,
        year! + 2,
        year! + 3,
        year! + 4,
      ];
      return years.map(
        (m) {
          bool selected = year == m;
          return GestureDetector(
            onTap: () {
              if (selected) return;
              selectYear!(m);
              Navigator.of(ctx).pop();
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: red),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 2,
                    offset: Offset(1, 2),
                  ),
                ],
                color: selected ? blue : white,
              ),
              child: Center(
                child: Text(
                  m.toString(),
                  style: TextStyle(
                    color: selected ? white : blue,
                  ),
                ),
              ),
            ),
          );
        },
      ).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 200,
      child: Center(
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 25,
          mainAxisSpacing: 10,
          children: getGrid(context),
        ),
      ),
    );
  }
}
