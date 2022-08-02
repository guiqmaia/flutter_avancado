import 'package:flutter/material.dart';
import 'package:hero_animation/view_image_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HeroAnimation'),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: ((context) => const ViewImagePage()),
              ),
            );
          },
          child: Hero(
            tag: 'img',
            child: Image.network(
              'https://images.fineartamerica.com/images/artworkimages/mediumlarge/1/vertical-eiffel-tower-vicki-jauron.jpg',
              height: 200,
            ),
          ),
        ),
      ),
    );
  }
}
