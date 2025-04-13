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

    final wordGenerator1 = WordGenerator();
    print(wordGenerator1.verbsStartingWith('arr'));

    final wordGenerator2 = WordGenerator();
    print(wordGenerator2.verbsEndingWith('ing'));

    final wordGenerator3 = WordGenerator();
    print(wordGenerator3.verbsContaining('sp'));

    final wordGenerator4 = WordGenerator();
    print(wordGenerator4.nounsStartingWith('arr'));

    final wordGenerator5 = WordGenerator();
    print(wordGenerator5.nounsEndingWith('ing'));

    final wordGenerator6 = WordGenerator();
    print(wordGenerator6.nounsContaining('sp'));

    final password = PasswordGenerator();
    print(password.validatePassword('abcABC123!@#'));

    final generatePassword = PasswordGenerator();
    final generatePassword1 = PasswordGenerator();
    try {
      print(generatePassword.generatePassword(6));
      print(generatePassword1.generatePassword(8, ['@']));
    } catch (err) {
      print(err);
    }
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
