import 'package:flutter/material.dart';
import 'package:nu_test1/features/shorten_link/presentation/view/home.dart';
import 'injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NuBank App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('NuBank App'),
        ),
        body: const Center(
          child: HomeScreen(),
        ),
      ),
    );
  }
}