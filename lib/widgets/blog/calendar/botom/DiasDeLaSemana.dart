import 'package:blog/constants.dart';
import 'package:flutter/material.dart';

class DiasDeLaSemana extends StatelessWidget {
  final int day;
  final Function setDay;
  final bool loved;
  const DiasDeLaSemana(this.day, this.setDay, this.loved, {Key? key})
      : super(key: key);

  Widget _getText(String day) {
    return Text(
      day,
      style: TextStyle(
        color: green,
        fontSize: 20,
      ),
    );
  }

  Widget get _getHearth => Icon(
        Icons.favorite,
        size: 30,
        color: red,
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
                30,
                (i) => day == i + 1
                    ? Container(
                        margin: EdgeInsets.only(left: 8),
                        color: transparent,
                        child: Center(child: _getText('${i + 1}')),
                      )
                    : GestureDetector(
                        onTap: () => setDay(i + 1),
                        child: Container(
                          margin: EdgeInsets.only(left: 8),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: loved
                                ? Stack(
                                    children: [
                                      _getHearth,
                                      _getText('${i + 1}'),
                                    ],
                                  )
                                : _getText('${i + 1}'),
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
