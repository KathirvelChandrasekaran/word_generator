# word_generator

[![pub package](https://img.shields.io/pub/v/random_words.svg)](https://pub.dartlang.org/packages/random_words)

Utilities for generating random `Engligh Words`. Generate random `nouns`,`verbs` and `names`.

## 🚀 Features

- randomNouns
- randomNoun
- randomSentence
- countSyllables
- randomVerbs
- randomVerb
- randomNames
- nandomName

## 🎮 Usage

Print 3 random nouns. Parameter is optional, if no param is provided then 2 noun will be generated.

```dart
import 'package:word_generator/word_generator.dart';

main() {
   final wordGenerator = WordGenerator();
   List<String> nouns = wordGenerator.randomNouns(3);
   print(nouns);
}
```

Print single random noun.

```dart
import 'package:word_generator/word_generator.dart';

main() {
   final wordGenerator = WordGenerator();
   String noun = wordGenerator.randomNoun();
   print(noun);
}
```

Print sentence with the random nouns. Parameter is optional, if no param is provided then 2 noun will be generated.

```dart
import 'package:word_generator/word_generator.dart';

main() {
   final wordGenerator = WordGenerator();
   List<String> noun = wordGenerator.randomSentence(3);
   print(noun);
}
```

Print count of the syllables in the word

```dart
import 'package:word_generator/word_generator.dart';

main() {
   final wordGenerator = WordGenerator();
   int count = wordGenerator.countSyllables('dart');
   print(count);
}
```

Print 3 random verbs. Parameter is optional, if no param is provided then 2 noun will be generated.

```dart
import 'package:word_generator/word_generator.dart';

main() {
   final wordGenerator = WordGenerator();
   List<String> verbs = wordGenerator.randomVerbs(3);
   print(verbs);
}
```

Print single random verb.

```dart
import 'package:word_generator/word_generator.dart';

main() {
   final wordGenerator = WordGenerator();
   String verb = wordGenerator.randomVerb();
   print(verb);
}
```

Print 3 random names. Parameter is optional, if no param is provided then 2 noun will be generated.

```dart
import 'package:word_generator/word_generator.dart';

main() {
   final wordGenerator = WordGenerator();
   List<String> names = wordGenerator.randomNames(3);
   print(names);
}
```

Print single random name.

```dart
import 'package:word_generator/word_generator.dart';

main() {
   final wordGenerator = WordGenerator();
   String name = wordGenerator.randomName();
   print(name);
}
```

## 😅 Issue

If you face any issues, please raise an [issue](https://github.com/KathirvelChandrasekaran/word_generator/issues).
