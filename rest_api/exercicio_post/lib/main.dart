import 'package:exercicio_post/post_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const PostPage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
