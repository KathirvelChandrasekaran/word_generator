<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

# word_generator

[![pub package](https://img.shields.io/pub/v/random_words.svg)](https://pub.dartlang.org/packages/random_words)

Utilities for generating random `Engligh Words`. As of now only English `nouns` are supported. In upcoming version, adjectives and verbs will be added.

## Features

- randomNouns
- randomNoun
- randomSentence
- countSyllables

## Usage

Print 3 random nouns. Parameter is optional, if no param is provided then 2 noun will be generated.

```dart
import 'package:word_generator/word_generator.dart';

main() {
   List<String> nouns = WordGenerator().randomNouns(3);
   print(nouns);
}
```

Print single random noun.

```dart
import 'package:word_generator/word_generator.dart';

main() {
   String noun = WordGenerator().randomNoun();
   print(noun);
}
```

Print sentence with the random nouns. Parameter is optional, if no param is provided then 2 noun will be generated.

```dart
import 'package:word_generator/word_generator.dart';

main() {
   List<String> noun = WordGenerator().randomSentence(3);
   print(noun);
}
```

Print count of the syllables in the word

```dart
import 'package:word_generator/word_generator.dart';

main() {
   int count = WordGenerator().countSyllables('dart');
   print(count);
}
```
