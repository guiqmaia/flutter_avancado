import 'package:flutter/material.dart';

class ViewImagePage extends StatelessWidget {
  const ViewImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(5),
          ),
          height: MediaQuery.of(context).size.height * 0.2,
          child: Hero(
            tag: 'img',
            child: Image.network(
              'https://images.fineartamerica.com/images/artworkimages/mediumlarge/1/vertical-eiffel-tower-vicki-jauron.jpg',
            ),
          ),
        ),
      ),
    );
  }
}
