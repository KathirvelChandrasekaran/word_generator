# Word Generator

[![pub package][pub_badge]][pub_link]
[![License: MIT][license_badge]][license_link]

[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/kathirvel)

## 💡 Feature Requests

I welcome feature requests to improve the `word_generator` package! If you have an idea for a new feature, follow these steps to submit your request:

1. Visit the [Feature Requests Project](https://github.com/users/KathirvelChandrasekaran/projects/5/views/1).
2. Click on the **"New Item"** button in the top-right corner.
3. Provide a clear and concise title for your feature request.
4. Add a detailed description of your idea, including:
   - The problem it solves.
   - How it would benefit users.
   - Any additional context or examples.
5. Submit your request, and we’ll review it as part of our development roadmap.


A dart based util package for generating random `nouns`, `verbs`, `names`, `strong password` and `validate the given password` is strong or not. This package helps you to generate random words and passwords for your project without any hassle.

## 🚀 Features

### nouns

- randomNouns
- randomNoun
- randomSentence

### verbs

- randomVerbs
- randomVerb
- verbsStartingWith
- verbsEndingWith
- verbsContaining

### names

- randomNames
- nandomName
- nounsStartingWith
- nounsEndingWith
- nounsContaining

### common util

- countSyllables

### password

- generatePassword
- validatePassword

## 🎮 Usage

### generatePassword

Generate a random 8 digit password. If no length is provided then default length is taken as 8.

```dart
import 'package:word_generator/word_generator.dart';

main() {
   final passwordGenerator = PasswordGenerator();
   String password = passwordGenerator.generatePassword();
   print(password)
}
```

### validatePassword

Check the given string is strong password or not.

```dart
import 'package:word_generator/word_generator.dart';

main() {
   final passwordGenerator = PasswordGenerator();
   bool password = passwordGenerator.validatePassword('abcABC123!@#');
   print(password)
}
```

### randomNouns

Print 3 random nouns. Parameter is optional, if no param is provided then 2 noun will be generated.

```dart
import 'package:word_generator/word_generator.dart';

main() {
   final wordGenerator = WordGenerator();
   List<String> nouns = wordGenerator.randomNouns(3);
   print(nouns);
}
```

### randomNoun

Print single random noun.

```dart
import 'package:word_generator/word_generator.dart';

main() {
   final wordGenerator = WordGenerator();
   String noun = wordGenerator.randomNoun();
   print(noun);
}
```

### randomSentence

Print sentence with the random nouns. Parameter is optional, if no param is provided then 2 noun will be generated.

```dart
import 'package:word_generator/word_generator.dart';

main() {
   final wordGenerator = WordGenerator();
   List<String> noun = wordGenerator.randomSentence(3);
   print(noun);
}
```

### countSyllables

Print count of the syllables in the word

```dart
import 'package:word_generator/word_generator.dart';

main() {
   final wordGenerator = WordGenerator();
   int count = wordGenerator.countSyllables('dart');
   print(count);
}
```

### randomVerbs

Print 3 random verbs. Parameter is optional, if no param is provided then 2 noun will be generated.

```dart
import 'package:word_generator/word_generator.dart';

main() {
   final wordGenerator = WordGenerator();
   List<String> verbs = wordGenerator.randomVerbs(3);
   print(verbs);
}
```

### randomVerb

Print single random verb.

```dart
import 'package:word_generator/word_generator.dart';

main() {
   final wordGenerator = WordGenerator();
   String verb = wordGenerator.randomVerb();
   print(verb);
}
```

### randomNames

Print 3 random names. Parameter is optional, if no param is provided then 2 noun will be generated.

```dart
import 'package:word_generator/word_generator.dart';

main() {
   final wordGenerator = WordGenerator();
   List<String> names = wordGenerator.randomNames(3);
   print(names);
}
```

### randomName

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

[license_link]: https://opensource.org/licenses/MIT
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[pub_badge]: https://img.shields.io/pub/v/word_generator.svg
[pub_link]: https://pub.dev/packages/word_generator

Thank you for contributing to the growth of `word_generator`!