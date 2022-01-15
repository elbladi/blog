import 'package:blog/constants.dart';
import 'package:flutter/material.dart';

class OptionBubble extends StatelessWidget {
  final Function onPress;
  final IconData icon;
  const OptionBubble(this.onPress, this.icon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () => onPress(),
      elevation: 2.0,
      fillColor: blue,
      child: Icon(
        icon,
        color: white,
      ),
      padding: EdgeInsets.all(15.0),
      shape: CircleBorder(),
    );
  }
}
