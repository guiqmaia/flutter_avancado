import 'package:flutter/material.dart';

import 'widgets/body_home.dart';
import 'widgets/home_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HomeAppBar(),
      body: BodyHome(),
    );
  }
}
