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

Utilities for generating random `Engligh Words`. Generate random `nouns`and `verbs`

## 🚀 Features

- randomNouns
- randomNoun
- randomSentence
- countSyllables
- randomVerbs
- randomVerb

## 🎮 Usage

Print 3 random nouns. Parameter is optional, if no param is provided then 2 noun will be generated.

```dart
import 'package:word_generator/word_generator.dart';

main() {
   WordGenerator wordGenerator = WordGenerator();
   List<String> nouns = wordGenerator.randomNouns(3);
   print(nouns);
}
```

Print single random noun.

```dart
import 'package:word_generator/word_generator.dart';

main() {
   WordGenerator wordGenerator = WordGenerator();
   String noun = wordGenerator.randomNoun();
   print(noun);
}
```

Print sentence with the random nouns. Parameter is optional, if no param is provided then 2 noun will be generated.

```dart
import 'package:word_generator/word_generator.dart';

main() {
   WordGenerator wordGenerator = WordGenerator();
   List<String> noun = wordGenerator.randomSentence(3);
   print(noun);
}
```

Print count of the syllables in the word

```dart
import 'package:word_generator/word_generator.dart';

main() {
   WordGenerator wordGenerator = WordGenerator();
   int count = wordGenerator.countSyllables('dart');
   print(count);
}
```

Print 3 random verbs. Parameter is optional, if no param is provided then 2 noun will be generated.

```dart
import 'package:word_generator/word_generator.dart';

main() {
   WordGenerator wordGenerator = WordGenerator();
   List<String> verbs = wordGenerator.randomVerbs(3);
   print(verbs);
}
```

Print single random verb.

```dart
import 'package:word_generator/word_generator.dart';

main() {
   WordGenerator wordGenerator = WordGenerator();
   String verb = wordGenerator.randomVerb();
   print(verb);
}
```

## 😅 Issue

If you face any issues, please raise an [issue](https://github.com/KathirvelChandrasekaran/word_generator/issues).
