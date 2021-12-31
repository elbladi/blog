import 'package:blog/constants.dart';
import 'package:blog/models/Day.dart';
import 'package:blog/models/FloatingOption.dart';
import 'package:blog/widgets/blog/text/ContentText.dart';
import 'package:blog/widgets/blog/title/DayTitle.dart';
import 'package:flutter/material.dart';

class MemoryContentWeb extends StatelessWidget {
  final Function selectOption;
  final Function closeOptions;
  final Function crearNuevo;
  final Day selectedDay;
  final bool editionMode;
  final TextEditingController controller;

  MemoryContentWeb({
    required this.selectOption,
    required this.selectedDay,
    required this.closeOptions,
    required this.editionMode,
    required this.controller,
    required this.crearNuevo,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DayTitle(() => selectOption(OptionName.Calendar), selectedDay.day),
          if (selectedDay.exist)
            ContentText(
              closeOptions: closeOptions,
              editionMode: editionMode,
              controller: controller,
            ),
          if (!selectedDay.exist)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                  height: height - height * 0.3,
                  image: AssetImage('assets/emptines.gif'),
                ),
              ),
            ),
          if (!selectedDay.exist) SizedBox(height: 40),
          if (!selectedDay.exist)
            GestureDetector(
              onTap: () => crearNuevo(),
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
                        color: white,
                        fontSize: 21,
                        fontFamily: "PermanentMarker"),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
