import 'package:flutter/material.dart';
import 'package:blog/constants.dart';

class SiguientesMeses extends StatelessWidget {
  const SiguientesMeses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Positioned(
      bottom: -20,
      child: Container(
        width: width - width * 0.3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Noviembre",
              style: TextStyle(
                color: blue,
                fontSize: 13,
              ),
            ),
            Text(
              "Enero",
              style: TextStyle(
                color: blue,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
