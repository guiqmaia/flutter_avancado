import 'package:flutter/material.dart';

import 'pick_trendings_container.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PickTrendingsContainer(timeWindow: 'day'),
            const SizedBox(height: 60),
            PickTrendingsContainer(timeWindow: 'week'),
          ],
        ),
      ),
    );
  }
}
