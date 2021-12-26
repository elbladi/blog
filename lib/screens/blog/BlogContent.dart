import 'package:blog/constants.dart';
import 'package:blog/models/FloatingOption.dart';
import 'package:blog/widgets/blog/calendar/Calendar.dart';
import 'package:blog/widgets/floatingButtons/FloatingButton.dart';
import 'package:flutter/material.dart';

class BlogContent extends StatefulWidget {
  const BlogContent({Key? key}) : super(key: key);

  @override
  BlogContentState createState() => BlogContentState();
}

class BlogContentState extends State<BlogContent> {
  bool show = true;

  @override
  void initState() {
    super.initState();
  }

  void _toggleCalendar() {
    this.setState(() {
      show = !show;
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

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingButton(_selectOption),
      body: Container(
        color: green,
        height: double.infinity,
        width: width,
        child: Stack(
          children: [
            AnimatedPositioned(
              // top: show ? -800 : 0, //this line is the chida
              top: !show ? -800 : 0,
              child: Calendar(),
              curve: Curves.easeInOut,
              duration: Duration(seconds: 1),
            ),
          ],
        ),
      ),
    );
  }
}
