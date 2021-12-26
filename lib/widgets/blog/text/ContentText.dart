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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return GestureDetector(
      onTap: () => widget.closeOptions(),
      child: Container(
        width: width,
        height: height - height * 0.2,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    widget.editionMode
                        ? TextFormField(
                            style: _textStyle,
                            textCapitalization: TextCapitalization.sentences,
                            maxLines: null,
                            decoration: const InputDecoration(
                              enabledBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                            controller: widget.controller,
                            // initialValue: widget.controller.text,
                          )
                        : Text(widget.controller.text, style: _textStyle),
                    Container(
                      height: 100,
                      width: 40,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
