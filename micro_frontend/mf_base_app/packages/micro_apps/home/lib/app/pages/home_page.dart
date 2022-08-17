import 'package:core/app/micro_core_utils.dart';
import 'package:design_system/widgets/button_default_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Hello, this is Home Page',
              textAlign: TextAlign.center,
            ),
            ButtonDefaultWidget(
              title: 'Go to products',
              onPressed: () {
                navigatorKey.currentState?.pushNamed('/products');
              },
            )
          ],
        ),
      ),
    );
  }
}
