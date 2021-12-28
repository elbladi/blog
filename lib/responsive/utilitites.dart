import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

bool get isWeb => kIsWeb;

Widget getStackOrRow(List<Widget> children) {
  return isWeb ? Row(children: children) : Stack(children: children);
}
