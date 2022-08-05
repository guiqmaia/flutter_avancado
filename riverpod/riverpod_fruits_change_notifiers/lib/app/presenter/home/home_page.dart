import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'widgets/fruit_button.dart';

import 'home_controller.dart';

final favoriteProvider = ChangeNotifierProvider((ref) => FavoritesController());

class HomePage extends HookConsumerWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteFruit = ref.watch(favoriteProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Fruta Favorita é ${favoriteFruit.fruit}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            FruitButton('Maracujá'),
            FruitButton('Banana'),
            FruitButton('Uva'),
            FruitButton('Maçã'),
            FruitButton('Abacaxi'),
          ],
        ),
      ),
    );
  }
}
