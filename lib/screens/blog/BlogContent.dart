import 'package:blog/constants.dart';
import 'package:blog/models/Calendar.dart';
import 'package:blog/models/CurrentData.dart';
import 'package:blog/models/Day.dart';
import 'package:blog/models/FloatingOption.dart';
import 'package:blog/models/Memory.dart';
import 'package:blog/models/Month.dart';
import 'package:blog/responsive/utilitites.dart';
import 'package:blog/service/blogs.dart';
import 'package:blog/service/login.dart';
import 'package:blog/store/store.dart';
import 'package:blog/widgets/blog/calendar/Calendar.dart';
import 'package:blog/widgets/blog/calendar/Modal.dart';
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
  bool error = false;
  late TextEditingController controller;
  late Day selectedDay;
  late Month month;
  late String uneditedText;
  late Calendar calendar;
  @override
  void initState() {
    CurrentData data = Redux.store.state.blogState.currentData;
    month = data.month;
    selectedDay = data.day;
    calendar = data.calendar;
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

  void _processResponse(DismissType type, String title) async {
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
        if (_contentExist) {
          try {
            await updateBlog(controller.text, calendar, selectedDay.day,
                selectedDay.memory!.favorite);
            this.setState(() {
              editionMode = false;
              selectedDay.memory!.content = controller.text;
            });
          } catch (e) {}
        } else {
          this.setState(() {
            editionMode = false;
            selectedDay.memory = new Memory(false, controller.text);
          });
        }
      }
    }
  }

  bool get _contentExist => selectedDay.exist;

  void _selectOption(OptionName id) async {
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
              '??Publicar cambios?',
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
          '??Cancelar tus cambios? Esta accion no se puede revertir',
          DialogType.WARNING,
          cancelTxt: 'Salir',
        );
        break;
      case OptionName.NoFavorite:
        if (_contentExist) {
          await updateFav(calendar.year, calendar.month, selectedDay.day, true);
          this.setState(() {
            selectedDay.memory!.favorite = true;
          });
        }
        break;
      case OptionName.Favorite:
        if (_contentExist) {
          await updateFav(
              calendar.year, calendar.month, selectedDay.day, false);
          this.setState(() {
            selectedDay.memory!.favorite = false;
          });
        }
        break;
      case OptionName.Delete:
        if (_contentExist) _askDelete();
        _closeOptions();
        break;
      default:
        break;
    }
  }

  void _askDelete() {
    AwesomeDialog(
        context: context,
        dialogType: DialogType.WARNING,
        headerAnimationLoop: true,
        animType: AnimType.SCALE,
        title: "??Deseas eliminar memoria?",
        desc: "Cuidado Goku! Esta accion no se puede revertir",
        btnOkText: "Eliminar",
        btnOkOnPress: () async {
          await deleteMemory(calendar.year, calendar.month, selectedDay.day);
          this.setState(() {
            selectedDay.exist = false;
            selectedDay.memory = null;
            controller.text = "";
            editionMode = false;
          });
        },
        buttonsTextStyle: TextStyle(fontSize: 15),
        btnOkColor: red,
        onDissmissCallback: (type) {})
      ..show();
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

  void _crearNuevo() async {
    if (isAfter(calendar, selectedDay)) {
      this.setState(() {
        error = true;
      });
      await Future.delayed(Duration(seconds: 5));
      this.setState(() {
        error = false;
      });
    } else {
      this.setState(() {
        showCalendar = false;
        showOptions = false;
        selectedDay.exist = true;
        selectedDay.memory = new Memory(false, "What's on your mind?");
        controller.text = "What's on your mind?";
        editionMode = true;
      });
    }
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

  void _changeMonth(int index) {
    final indexCurrentMonth = months.indexOf(calendar.month) + 1;
    var newCalendar;
    if (index == 1) {
      if (indexCurrentMonth == DateTime.december) {
        newCalendar = new Calendar(calendar.year + 1, months[0], 1);
      } else {
        newCalendar = new Calendar(calendar.year, months[indexCurrentMonth], 1);
      }
    } else {
      //go to prev month
      if (indexCurrentMonth == DateTime.january) {
        newCalendar = new Calendar(calendar.year - 1, months[11], 1);
      } else {
        newCalendar =
            new Calendar(calendar.year, months[indexCurrentMonth - 2], 1);
      }
    }
    _fetchNewInfo(newCalendar);
  }

  void _setToday() async {
    try {
      final details = await loadCurrentData();
      final newDay = details.day;
      final newText = newDay.exist ? newDay.memory!.content : "";
      this.setState(() {
        month = details.month;
        selectedDay = newDay;
        calendar = details.calendar;
        controller.text = newText;
      });
    } catch (e) {
      print("whuuuuut???");
    }
  }

  void _setMonth(String month) {
    showAnimatedDialog(
        context, Modal(month: month, selectMonth: _selectedMonth));
  }

  void _selectedMonth(String monthSelected) {
    Calendar newCalendar =
        new Calendar(calendar.year, monthSelected, selectedDay.day);
    _fetchNewInfo(newCalendar);
  }

  void _setYear(int year) {
    showAnimatedDialog(context, Modal(year: year, selectYear: _changeYear));
  }

  void _changeYear(int newYear) {
    Calendar newCalendar =
        new Calendar(newYear, calendar.month, selectedDay.day);
    _fetchNewInfo(newCalendar);
  }

  void _fetchNewInfo(Calendar newCalendar) async {
    final details = await fetchMonthDetails(newCalendar);
    final newDay = details.day;
    final newText = newDay.exist ? newDay.memory!.content : "";
    this.setState(() {
      month = details.month;
      selectedDay = newDay;
      calendar = newCalendar;
      controller.text = newText;
    });
  }

  void _logout() {
    AwesomeDialog(
        context: context,
        dialogType: DialogType.QUESTION,
        headerAnimationLoop: true,
        animType: AnimType.SCALE,
        title: "Salir",
        desc: "??Deseas salir?",
        btnOkText: "Simon",
        btnCancelText: "No",
        btnOkOnPress: () => Navigator.of(context).pushReplacementNamed("/"),
        btnCancelColor: red,
        buttonsTextStyle: TextStyle(fontSize: 15),
        btnOkColor: blue,
        btnCancelOnPress: () {},
        onDissmissCallback: (type) {})
      ..show();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    bool favorite = getFavourite(selectedDay);
    return WillPopScope(
      onWillPop: () async {
        if (editionMode) FocusScope.of(context).unfocus();
        return false;
      },
      child: Scaffold(
        floatingActionButton: isWeb
            ? null
            : FloatingButton(
                _selectOption,
                showOptions,
                _setIsOpened,
                editionMode,
                favorite,
              ),
        resizeToAvoidBottomInset: true,
        body: GestureDetector(
          onHorizontalDragEnd: (details) {
            if (details.primaryVelocity != null) {
              if (details.primaryVelocity! > 1000) {
                _logout();
              }
            }
          },
          child: Container(
            color: green,
            height: double.infinity,
            width: width,
            child: getStackOrRow(
              [
                isWeb
                    ? CalendarWidget(selectedDay, _setDay, month, calendar,
                        _changeMonth, _setToday, _setMonth, _setYear)
                    : AnimatedPositioned(
                        top: showCalendar ? 0 : -800,
                        curve: Curves.easeInOut,
                        duration: Duration(seconds: 1),
                        child: CalendarWidget(
                            selectedDay,
                            _setDay,
                            month,
                            calendar,
                            _changeMonth,
                            _setToday,
                            _setMonth,
                            _setYear),
                      ),
                isWeb
                    ? MemoryContentWeb(
                        selectOption: _selectOption,
                        selectedDay: selectedDay,
                        closeOptions: _closeOptions,
                        editionMode: editionMode,
                        controller: controller,
                        crearNuevo: _crearNuevo,
                        calendar: calendar,
                        showError: error,
                        setDay: _setDay,
                      )
                    : AnimatedPositioned(
                        top: showCalendar ? 420 : 80,
                        curve: Curves.easeInOut,
                        duration: Duration(milliseconds: 800),
                        child: DayTitle(
                          () => _selectOption(OptionName.Calendar),
                          selectedDay.day,
                          calendar,
                          _setDay,
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
                            : EmptyMemory(_crearNuevo, error),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
