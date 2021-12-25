import 'package:flutter/material.dart';
import 'package:blog/constants.dart';

class SiguientesMeses extends StatelessWidget {
  const SiguientesMeses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Positioned(
      top: 350,
      child: Container(
        width: width,
        // color: Colors.amber,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Noviembre",
              style: TextStyle(
                color: blue,
                fontSize: 12,
              ),
            ),
            Text(
              "Enero",
              style: TextStyle(
                color: blue,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
