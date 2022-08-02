import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Implicit Animation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: magenta,
      ),
      home: const HomePage(),
    ),
  );
}

MaterialColor magenta = MaterialColor(
  const Color.fromRGBO(237, 45, 88, 1).value,
  const <int, Color>{
    50: Color.fromRGBO(237, 45, 88, 0.1),
    100: Color.fromRGBO(237, 45, 88, 0.2),
    200: Color.fromRGBO(237, 45, 88, 0.3),
    300: Color.fromRGBO(237, 45, 88, 0.4),
    400: Color.fromRGBO(237, 45, 88, 0.5),
    500: Color.fromRGBO(237, 45, 88, 0.6),
    600: Color.fromRGBO(237, 45, 88, 0.7),
    700: Color.fromRGBO(237, 45, 88, 0.8),
    800: Color.fromRGBO(237, 45, 88, 0.9),
    900: Color.fromRGBO(237, 45, 88, 1),
  },
);
