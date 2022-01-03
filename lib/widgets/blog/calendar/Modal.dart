import 'package:blog/constants.dart';
import 'package:flutter/material.dart';

class Modal extends StatelessWidget {
  final String month;
  final Function selectMonth;
  const Modal(this.month, this.selectMonth, {Key? key}) : super(key: key);

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
          children: months.map(
            (m) {
              bool selected = month == m;
              return GestureDetector(
                onTap: () {
                  if (selected) return;
                  selectMonth(m);
                  Navigator.of(context).pop();
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
          ).toList(),
        ),
      ),
    );
  }
}
