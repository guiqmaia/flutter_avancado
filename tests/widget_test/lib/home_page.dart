import 'package:flutter/material.dart';

import 'heart.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body:  const Center(
        child: Heart(),
      ),
    );
  }
}
