import 'package:blog/responsive/utilitites.dart';
import 'package:flutter/material.dart';
import 'package:blog/constants.dart';

class Liga extends StatelessWidget {
  const Liga({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Stack(
        children: [
          Positioned(
            child: Container(
              //Node Up
              decoration: new BoxDecoration(
                color: green,
                shape: BoxShape.circle,
              ),
              width: 13,
              height: 13,
            ),
          ),
          Positioned(
            top: isWeb ? 23 : 16,
            child: Container(
              //Node Down
              decoration: new BoxDecoration(
                color: green,
                shape: BoxShape.circle,
              ),
              width: 13,
              height: 13,
            ),
          ),
          Positioned(
            top: 6,
            left: 3,
            child: Container(
              //Bar
              height: isWeb ? 25 : 18,
              width: 7,
              decoration: new BoxDecoration(
                color: white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
