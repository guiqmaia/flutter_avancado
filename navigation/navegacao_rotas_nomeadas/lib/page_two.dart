import 'package:flutter/material.dart';
import 'page_three.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({
    Key? key,
  }) : super(key: key);

  static const route = '/page-two';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alo'),
        centerTitle: true,
      ),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.6,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                PageThree.route,
              );
            },
            child: const Text('Página 3'),
          ),
        ),
      ),
    );
  }
}
