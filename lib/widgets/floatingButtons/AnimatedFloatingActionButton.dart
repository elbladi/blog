library animated_floatactionbuttons;

import 'package:blog/widgets/floatingButtons/TransformFloatButton.dart';
import 'package:flutter/material.dart';

class AnimatedFloatingActionButton extends StatefulWidget {
  final List<Widget>? fabButtons;
  final Color? colorStartAnimation;
  final Color? colorEndAnimation;
  final AnimatedIconData? animatedIconData;
  final bool? isOpened;
  final Function? setIsOpened;

  AnimatedFloatingActionButton({
    Key? key,
    this.fabButtons,
    this.colorStartAnimation,
    this.colorEndAnimation,
    this.animatedIconData,
    this.isOpened,
    this.setIsOpened,
  }) : super(key: key);

  @override
  _AnimatedFloatingActionButtonState createState() =>
      _AnimatedFloatingActionButtonState();
}

class _AnimatedFloatingActionButtonState
    extends State<AnimatedFloatingActionButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _buttonColor;
  late Animation<double> _animateIcon;
  late Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  @override
  initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: widget.colorStartAnimation,
      end: widget.colorEndAnimation,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    final isOpened = widget.isOpened!;
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    final setIsOpened = widget.setIsOpened;
    if (setIsOpened != null) {
      setIsOpened(!isOpened, _closeThis);
    }
  }

  void _closeThis() {
    animate();
  }

  Widget toggle() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: _buttonColor.value,
        onPressed: animate,
        tooltip: 'Toggle',
        child: AnimatedIcon(
          icon: widget.animatedIconData!,
          progress: _animateIcon,
        ),
      ),
    );
  }

  List<Widget> _setFabButtons() {
    List<Widget> processButtons = List.empty(growable: true);
    final fabButtons = widget.fabButtons;
    if (fabButtons != null) {
      for (int i = 0; i < fabButtons.length; i++) {
        processButtons.add(TransformFloatButton(
          floatButton: fabButtons[i],
          translateValue: _translateButton.value * (fabButtons.length - i),
        ));
      }
    }
    processButtons.add(toggle());
    return processButtons;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: _setFabButtons(),
    );
  }
}
