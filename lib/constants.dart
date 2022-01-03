import 'package:flutter/material.dart';

Color get green {
  return const Color.fromRGBO(181, 186, 114, 1);
}

Color get blue {
  return const Color.fromRGBO(44, 73, 127, 1);
}

Color get white {
  return const Color.fromRGBO(255, 255, 255, 1);
}

Color get red {
  return const Color.fromRGBO(146, 55, 77, 1);
}

Color get transparent {
  return const Color.fromRGBO(0, 0, 0, 0.5);
}

List<String> dias = ["Lun", "Mar", "Mie", "Jue", "Vie", "Sab", "Dom"];
List<String> months = [
  "Enero",
  "Febrero",
  "Marzo",
  "Abril",
  "Mayo",
  "Junio",
  "Julio",
  "Agosto",
  "Septiembre",
  "Octubre",
  "Noviembre",
  "Diciembre"
];
//Routes
const ContentScreen = 'blog_main';
const LoadingScreen = 'loading';
const ERROR_MESSAGE = "nain, the future is uncertain... isn't it?";
