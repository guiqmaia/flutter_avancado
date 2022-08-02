import 'package:flutter/material.dart';
import 'package:focus_node_1/register_page.dart';

import 'home_page.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      initialRoute: HomePage.route,
      routes: {
        HomePage.route: (context) => const HomePage(),
        RegisterPage.route: ((context) => const RegisterPage()),
      },
    ),
  );
}
