import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './user.dart';

final ageProvider = StateProvider<int>((ref) => 12);

final userProvider = StateNotifierProvider<UserNotifier, User>(
  (ref) => UserNotifier(
    const User(name: '', age: 0),
  ),
);

void main() => runApp(
      const ProviderScope(
        child: MyApp(),
      ),
    );

void onPressed(WidgetRef ref) {
  // ref.read(ageProvider.notifier).state++;
  ref.read(ageProvider.notifier).update((state) => state + 1);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final age = ref.watch(ageProvider);
    final name = ref.watch(userProvider).name;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              age.toString(),
              style:
                  const TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
            ),
            IconButton(
              onPressed: () => onPressed(ref),
              icon: const Icon(Icons.add, size: 50),
            ),
            TextField(
              controller: TextEditingController(),
              onSubmitted: (value) {
                ref.read(userProvider.notifier).updateName(value);
              },
            ),
            Text(
              name,
              style: const TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
