import 'dart:math';

import 'package:flutter/material.dart';
import 'package:implicit_animation/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isClicked = false;

  void changeClicked() {
    isClicked = !isClicked;
    randomWidth = Random().nextDouble() * 300;
    randomHeight = Random().nextDouble() * 300;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animações'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 500,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    width: isClicked ? 120.0 : 50.0,
                    height: isClicked ? 50.0 : 120.0,
                    top: isClicked ? 50.0 : 120.0,
                    onEnd: () {
                      changeClicked();
                    },
                    duration: const Duration(seconds: 1),
                    curve: Curves.bounceIn,
                    child: Container(
                      width: isClicked ? randomWidth : randomWidth,
                      height: isClicked ? randomHeight : randomHeight,
                      decoration: BoxDecoration(
                        color: isClicked ? magenta : Colors.purple,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    onEnd: () {
                      changeClicked();
                    },
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.bounceIn,
                    width: isClicked ? randomWidth : randomWidth,
                    height: isClicked ? randomHeight : randomHeight,
                    decoration: BoxDecoration(
                      color: isClicked ? Colors.blue : Colors.green,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                changeClicked();
              },
              child: const Text('Aumentar/Diminuir'),
            ),
          ],
        ),
      ),
    );
  }
}

double randomWidth = Random().nextDouble() * 250;
double randomHeight = Random().nextDouble() * 250;
double topPos = Random().nextDouble() * 10;
double leftPos = Random().nextDouble() * 10;
double rightPos = Random().nextDouble() * 10;
double botPos = Random().nextDouble() * 10;
