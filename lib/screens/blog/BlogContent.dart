import 'package:blog/constants.dart';
import 'package:blog/models/FloatingOption.dart';
import 'package:blog/widgets/blog/calendar/Calendar.dart';
import 'package:blog/widgets/blog/text/ContentText.dart';
import 'package:blog/widgets/blog/title/DayTitle.dart';
import 'package:blog/widgets/floatingButtons/FloatingButton.dart';
import 'package:flutter/material.dart';

class BlogContent extends StatefulWidget {
  const BlogContent({Key? key}) : super(key: key);

  @override
  BlogContentState createState() => BlogContentState();
}

class BlogContentState extends State<BlogContent> {
  bool showCalendar = false;
  bool showOptions = false;
  Function? closeThis;

  @override
  void initState() {
    super.initState();
  }

  void _toggleCalendar() {
    this.setState(() {
      showCalendar = !showCalendar;
    });
  }

  void _selectOption(OptionName id) {
    switch (id) {
      case OptionName.Calendar:
        _toggleCalendar();
        break;
      default:
        break;
    }
  }

  void _setIsOpened(bool val, Function closeThisShit) {
    this.setState(() {
      showOptions = val;
      closeThis = closeThisShit;
    });
  }

  Function? _closeOptions() {
    if (showOptions && closeThis != null) {
      closeThis!();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    return Scaffold(
      floatingActionButton:
          FloatingButton(_selectOption, showOptions, _setIsOpened),
      body: Container(
        color: green,
        height: double.infinity,
        width: width,
        child: Stack(
          children: [
            AnimatedPositioned(
              top: showCalendar ? 0 : -800,
              child: Calendar(),
              curve: Curves.easeInOut,
              duration: Duration(seconds: 1),
            ),
            AnimatedPositioned(
              top: showCalendar ? 420 : 80,
              child: DayTitle(() => _selectOption(OptionName.Calendar)),
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: 800),
            ),
            AnimatedPositioned(
              top: showCalendar ? 470 : 140,
              child: ContentText(_closeOptions),
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: 800),
            ),
          ],
        ),
      ),
    );
  }
}
