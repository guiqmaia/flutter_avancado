import 'package:flutter/material.dart';
import 'package:hero_radial_animations/presenter/home/widgets/hero_destiny_page.dart';

import '../utils/constants_animation.dart';
import 'radial_expansion.dart';

class CircleHeroFooter extends StatelessWidget {
  // BuildContext context,
  String imageName;
  String description;
  CircleHeroFooter({
    Key? key,
    required this.imageName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kMinRadius * 2.5,
      width: kMinRadius * 2.5,
      child: Hero(
        createRectTween: createRectTween,
        tag: imageName,
        child: RadialExpansion(
          maxRadius: kMaxRadius,
          child: Material(
            color: Colors.pink.shade500,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return AnimatedBuilder(
                        animation: animation,
                        builder: (context, child) {
                          return Opacity(
                            opacity: opacityCurve.transform(animation.value),
                            child: HeroDestinyPage(
                              imageName: imageName,
                              description: description,
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              },
              child: Image.asset(
                imageName,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
