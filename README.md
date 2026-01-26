# Word Generator

[![pub package][pub_badge]][pub_link]
[![License: MIT][license_badge]][license_link]
[![Build Status](https://github.com/KathirvelChandrasekaran/word_generator/workflows/build/badge.svg)](https://github.com/KathirvelChandrasekaran/word_generator/actions)

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

## 📖 Overview

A comprehensive Dart package for generating random words, names, usernames, passwords, and more. Perfect for testing, prototyping, password generation, and content creation.

## ✨ Features

### 🔤 Word Generation

- **Nouns**: Random nouns, sentences, filtering (start/end/contains)
- **Verbs**: Random verbs with flexible filtering options
- **Names**: Full names, first names, last names
- **Unique Words**: Generate non-repeating word lists
- **Length Filtering**: Filter words by exact or minimum length

### 👤 Name & Identity

- **Usernames**: Generate creative usernames with multiple styles
- **Emails**: Create fake email addresses for testing
- **First/Last Names**: Separate first and last name generation

### 🔐 Password Generation

- **Basic Passwords**: Secure random passwords with customizable length
- **Custom Passwords**: Choose character sets (uppercase, lowercase, numbers, special)
- **Passphrases**: Memorable multi-word passphrases (e.g., "correct-horse-battery-staple")
- **Pronounceable Passwords**: Easy-to-remember passwords
- **PIN Codes**: Numeric PIN generation

### 🔒 Password Security

- **Validation**: Check password strength against criteria
- **Strength Scoring**: Get 0-100 score with descriptive labels
- **Entropy Calculation**: Calculate password entropy in bits

### 🛠️ Utility Features

- **Case Formatting**: camelCase, snake_case, PascalCase, kebab-case
- **Slugs**: URL-friendly slug generation
- **Lorem Ipsum**: Placeholder text generation
- **Syllable Counting**: Count syllables in words
- **Title Case**: Convert text to Title Case
- **Statistics**: Get word list statistics
- **Seeded Random**: Deterministic generation for testing

## 📦 Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  word_generator: ^0.6.0
```

Then run:

```bash
flutter pub get
```

## 🎯 Quick Start

```dart
import 'package:word_generator/word_generator.dart';

void main() {
  final wordGen = WordGenerator();
  final passGen = PasswordGenerator();

  // Generate random words
  print(wordGen.randomNoun());           // "mountain"
  print(wordGen.randomVerb());           // "create"
  print(wordGen.randomName());           // "Alex Smith"

  // Generate passwords
  print(passGen.generatePassword(12));   // "aB3!xK9@mN2#"
  print(passGen.generatePassphrase());   // "correct-horse-battery-staple"

  // Generate usernames
  print(wordGen.generateUsername(includeNumber: true)); // "quickfox42"

  // Check password strength
  print(passGen.passwordStrengthScore("MyP@ssw0rd")); // 85
}
```

## 📚 API Documentation

### WordGenerator

```dart
final wordGen = WordGenerator();
// With seed for reproducible results
final seededGen = WordGenerator(seed: 42);
```

#### Basic Word Generation

```dart
// Nouns
wordGen.randomNoun();                    // Single noun
wordGen.randomNouns(5);                  // 5 random nouns
wordGen.uniqueRandomNouns(10);           // 10 unique nouns
wordGen.randomSentence(4);               // Sentence with 4 words

// Verbs
wordGen.randomVerb();                    // Single verb
wordGen.randomVerbs(3);                  // 3 random verbs
wordGen.uniqueRandomVerbs(5);            // 5 unique verbs

// Names
wordGen.randomName();                    // Full name
wordGen.randomNames(3);                  // 3 random names
wordGen.randomFirstName();               // First name only
wordGen.randomLastName();                // Last name only
```

#### Filtering Words

```dart
// Filter by starting letter
wordGen.nounsStartingWith('a');
wordGen.verbsStartingWith('b');

// Filter by ending
wordGen.nounsEndingWith('ing');
wordGen.verbsEndingWith('ed');

// Filter by containing text
wordGen.nounsContaining('cat');
wordGen.verbsContaining('run');

// Filter by length
wordGen.nounsByLength(5);                // Exactly 5 characters
wordGen.nounsWithMinLength(10);          // At least 10 characters
wordGen.verbsByLength(4);
wordGen.verbsWithMinLength(6);
```

#### Username & Email Generation

```dart
// Usernames
wordGen.generateUsername();              // "quickfox"
wordGen.generateUsername(
  style: 'firstname-lastname',
  separator: '_',
  includeNumber: true,
  capitalize: true,
);                                        // "Alex_Smith_42"

// Emails
wordGen.generateEmail();                 // "quickfox77@example.com"
wordGen.generateEmail(
  username: 'john.doe',
  domain: 'company.com',
);                                        // "john.doe@company.com"
```

#### Case Formatting

```dart
wordGen.generateCamelCase();             // "quickBrownFox"
wordGen.generateSnakeCase();             // "quick_brown_fox"
wordGen.generatePascalCase();            // "QuickBrownFox"
wordGen.generateKebabCase();             // "quick-brown-fox"
wordGen.generateSlug(wordCount: 3);      // "blue-ocean-adventure"
wordGen.toTitleCase('hello world');      // "Hello World"
```

#### Utility Functions

```dart
// Lorem Ipsum
wordGen.generateLoremIpsum(paragraphs: 2);

// Syllable counting
wordGen.countSyllables('beautiful');     // 3

// Statistics
wordGen.getWordStatistics();
// Returns: { nouns: { count: 6798, averageLength: "6.23" }, ... }
```

### PasswordGenerator

```dart
final passGen = PasswordGenerator();
```

#### Basic Passwords

```dart
passGen.generatePassword();              // 8-character password
passGen.generatePassword(16);            // 16-character password
passGen.generatePassword(12, ['@', '#']); // Exclude @ and #
```

#### Custom Passwords

```dart
passGen.generateCustomPassword(
  length: 12,
  includeLowercase: true,
  includeUppercase: true,
  includeNumbers: true,
  includeSpecial: false,
);                                        // "aBc123XyZ456"
```

#### Passphrases

```dart
passGen.generatePassphrase();            // "correct-horse-battery-staple"
passGen.generatePassphrase(
  wordCount: 5,
  separator: '_',
  capitalize: true,
  includeNumber: true,
);                                        // "Dragon_Castle_River_Phoenix_847"
```

#### Special Password Types

```dart
passGen.generatePronounceable();         // "Kobami42"
passGen.generatePronounceable(
  length: 8,
  includeNumbers: false,
);                                        // "Sofiraku"

passGen.generatePin();                   // "4829"
passGen.generatePin(6);                  // "482917"
```

#### Password Validation & Strength

```dart
// Boolean validation
passGen.validatePassword('password');                // false
passGen.validatePassword('MyStr0ng!P@ss');          // true

// Strength scoring (0-100)
passGen.passwordStrengthScore('password');           // 20
passGen.passwordStrengthScore('MyStr0ng!P@ssw0rd'); // 95

// Descriptive labels
passGen.passwordStrengthLabel('password');           // "Weak"
passGen.passwordStrengthLabel('MyStr0ng!P@ssw0rd'); // "Very Strong"

// Entropy calculation
passGen.calculateEntropy('MyStr0ng!P@ss');           // 72.4 bits
passGen.entropyLabel('MyStr0ng!P@ss');               // "Strong (crackable in years)"
```

## 🎨 Example App

Check out the [example app](example/) for an interactive demo with all features organized in a clean UI.

## 🧪 Testing

Run tests:

```bash
flutter test
```

Run tests with coverage:

```bash
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## � License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 😅 Issues

If you encounter any issues, please file an [issue](https://github.com/KathirvelChandrasekaran/word_generator/issues).

[license_link]: https://opensource.org/licenses/MIT
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[pub_badge]: https://img.shields.io/pub/v/word_generator.svg
[pub_link]: https://pub.dev/packages/word_generator

---

Thank you for using `word_generator`! ⭐ Star the repo if you find it helpful!
