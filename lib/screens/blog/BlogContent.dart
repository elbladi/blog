import 'package:blog/constants.dart';
import 'package:blog/models/Calendar.dart';
import 'package:blog/models/Day.dart';
import 'package:blog/models/FloatingOption.dart';
import 'package:blog/models/Memory.dart';
import 'package:blog/models/Month.dart';
import 'package:blog/responsive/utilitites.dart';
import 'package:blog/service/login.dart';
import 'package:blog/widgets/blog/calendar/Calendar.dart';
import 'package:blog/widgets/blog/empty/EmptyMemory.dart';
import 'package:blog/widgets/blog/text/ContentText.dart';
import 'package:blog/widgets/blog/title/DayTitle.dart';
import 'package:blog/widgets/blog/web/MemoryContentWeb.dart';
import 'package:blog/widgets/blog/web/OptionsWeb.dart';
import 'package:blog/widgets/floatingButtons/FloatingButton.dart';
import 'package:blog/widgets/utilities.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class BlogContent extends StatefulWidget {
  const BlogContent({Key? key}) : super(key: key);

  @override
  BlogContentState createState() => BlogContentState();
}

class BlogContentState extends State<BlogContent> {
  bool showCalendar = false;
  bool showOptions = false;
  bool editionMode = false;
  Function? closeThis;
  late TextEditingController controller;
  late Day selectedDay;
  late Month month;
  late String uneditedText;
  late Calendar calendar;
  @override
  void initState() {
    final args = loadCurrentData();
    month = args.month;
    selectedDay = args.day;
    calendar = args.calendar;
    uneditedText = selectedDay.exist ? selectedDay.memory!.content : "";
    controller = TextEditingController(text: uneditedText);
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
        btnOkOnPress:
            okBtn ? () => _processResponse(DismissType.BTN_OK, title) : null,
        btnCancelColor: red,
        buttonsTextStyle: TextStyle(fontSize: 15),
        btnOkColor: blue,
        btnCancelOnPress: () => _processResponse(DismissType.BTN_CANCEL, title),
        onDissmissCallback: (type) {})
      ..show();
  }

  void _processResponse(DismissType type, String title) {
    if (title == "Cancelar" && type == DismissType.BTN_CANCEL) {
      this.setState(() {
        editionMode = false;
        controller.text = uneditedText;
      });
      return;
    }

    if (title == "Publicar" && type == DismissType.BTN_OK) {
      if (controller.text.isEmpty) {
        this.setState(() {
          editionMode = false;
          selectedDay.memory = null;
        });
      } else {
        this.setState(() {
          editionMode = false;
          if (_contentExist) {
            selectedDay.memory!.content = controller.text;
          } else {
            selectedDay.memory = new Memory(false, controller.text);
          }
        });
      }
    }
  }

  bool get _contentExist => selectedDay.exist;

  void _selectOption(OptionName id) {
    switch (id) {
      case OptionName.Calendar:
        _closeOptions();
        if (isWeb) return;
        this.setState(() {
          showCalendar = !showCalendar;
        });
        break;
      case OptionName.Edit:
        _closeOptions();
        if (_contentExist) {
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
              uneditedText = controller.text;
            });
          }
        } else {
          _crearNuevo();
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
        if (_contentExist) {
          this.setState(() {
            selectedDay.memory!.favorite = true;
          });
        }
        break;
      case OptionName.Favorite:
        if (_contentExist) {
          this.setState(() {
            selectedDay.memory!.favorite = false;
          });
        }
        break;
      case OptionName.Delete:
        if (_contentExist) {
          this.setState(() {
            selectedDay.exist = false;
            selectedDay.memory = null;
            controller.text = "";
            editionMode = false;
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
    if (isWeb) return null;
    if (showOptions && closeThis != null) {
      closeThis!();
    }
  }

  void _crearNuevo() {
    this.setState(() {
      showCalendar = false;
      showOptions = false;
      selectedDay.exist = true;
      selectedDay.memory = new Memory(false, "What's on your mind?");
      controller.text = "What's on your mind?";
      editionMode = true;
    });
  }

  void _setDay(int selected) {
    if (editionMode) {
      _selectOption(OptionName.Cancel);
      return;
    }
    Day newDate = month.days.firstWhere((dia) => dia.day == selected);
    this.setState(() {
      selectedDay = newDate;
      controller.text =
          newDate.exist ? newDate.memory!.content : controller.text = "";
    });
  }

  List<Widget> webWidgets(double width) => [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    bool favorite = getFavourite(selectedDay);
    return Scaffold(
      floatingActionButton: isWeb
          ? null
          : FloatingButton(
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
        child: getStackOrRow(
          [
            isWeb
                ? CalendarWidget(selectedDay, _setDay, month, calendar.year)
                : AnimatedPositioned(
                    top: showCalendar ? 0 : -800,
                    curve: Curves.easeInOut,
                    duration: Duration(seconds: 1),
                    child: CalendarWidget(
                        selectedDay, _setDay, month, calendar.year),
                  ),
            isWeb
                ? MemoryContentWeb(
                    selectOption: _selectOption,
                    selectedDay: selectedDay,
                    closeOptions: _closeOptions,
                    editionMode: editionMode,
                    controller: controller,
                    crearNuevo: _crearNuevo,
                    calendar: calendar)
                : AnimatedPositioned(
                    top: showCalendar ? 420 : 80,
                    curve: Curves.easeInOut,
                    duration: Duration(milliseconds: 800),
                    child: DayTitle(
                      () => _selectOption(OptionName.Calendar),
                      selectedDay.day,
                      calendar,
                    ),
                  ),
            isWeb
                ? OptionsWeb(favorite, _selectOption, editionMode)
                : AnimatedPositioned(
                    curve: Curves.easeInOut,
                    duration: Duration(milliseconds: 800),
                    top: showCalendar ? 470 : 140,
                    width: !showCalendar ? width : width - 100,
                    left: showCalendar ? 30 : 0,
                    child: selectedDay.exist
                        ? ContentText(
                            closeOptions: _closeOptions,
                            editionMode: editionMode,
                            controller: controller,
                          )
                        : EmptyMemory(_crearNuevo),
                  ),
          ],
        ),
      ),
    );
  }
}
