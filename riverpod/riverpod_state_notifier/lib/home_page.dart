import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_state_notifier/second_page.dart';

final nameUserProvider = Provider.autoDispose((ref) => 'Guilherme');
final counterProvider = StateProvider((ref) => 0);
final counterUpProvider =
    StateNotifierProvider<CounterNotifier, int>((ref) => CounterNotifier());

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userNameWatch = ref.watch(nameUserProvider);
    final counterUpProviderWatch = ref.watch(counterUpProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Notifier - Hooks Riverpod'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              userNameWatch,
              style: const TextStyle(
                fontSize: 40,
              ),
            ),
            Text(
              counterUpProviderWatch.toString(),
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SecondPage(),
                    ),
                  );
                },
                child: const Text('Ir'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterUpProvider.notifier).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);

  void increment() {
    state++;
  }
}
