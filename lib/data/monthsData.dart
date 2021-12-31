const months = const [
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

Map<String, dynamic> fromDB() {
  return {
    months[0]: _getList(31), //Enero
    months[1]: _getList(28), //Feb
    months[2]: _getList(31), //Mar
    months[3]: _getList(30), //Abr
    months[4]: _getList(31), //May
    months[5]: _getList(30), //Jun
    months[6]: _getList(31), //Jul
    months[7]: _getList(31), //Ago
    months[8]: _getList(30), //Sep
    months[9]: _getList(31), //Oct
    months[10]: _getList(30), //Nov
    months[11]: _getList(31), //Dic
  };
}

List<dynamic> _getList(int l) {
  return List.generate(
      l,
      (i) => {
            "day": i + 1,
            "exist": false,
          });
}

// List<dynamic> get daysData => List.generate(
//     31,
//     (i) => {
//           "day": i + 1,
//           "exist": false,
//         });

List<dynamic> daysData2 = [
  {
    "day": 1,
    "exist": false,
  },
  {
    "day": 2,
    "exist": true,
    "memory": {
      "content": "este es el contenido 2",
      "favorite": false,
    }
  },
  {
    "day": 3,
    "exist": true,
    "memory": {
      "content": "este es el contenido 3",
      "favorite": false,
    }
  },
  {
    "day": 4,
    "exist": false,
  },
  {
    "day": 5,
    "exist": false,
  },
  {
    "day": 6,
    "exist": true,
    "memory": {
      "content": "este es el contenido 2",
      "favorite": false,
    }
  },
  {
    "day": 7,
    "exist": true,
    "memory": {
      "content": "este es el contenido 3",
      "favorite": false,
    }
  },
  {
    "day": 8,
    "exist": false,
  },
];
