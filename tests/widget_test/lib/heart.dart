import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  const Heart({Key? key}) : super(key: key);

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> {
  IconData icon = Icons.favorite_border;

  double size = 20;

  Color color = Colors.black;

  void changeIcon() {
    if (icon == Icons.favorite_border) {
      icon = Icons.favorite;
      size = 25;
      color = Colors.pink;
    } else {
      icon = Icons.favorite_border;
      size = 20;
      color = Colors.black;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          key: const Key('heartButton'),
          onTap: changeIcon,
          child: Icon(
            icon,
            key: const Key('heart'),
            size: size,
            color: color,
          ),
        ),
      ),
    );
  }
}
