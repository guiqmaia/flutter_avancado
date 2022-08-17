import 'package:flutter/material.dart';
import 'package:micro_app_home/micro_app_home.dart';
import 'package:micro_app_login/micro_app_login.dart';
import 'package:micro_core/micro_core.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget with BaseApp {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.registerRouters();

    return MaterialApp(
      title: 'Micro Frontends',
      theme: ThemeData(primarySwatch: Colors.pink),
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: super.generateRoute,
      initialRoute: '/login',
    );
  }

  @override
  Map<String, WidgetBuilderArgs> get baseRoutes => {};

  @override
  List<MicroApp> get microApps {
    return [
      MicroAppLoginResolver(),
      MicroAppHomeResolver(),
    ];
  }
}
