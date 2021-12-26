import 'package:blog/constants.dart';
import 'package:blog/models/FloatingOption.dart';
import 'package:blog/widgets/floatingButtons/AnimatedFloatingActionButton.dart';
import 'package:blog/widgets/floatingButtons/options/constants.dart';
import 'package:flutter/material.dart';
import 'options/OptionBubble.dart';

class FloatingButton extends StatefulWidget {
  final Function onPress;
  final bool isOpened;
  final Function setIsOpened;
  final bool editionMode;
  const FloatingButton(
      this.onPress, this.isOpened, this.setIsOpened, this.editionMode,
      {Key? key})
      : super(key: key);

  @override
  _FloatingButtonState createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  List<Widget> _options() {
    return List.generate(options.length, (i) {
      OptionName id = options[i].id;
      IconData icon = options[i].icon;
      if (widget.editionMode) {
        if (id == OptionName.Edit) icon = Icons.send;
        if (id == OptionName.Calendar) {
          icon = Icons.clear;
          id = OptionName.Cancel;
        }
      }
      return OptionBubble(() => widget.onPress(id), icon);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedFloatingActionButton(
      fabButtons: _options(),
      colorStartAnimation: blue,
      colorEndAnimation: blue,
      animatedIconData: AnimatedIcons.add_event,
      isOpened: widget.isOpened,
      setIsOpened: (bool val, Function closeThis) =>
          widget.setIsOpened(val, closeThis),
    );
  }
}
