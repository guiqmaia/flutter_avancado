import 'package:flutter/material.dart';

import '../utils/constants_animation.dart';
import 'radial_expansion.dart';

class HeroDestinyPage extends StatelessWidget {
  const HeroDestinyPage({
    Key? key,
    // required this.context,
    required this.imageName,
    required this.description,
  }) : super(key: key);

  // final BuildContext context;
  final String imageName;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).canvasColor,
      alignment: FractionalOffset.center,
      child: SizedBox(
        height: kMaxRadius * 2.1,
        width: kMaxRadius * 2.1,
        child: Hero(
          tag: imageName,
          createRectTween: createRectTween,
          child: RadialExpansion(
            maxRadius: kMaxRadius,
            child: Material(
              color: Colors.pink.shade500,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Stack(
                  children: [
                    Image.asset(
                      imageName,
                      fit: BoxFit.contain,
                    ),
                    Positioned(
                      width: 175,
                      bottom: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            description,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
