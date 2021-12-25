import 'package:blog/constants.dart';
import 'package:flutter/material.dart';

class DiaSemana extends StatelessWidget {
  const DiaSemana({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: red,
      ),
      height: 51,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: dias
            .map(
              (dia) => FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  dia,
                  style: TextStyle(color: green),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
