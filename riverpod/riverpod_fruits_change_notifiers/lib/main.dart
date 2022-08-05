import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app/presenter/home/home_page.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        title: 'Fruits State',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}

