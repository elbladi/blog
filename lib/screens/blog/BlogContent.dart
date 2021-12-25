import 'package:blog/constants.dart';
import 'package:blog/widgets/blog/calendar/Calendar.dart';
import 'package:flutter/material.dart';

class BlogContent extends StatefulWidget {
  const BlogContent({Key? key}) : super(key: key);

  @override
  BlogContentState createState() => BlogContentState();
}

class BlogContentState extends State<BlogContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: green,
        height: double.infinity,
        child: Calendar(),
      ),
    );
  }
}
