import 'package:blog/constants.dart';
import 'package:blog/widgets/blog/calendar/botom/SiguientesMeses.dart';
import 'package:flutter/material.dart';

class DiasDeLaSemana extends StatelessWidget {
  const DiasDeLaSemana({Key? key}) : super(key: key);

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
        clipBehavior: Clip.none,
        children: [
          Center(
            child: GridView.count(
              crossAxisCount: 7,
              shrinkWrap: true,
              padding: EdgeInsets.only(right: 8),
              children: List.generate(
                40,
                (i) => Container(
                  margin: EdgeInsets.only(left: 8),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      '$i',
                      style: TextStyle(
                        color: green,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SiguientesMeses(),
        ],
      ),
    );
  }
}
