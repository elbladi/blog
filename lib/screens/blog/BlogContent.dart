import 'package:blog/constants.dart';
import 'package:blog/models/FloatingOption.dart';
import 'package:blog/widgets/blog/calendar/Calendar.dart';
import 'package:blog/widgets/blog/text/ContentText.dart';
import 'package:blog/widgets/blog/title/DayTitle.dart';
import 'package:blog/widgets/floatingButtons/FloatingButton.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

const texto =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum";

class BlogContent extends StatefulWidget {
  const BlogContent({Key? key}) : super(key: key);

  @override
  BlogContentState createState() => BlogContentState();
}

class BlogContentState extends State<BlogContent> {
  bool showCalendar = false;
  bool showOptions = false;
  bool editionMode = false;
  bool favorite = false;
  bool exist = true;
  int day = 15;
  Function? closeThis;
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: texto);
    super.initState();
  }

  AwesomeDialog _showDialog(
    String title,
    String desc,
    DialogType type, {
    bool okBtn = false,
    String cancelTxt = "Cancelar",
  }) {
    return AwesomeDialog(
      context: context,
      dialogType: type,
      headerAnimationLoop: true,
      animType: AnimType.SCALE,
      title: title,
      desc: desc,
      btnOkText: okBtn ? "Ok" : null,
      btnCancelText: cancelTxt,
      btnOkOnPress: okBtn ? () {} : null,
      btnCancelColor: red,
      buttonsTextStyle: TextStyle(fontSize: 15),
      btnOkColor: blue,
      btnCancelOnPress: () {},
      onDissmissCallback: (type) {
        _processResponse(type, title);
        return;
      },
    )..show();
  }

  void _processResponse(DismissType type, String title) {
    if (title == "Cancelar" && type == DismissType.BTN_CANCEL) {
      this.setState(() {
        editionMode = false;
        controller.text = texto;
      });
      return;
    }

    if (title == "Publicar" && type == DismissType.BTN_OK) {
      this.setState(() {
        editionMode = false;
      });
    }
  }

  void _selectOption(OptionName id) {
    switch (id) {
      case OptionName.Calendar:
        _closeOptions();
        this.setState(() {
          showCalendar = !showCalendar;
        });
        break;
      case OptionName.Edit:
        _closeOptions();
        if (editionMode) {
          _showDialog(
            'Publicar',
            '¿Publicar cambios?',
            DialogType.INFO,
            okBtn: true,
          );
        } else {
          this.setState(() {
            editionMode = true;
          });
        }
        break;
      case OptionName.Cancel:
        _closeOptions();
        _showDialog(
          'Cancelar',
          '¿Cancelar tus cambios? Esta accion no se puede revertir',
          DialogType.WARNING,
          cancelTxt: 'Salir',
        );
        break;
      case OptionName.NoFavorite:
        this.setState(() {
          favorite = true;
        });
        break;
      case OptionName.Favorite:
        this.setState(() {
          favorite = false;
        });
        break;
      case OptionName.Delete:
        if (exist) {
          this.setState(() {
            exist = false;
          });
        }
        _closeOptions();
        break;
      default:
        break;
    }
  }

  void _setIsOpened(bool val, Function closeThisShit) {
    this.setState(() {
      showOptions = val;
      closeThis = closeThisShit;
    });
  }

  Function? _closeOptions() {
    if (showOptions && closeThis != null) {
      closeThis!();
    }
  }

  void _crearNuevo() {
    this.setState(() {
      showCalendar = false;
      showOptions = false;
      favorite = false;
      exist = true;
      controller.text = "What's on your mind?";
    });
  }

  void _setDay(int selectedDay) {
    this.setState(() {
      day = selectedDay;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    return Scaffold(
      floatingActionButton: FloatingButton(
        _selectOption,
        showOptions,
        _setIsOpened,
        editionMode,
        favorite,
      ),
      body: Container(
        color: green,
        height: double.infinity,
        width: width,
        child: Stack(
          children: [
            AnimatedPositioned(
              top: showCalendar ? 0 : -800,
              child: Calendar(day, _setDay, favorite),
              curve: Curves.easeInOut,
              duration: Duration(seconds: 1),
            ),
            AnimatedPositioned(
              top: showCalendar ? 420 : 80,
              child: DayTitle(() => _selectOption(OptionName.Calendar)),
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: 800),
            ),
            AnimatedPositioned(
              top: showCalendar ? 470 : 140,
              width: !showCalendar ? width : width - 100,
              left: showCalendar ? 30 : 0,
              child: exist
                  ? ContentText(
                      closeOptions: _closeOptions,
                      editionMode: editionMode,
                      controller: controller,
                    )
                  : Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: GestureDetector(
                        onTap: _crearNuevo,
                        child: Image(
                          image: AssetImage('assets/emptines.gif'),
                        ),
                      ),
                    ),
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: 800),
            ),
          ],
        ),
      ),
    );
  }
}
