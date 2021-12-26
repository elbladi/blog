import 'package:blog/constants.dart';
import 'package:blog/widgets/floatingButtons/AnimatedFloatingActionButton.dart';
import 'package:blog/widgets/floatingButtons/options/constants.dart';
import 'package:flutter/material.dart';
import 'options/OptionBubble.dart';

class FloatingButton extends StatefulWidget {
  final Function onPress;
  const FloatingButton(this.onPress, {Key? key}) : super(key: key);

  @override
  _FloatingButtonState createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  List<Widget> get _options => List.generate(
        options.length,
        (i) =>
            OptionBubble(() => widget.onPress(options[i].id), options[i].icon),
      );

  @override
  Widget build(BuildContext context) {
    return AnimatedFloatingActionButton(
      fabButtons: _options,
      colorStartAnimation: blue,
      colorEndAnimation: blue,
      animatedIconData: AnimatedIcons.add_event,
    );
  }
}
