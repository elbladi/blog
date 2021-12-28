import 'package:blog/constants.dart';
import 'package:flutter/material.dart';

class EmptyMemory extends StatelessWidget {
  final Function _crearNuevo;
  const EmptyMemory(this._crearNuevo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              image: AssetImage('assets/emptines.gif'),
            ),
          ),
        ),
        SizedBox(height: 40),
        GestureDetector(
          onTap: () => _crearNuevo(),
          child: Container(
            width: width - width * 0.6,
            height: 44,
            decoration: BoxDecoration(
              color: blue,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                "CREAR",
                style: TextStyle(
                    color: white, fontSize: 21, fontFamily: "PermanentMarker"),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
