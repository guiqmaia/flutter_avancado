import 'package:flame_splash_screen/flame_splash_screen.dart';
import 'package:flutter/material.dart';

import '../movies/movies_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlameSplashScreen(
        showBefore: (BuildContext context) {
          return const Text('');
        },
        showAfter: (BuildContext context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
                SizedBox(height: 10),
                Text('Loading'),
              ],
            ),
          );
        },
        theme: FlameSplashTheme.white,
        onFinish: (context) => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) => const MoviesPage()),
          ),
        ),
      ),
    );
  }
}
