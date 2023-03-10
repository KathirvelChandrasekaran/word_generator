import 'package:flutter/material.dart';
import 'package:word_generator/word_generator.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  helloFunction() {
    final wordGenerator = WordGenerator();
    print(wordGenerator.randomName());

    final password = PasswordGenerator();
    print(password.validatePassword('abcABC123!@#'));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: GestureDetector(
            onTap: () => helloFunction(),
            child: const Text('Hello World'),
          ),
        ),
      ),
    );
  }
}
