import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class StaggerAnimation extends StatelessWidget {
  StaggerAnimation({super.key, required this.animationMain})
      : animationOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: animationMain,
            curve: const Interval(0.0, 0.15, curve: Curves.ease),
          ),
        ),
        animationWidth = Tween<double>(begin: 50.0, end: 150.0).animate(
          CurvedAnimation(
            parent: animationMain,
            curve: const Interval(0.125, 0.275, curve: Curves.ease),
          ),
        ),
        animationHeight = Tween<double>(begin: 50.0, end: 150.0).animate(
          CurvedAnimation(
            parent: animationMain,
            curve: const Interval(0.250, 0.400, curve: Curves.ease),
          ),
        ),
        animationPadding = EdgeInsetsTween(
                begin: const EdgeInsets.only(bottom: 16.0),
                end: const EdgeInsets.only(bottom: 75.0))
            .animate(
          CurvedAnimation(
            parent: animationMain,
            curve: const Interval(0.375, 0.500, curve: Curves.ease),
          ),
        ),
        animationBorderRadius = BorderRadiusTween(
                begin: BorderRadius.circular(4.0),
                end: BorderRadius.circular(75.0))
            .animate(
          CurvedAnimation(
            parent: animationMain,
            curve: const Interval(0.475, 0.650, curve: Curves.ease),
          ),
        ),
        animationColor =
            ColorTween(begin: Colors.purple[300], end: Colors.purple[600])
                .animate(
          CurvedAnimation(
            parent: animationMain,
            curve: const Interval(0.625, 0.80, curve: Curves.ease),
          ),
        );

  final Animation<double> animationMain;
  final Animation<double> animationOpacity;
  final Animation<double> animationWidth;
  final Animation<double> animationHeight;
  final Animation<EdgeInsets> animationPadding;
  final Animation<BorderRadius?> animationBorderRadius;
  final Animation<Color?> animationColor;

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Container(
      padding: animationPadding.value,
      alignment: Alignment.bottomCenter,
      child: Opacity(
        opacity: animationOpacity.value,
        child: Container(
          width: animationWidth.value,
          height: animationHeight.value,
          decoration: BoxDecoration(
            color: animationColor.value,
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
            borderRadius: animationBorderRadius.value,
          ),
          child: const Center(
              child: Text(
            'Olá',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              letterSpacing: 3.0,
            ),
          )),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: animationMain,
    );
  }
}

class StaggerDemo extends StatefulWidget {
  const StaggerDemo({super.key});

  @override
  State<StaggerDemo> createState() => _StaggerDemoState();
}

typedef StateMixin = TickerProviderStateMixin<StaggerDemo>;

class _StaggerDemoState extends State<StaggerDemo> with StateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _playAnimation() async {
    try {
      while (true) {
        await _animationController.forward().orCancel;
        await _animationController.reverse().orCancel;
      }
    } on TickerCanceled {
      print('Ticker Cancelado');
    }
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Staggered Animation'),
        centerTitle: true,
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          _playAnimation();
        },
        child: Center(
          child: SizedBox(
            width: 300.0,
            height: 300.0,
            child: StaggerAnimation(
              animationMain: _animationController.view,
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: const StaggerDemo(),
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}
