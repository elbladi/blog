import 'package:flutter/material.dart';

class ContentText extends StatefulWidget {
  final Function closeOptions;
  final bool editionMode;
  final TextEditingController controller;

  ContentText(
      {required this.controller,
      required this.closeOptions,
      required this.editionMode,
      Key? key})
      : super(key: key);

  @override
  _ContentTextState createState() => _ContentTextState();
}

class _ContentTextState extends State<ContentText> {
  TextStyle get _textStyle => TextStyle(fontSize: 17, fontFamily: "Montserrat");
  FocusNode myFocusNode = FocusNode();

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return GestureDetector(
      onTap: () => widget.closeOptions(),
      child: Container(
        width: width,
        height: height - (myFocusNode.hasFocus ? height * 0.5 : 150),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      widget.editionMode
                          ? TextFormField(
                              style: _textStyle,
                              textCapitalization: TextCapitalization.sentences,
                              maxLines: null,
                              controller: widget.controller,
                              focusNode: myFocusNode,
                              decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            )
                          : Text(widget.controller.text, style: _textStyle),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
