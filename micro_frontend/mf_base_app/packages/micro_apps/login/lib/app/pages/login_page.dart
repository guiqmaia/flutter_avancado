import 'package:core/core.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

EventBus eventBus = EventBus();

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        centerTitle: true,
      ),
      body: Center(
        child: ButtonDefaultWidget(
          title: 'Go To Home Page',
          onPressed: () {
            navigatorKey.currentState?.pushNamed('/home');
            eventBus.fire('Guilherme Quirino Maia');
          },
        ),
      ),
    );
  }
}
