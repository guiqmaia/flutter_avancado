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
        height: kMaxRadius * 2,
        width: kMaxRadius * 2,
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
                child: Image.asset(
                  imageName,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
