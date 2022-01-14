import 'package:blog/constants.dart';
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

  void _onT() {
    print("ont");
    widget.closeOptions();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final b = MediaQuery.of(context).viewInsets.bottom;
    return GestureDetector(
      onTap: () => _onT(),
      child: Container(
        width: width,
        height: myFocusNode.hasFocus ? 250 : height - height * 0.2,
        padding: EdgeInsets.only(left: 10, right: 10, bottom: b),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
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
                                contentPadding: EdgeInsets.only(bottom: b),
                              ),
                            )
                          : Text(widget.controller.text, style: _textStyle),
                    ],
                  ),
                ),
              ),
            ),
            myFocusNode.hasFocus
                ? GestureDetector(
                    onTap: () => FocusScope.of(context).unfocus(),
                    child: Container(
                      width: double.infinity,
                      child: Center(
                          child: Text(
                        "Ya",
                        style: TextStyle(color: transparent),
                      )),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
