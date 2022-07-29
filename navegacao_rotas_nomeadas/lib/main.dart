import 'package:flutter/material.dart';
import 'core/app_routes.dart';
import 'page_two.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.route,
      routes: appRoutes,
      onUnknownRoute: onUnknownRoute,
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const route = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
        centerTitle: true,
      ),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.6,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/dsfaffasfasdsaasds',
              );
            },
            child: const Text('Página 2'),
          ),
        ),
      ),
    );
  }
}
