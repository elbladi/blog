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

List<dynamic> get daysData => List.generate(
    31,
    (i) => {
          "day": i + 1,
          "exist": false,
        });

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
