import 'package:blog/constants.dart';
import 'package:blog/widgets/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginButton extends StatefulWidget {
  final String text;
  final Function onSubmit;
  LoginButton(this.text, this.onSubmit);

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  late bool left;
  final controller = TextEditingController();
  @override
  void initState() {
    left = false;
    super.initState();
  }

  void _onTap() {
    this.setState(() {
      left = !left;
    });
  }

  void _onSubmit(String input) {
    controller.text = "";
    widget.onSubmit();
  }

  Widget _textField() {
    return AnimatedOpacity(
      opacity: !left ? 0 : 1,
      curve: Curves.easeIn,
      duration: Duration(milliseconds: 500),
      child: Padding(
        padding: EdgeInsets.only(top: 20, left: 100),
        child: TextField(
          style: TextStyle(color: white),
          decoration: const InputDecoration(
            enabledBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
          controller: controller,
          onSubmitted: (String e) => _onSubmit(e),
        ),
      ),
    );
  }

  Widget _animatedText() {
    return AnimatedOpacity(
      opacity: left ? 0 : 1,
      curve: Curves.easeOut,
      duration: Duration(milliseconds: 500),
      child: Padding(
        padding: EdgeInsets.only(top: 30, left: 25),
        child: Text(
          widget.text,
          style: TextStyle(color: white, fontSize: 20),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = getWidth(MediaQuery.of(context).size.width, Size.large);
    return Container(
      decoration: BoxDecoration(
        boxShadow: getShadows(),
        color: blue,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      width: width,
      height: 84,
      child: Stack(
        children: [
          _animatedText(),
          _textField(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: AnimatedAlign(
              alignment: left ? Alignment.centerLeft : Alignment.centerRight,
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              child: GestureDetector(
                onTap: _onTap,
                child: SvgPicture.asset("assets/cigarrete.svg",
                    color: white, height: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
