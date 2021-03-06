import 'package:blog/responsive/utilitites.dart';
import 'package:blog/widgets/blog/calendar/Liga.dart';
import 'package:flutter/material.dart';

class Ligas extends StatelessWidget {
  const Ligas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Positioned(
      left: isWeb ? 37 : 90,
      top: 60,
      child: Container(
        width: isWeb ? 240 : width - 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(6, (i) => Liga()).toList(),
        ),
      ),
    );
  }
}
