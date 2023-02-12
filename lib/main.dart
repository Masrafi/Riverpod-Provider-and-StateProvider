import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

final selectButtonProvider = StateProvider((ref) => '');
final isRedProvider = Provider(
  (ref) {
    final color = ref.watch(selectButtonProvider);
    return color == 'red';
  },
);

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedButton = ref.watch(selectButtonProvider);
    final isRed = ref.watch(isRedProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(selectedButton),

            ElevatedButton(
              onPressed: () =>
                  ref.read(selectButtonProvider.notifier).state = 'red',
              child: const Text('Red'),
            ),
            ElevatedButton(
              // 5
              onPressed: () =>
                  ref.read(selectButtonProvider.notifier).state = 'blue',
              child: const Text('Blue'),
            ),
            // 6
            isRed ? const Text('Color is red') : const Text('Color is not red')
          ],
        ),
      ),
    );
  }
}
