import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hero_radial_animations/presenter/home/widgets/circle_hero_footer.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    timeDilation = 3;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Hero Radial'),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: Container(
        padding: const EdgeInsets.all(32),
        alignment: FractionalOffset.bottomLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleHeroFooter(
                imageName: 'images/images/chair-alpha.png',
                description: 'Chair'),
            CircleHeroFooter(
                imageName: 'images/images/binoculars-alpha.png',
                description: 'Binoculars'),
            CircleHeroFooter(
                imageName: 'images/images/beachball-alpha.png',
                description: 'BeachBall'),
          ],
        ),
      ),
    );
  }
}
