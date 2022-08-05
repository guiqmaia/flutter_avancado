import 'package:flutter/material.dart';
import 'package:navegacao_rotas_nomeadas/page_not_found.dart';

import '../main.dart';
import '../page_three.dart';
import '../page_two.dart';

var appRoutes = {
  HomePage.route: (context) => const HomePage(),
  PageTwo.route: (context) => const PageTwo(),
  PageThree.route: (context) => const PageThree(),
};

var onUnknownRoute = (context) {
  return MaterialPageRoute(
    builder: (context) {
      return const PageNotFound();
    },
  );
};
