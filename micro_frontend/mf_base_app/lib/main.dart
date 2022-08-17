import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:home/app/micro_app_home_resolver.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:login/app/micro_app_login_resolver.dart';
import 'package:login/app/pages/login_page.dart';
import 'package:products/app/micro_app_products_resolver.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget with BaseApp {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.registerRoutes();
    eventBus.on().listen(
      (event) {
        print(event);
      },
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      navigatorKey: navigatorKey,
      onGenerateRoute: super.generateRoutes,
      initialRoute: '/login',
      debugShowCheckedModeBanner: false,
    );
  }

  @override
  Map<String, WidgetBuilderArgs> get baseRoutes => {};

  @override
  List<MicroApp> get microApps {
    return [
      MicroAppLoginResolver(),
      MicroAppHomeResolver(),
      MicroAppProductsResolver(),
    ];
  }
}
