import 'package:flutter_test/flutter_test.dart';
import 'package:word_generator/data/names.dart' as names_data;
import 'package:word_generator/data/nouns.dart' as nouns_data;
import 'package:word_generator/data/verbs.dart' as verbs_data;
import 'package:word_generator/word_generator.dart';

void main() {
  group('Word Generator - Basic Functions', () {
    test('randomNoun returns a valid noun', () {
      final wordGenerator = WordGenerator();
      final noun = wordGenerator.randomNoun();
      expect(noun, isNotNull);
      expect(noun, isNotEmpty);
      expect(nouns_data.nouns.contains(noun), isTrue);
    });

    test('randomNouns returns correct count', () {
      final wordGenerator = WordGenerator();
      expect(wordGenerator.randomNouns(5).length, 5);
    });

    test('randomNouns throws error for count less than 2', () {
      final wordGenerator = WordGenerator();
      expect(() => wordGenerator.randomNouns(1), throwsException);
    });

    test('randomSentence returns valid sentence', () {
      final wordGenerator = WordGenerator();
      final sentence = wordGenerator.randomSentence();
      expect(sentence, isNotNull);
      expect(sentence, isNotEmpty);
    });

    test('randomVerb returns a valid verb', () {
      final wordGenerator = WordGenerator();
      final verb = wordGenerator.randomVerb();
      expect(verb, isNotNull);
      expect(verbs_data.verbs.contains(verb), isTrue);
    });

    test('randomVerbs returns correct count', () {
      final wordGenerator = WordGenerator();
      expect(wordGenerator.randomVerbs(5).length, 5);
    });

    test('randomVerbsNotAppended', () {
      final wordGenerator = WordGenerator();
      final verbs = wordGenerator.randomVerbs(5);
      expect(verbs.every((verb) => verbs_data.verbs.contains(verb)), isTrue);
    });

    test('randomName returns a valid name', () {
      final wordGenerator = WordGenerator();
      final name = wordGenerator.randomName();
      expect(name, isNotNull);
      expect(names_data.names.contains(name), isTrue);
    });

    test('randomNames returns correct count', () {
      final wordGenerator = WordGenerator();
      expect(wordGenerator.randomNames(5).length, 5);
    });

    test('randomNamesNotAppended', () {
      final wordGenerator = WordGenerator();
      final names = wordGenerator.randomNames(5);
      expect(names.every((name) => names_data.names.contains(name)), isTrue);
    });
  });

  group('Word Generator - Filtering', () {
    test('verbsStartingWith filters correctly', () {
      final wordGenerator = WordGenerator();
      final verbs = wordGenerator.verbsStartingWith('a');
      expect(verbs.isNotEmpty, isTrue);
      expect(verbs.every((verb) => verb.startsWith('a')), isTrue);
    });

    test('verbsEndingWith filters correctly', () {
      final wordGenerator = WordGenerator();
      final verbs = wordGenerator.verbsEndingWith('e');
      expect(verbs.isNotEmpty, isTrue);
      expect(verbs.every((verb) => verb.endsWith('e')), isTrue);
    });

    test('verbsContaining filters correctly', () {
      final wordGenerator = WordGenerator();
      final verbs = wordGenerator.verbsContaining('x');
      expect(verbs.every((verb) => verb.contains('x')), isTrue);
    });

    test('nounsStartingWith filters correctly', () {
      final wordGenerator = WordGenerator();
      final nouns = wordGenerator.nounsStartingWith('b');
      expect(nouns.isNotEmpty, isTrue);
      expect(nouns.every((noun) => noun.startsWith('b')), isTrue);
    });

    test('nounsEndingWith filters correctly', () {
      final wordGenerator = WordGenerator();
      final nouns = wordGenerator.nounsEndingWith('ing');
      expect(nouns.isNotEmpty, isTrue);
      expect(nouns.every((noun) => noun.endsWith('ing')), isTrue);
    });

    test('nounsContaining filters correctly', () {
      final wordGenerator = WordGenerator();
      final nouns = wordGenerator.nounsContaining('cat');
      expect(nouns.every((noun) => noun.contains('cat')), isTrue);
    });
  });

  group('Word Generator - Name Enhancements', () {
    test('randomFirstName returns a valid first name', () {
      final wordGenerator = WordGenerator();
      final firstName = wordGenerator.randomFirstName();
      expect(firstName, isNotNull);
      expect(firstName, isNotEmpty);
    });

    test('randomLastName returns a valid last name', () {
      final wordGenerator = WordGenerator();
      final lastName = wordGenerator.randomLastName();
      expect(lastName, isNotNull);
      expect(lastName, isNotEmpty);
    });

    test('generateUsername returns valid username', () {
      final wordGenerator = WordGenerator();
      final username = wordGenerator.generateUsername();
      expect(username, isNotNull);
      expect(username, isNotEmpty);
    });

    test('generateUsername with number includes number', () {
      final wordGenerator = WordGenerator();
      final username = wordGenerator.generateUsername(includeNumber: true);
      expect(RegExp(r'\d').hasMatch(username), isTrue);
    });

    test('generateUsername with separator uses separator', () {
      final wordGenerator = WordGenerator();
      final username = wordGenerator.generateUsername(separator: '_');
      expect(username.contains('_'), isTrue);
    });

    test('generateEmail returns valid email', () {
      final wordGenerator = WordGenerator();
      final email = wordGenerator.generateEmail();
      expect(email, isNotNull);
      expect(email.contains('@'), isTrue);
      expect(RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(email), isTrue);
    });

    test('generateEmail with custom domain', () {
      final wordGenerator = WordGenerator();
      final email = wordGenerator.generateEmail(domain: 'test.com');
      expect(email.endsWith('@test.com'), isTrue);
    });
  });

  group('Word Generator - Utility Features', () {
    test('countSyllables returns correct count', () {
      final wordGenerator = WordGenerator();
      expect(wordGenerator.countSyllables('hello'), 2);
      expect(wordGenerator.countSyllables('beautiful'), 3);
      expect(wordGenerator.countSyllables('word'), 1);
    });

    test('generateSlug returns valid slug', () {
      final wordGenerator = WordGenerator();
      final slug = wordGenerator.generateSlug();
      expect(slug, isNotNull);
      expect(slug.contains('-'), isTrue);
    });

    test('generateCamelCase returns camelCase', () {
      final wordGenerator = WordGenerator();
      final camelCase = wordGenerator.generateCamelCase();
      expect(camelCase, isNotNull);
      expect(camelCase[0], equals(camelCase[0].toLowerCase()));
    });

    test('generateSnakeCase returns snake_case', () {
      final wordGenerator = WordGenerator();
      final snakeCase = wordGenerator.generateSnakeCase();
      expect(snakeCase, isNotNull);
      expect(snakeCase.contains('_'), isTrue);
    });

    test('generatePascalCase returns PascalCase', () {
      final wordGenerator = WordGenerator();
      final pascalCase = wordGenerator.generatePascalCase();
      expect(pascalCase, isNotNull);
      expect(pascalCase[0], equals(pascalCase[0].toUpperCase()));
    });

    test('generateKebabCase returns kebab-case', () {
      final wordGenerator = WordGenerator();
      final kebabCase = wordGenerator.generateKebabCase();
      expect(kebabCase, isNotNull);
      expect(kebabCase.contains('-'), isTrue);
    });

    test('generateLoremIpsum returns text', () {
      final wordGenerator = WordGenerator();
      final lorem = wordGenerator.generateLoremIpsum();
      expect(lorem, isNotNull);
      expect(lorem, isNotEmpty);
    });

    test('generateLoremIpsum with multiple paragraphs', () {
      final wordGenerator = WordGenerator();
      final lorem = wordGenerator.generateLoremIpsum(paragraphs: 3);
      expect(lorem.split('\n\n').length, 3);
    });

    test('toTitleCase converts correctly', () {
      final wordGenerator = WordGenerator();
      expect(wordGenerator.toTitleCase('hello world'), 'Hello World');
      expect(wordGenerator.toTitleCase('the quick brown fox'),
          'The Quick Brown Fox');
    });

    test('getWordStatistics returns valid stats', () {
      final wordGenerator = WordGenerator();
      final stats = wordGenerator.getWordStatistics();
      expect(stats['nouns'], isNotNull);
      expect(stats['verbs'], isNotNull);
      expect(stats['names'], isNotNull);
      expect(stats['nouns']['count'], greaterThan(0));
      expect(stats['verbs']['count'], greaterThan(0));
      expect(stats['names']['count'], greaterThan(0));
    });
  });

  group('Word Generator - Unique & Filtered', () {
    test('uniqueRandomNouns returns unique nouns', () {
      final wordGenerator = WordGenerator();
      final nouns = wordGenerator.uniqueRandomNouns(10);
      expect(nouns.length, 10);
      expect(nouns.toSet().length, 10); // All unique
    });

    test('uniqueRandomVerbs returns unique verbs', () {
      final wordGenerator = WordGenerator();
      final verbs = wordGenerator.uniqueRandomVerbs(10);
      expect(verbs.length, 10);
      expect(verbs.toSet().length, 10); // All unique
    });

    test('uniqueRandomNames returns unique names', () {
      final wordGenerator = WordGenerator();
      final names = wordGenerator.uniqueRandomNames(10);
      expect(names.length, 10);
      expect(names.toSet().length, 10); // All unique
    });

    test('nounsByLength filters by length', () {
      final wordGenerator = WordGenerator();
      final nouns = wordGenerator.nounsByLength(5);
      expect(nouns.every((noun) => noun.length == 5), isTrue);
    });

    test('nounsWithMinLength filters by minimum length', () {
      final wordGenerator = WordGenerator();
      final nouns = wordGenerator.nounsWithMinLength(10);
      expect(nouns.every((noun) => noun.length >= 10), isTrue);
    });

    test('verbsByLength filters by length', () {
      final wordGenerator = WordGenerator();
      final verbs = wordGenerator.verbsByLength(4);
      expect(verbs.every((verb) => verb.length == 4), isTrue);
    });

    test('verbsWithMinLength filters by minimum length', () {
      final wordGenerator = WordGenerator();
      final verbs = wordGenerator.verbsWithMinLength(6);
      expect(verbs.every((verb) => verb.length >= 6), isTrue);
    });
  });

  group('Word Generator - Seeded Random', () {
    test('seeded generator produces consistent results', () {
      final gen1 = WordGenerator(seed: 42);
      final gen2 = WordGenerator(seed: 42);

      expect(gen1.randomNoun(), equals(gen2.randomNoun()));
      expect(gen1.randomVerb(), equals(gen2.randomVerb()));
    });

    test('different seeds produce different results', () {
      final gen1 = WordGenerator(seed: 42);
      final gen2 = WordGenerator(seed: 43);

      // They might occasionally match, but very unlikely
      final nouns1 = gen1.randomNouns(10);
      final nouns2 = gen2.randomNouns(10);
      expect(nouns1, isNot(equals(nouns2)));
    });
  });

  group('Password Generator - Basic', () {
    test('generatePassword returns password of correct length', () {
      final passwordGenerator = PasswordGenerator();
      final password = passwordGenerator.generatePassword(12);
      expect(password.length, 12);
    });

    test('generatePassword throws error for short length', () {
      final passwordGenerator = PasswordGenerator();
      expect(() => passwordGenerator.generatePassword(7), throwsException);
    });

    test('generatePassword excludes specified characters', () {
      final passwordGenerator = PasswordGenerator();
      final password = passwordGenerator.generatePassword(12, ['@', '#']);
      expect(password.contains('@'), isFalse);
      expect(password.contains('#'), isFalse);
    });

    test('generateCustomPassword returns correct length', () {
      final passwordGenerator = PasswordGenerator();
      final password = passwordGenerator.generateCustomPassword(length: 16);
      expect(password.length, 16);
    });

    test('generateCustomPassword respects character set options', () {
      final passwordGenerator = PasswordGenerator();
      final password = passwordGenerator.generateCustomPassword(
        length: 20,
        includeSpecial: false,
      );
      expect(RegExp(r'[!@#%^&*()]').hasMatch(password), isFalse);
    });
  });

  group('Password Generator - Passphrase', () {
    test('generatePassphrase returns valid passphrase', () {
      final passwordGenerator = PasswordGenerator();
      final passphrase = passwordGenerator.generatePassphrase();
      expect(passphrase, isNotNull);
      expect(passphrase.contains('-'), isTrue);
    });

    test('generatePassphrase with custom separator', () {
      final passwordGenerator = PasswordGenerator();
      final passphrase = passwordGenerator.generatePassphrase(separator: '_');
      expect(passphrase.contains('_'), isTrue);
    });

    test('generatePassphrase with number includes number', () {
      final passwordGenerator = PasswordGenerator();
      final passphrase =
          passwordGenerator.generatePassphrase(includeNumber: true);
      expect(RegExp(r'\d').hasMatch(passphrase), isTrue);
    });

    test('generatePassphrase throws error for low word count', () {
      final passwordGenerator = PasswordGenerator();
      expect(() => passwordGenerator.generatePassphrase(wordCount: 2),
          throwsException);
    });
  });

  group('Password Generator - Special Types', () {
    test('generatePronounceable returns valid password', () {
      final passwordGenerator = PasswordGenerator();
      final password = passwordGenerator.generatePronounceable();
      expect(password, isNotNull);
      expect(password.length, 10);
    });

    test('generatePronounceable without numbers excludes digits', () {
      final passwordGenerator = PasswordGenerator();
      final password = passwordGenerator.generatePronounceable(
        length: 8,
        includeNumbers: false,
      );
      expect(RegExp(r'\d').hasMatch(password), isFalse);
    });

    test('generatePin returns correct length', () {
      final passwordGenerator = PasswordGenerator();
      final pin = passwordGenerator.generatePin(6);
      expect(pin.length, 6);
      expect(RegExp(r'^\d+$').hasMatch(pin), isTrue);
    });

    test('generatePin throws error for short length', () {
      final passwordGenerator = PasswordGenerator();
      expect(() => passwordGenerator.generatePin(3), throwsException);
    });
  });

  group('Password Generator - Validation & Strength', () {
    test('validatePassword returns true for strong password', () {
      final passwordGenerator = PasswordGenerator();
      expect(passwordGenerator.validatePassword('MyStr0ng!P@ss'), isTrue);
    });

    test('validatePassword returns false for weak password', () {
      final passwordGenerator = PasswordGenerator();
      expect(passwordGenerator.validatePassword('password'), isFalse);
      expect(passwordGenerator.validatePassword('12345678'), isFalse);
      expect(passwordGenerator.validatePassword('PASSWORD'), isFalse);
    });

    test('passwordStrengthScore returns correct range', () {
      final passwordGenerator = PasswordGenerator();
      final score =
          passwordGenerator.passwordStrengthScore('MyStr0ng!P@ssw0rd');
      expect(score, greaterThanOrEqualTo(0));
      expect(score, lessThanOrEqualTo(100));
    });

    test('passwordStrengthScore weak vs strong comparison', () {
      final passwordGenerator = PasswordGenerator();
      final weakScore = passwordGenerator.passwordStrengthScore('password');
      final strongScore =
          passwordGenerator.passwordStrengthScore('MyStr0ng!P@ssw0rd');
      expect(strongScore, greaterThan(weakScore));
    });

    test('passwordStrengthLabel returns correct labels', () {
      final passwordGenerator = PasswordGenerator();
      expect(
          passwordGenerator.passwordStrengthLabel('pass'), equals('Very Weak'));
      expect(passwordGenerator.passwordStrengthLabel('MyStr0ng!P@ssw0rd'),
          equals('Very Strong'));
    });

    test('calculateEntropy returns positive value', () {
      final passwordGenerator = PasswordGenerator();
      final entropy = passwordGenerator.calculateEntropy('MyStr0ng!P@ss');
      expect(entropy, greaterThan(0));
    });

    test('calculateEntropy strong vs weak comparison', () {
      final passwordGenerator = PasswordGenerator();
      final weakEntropy = passwordGenerator.calculateEntropy('password');
      final strongEntropy =
          passwordGenerator.calculateEntropy('MyStr0ng!P@ssw0rd#123');
      expect(strongEntropy, greaterThan(weakEntropy));
    });

    test('entropyLabel returns valid description', () {
      final passwordGenerator = PasswordGenerator();
      final label = passwordGenerator.entropyLabel('MyStr0ng!P@ss');
      expect(label, isNotNull);
      expect(label, isNotEmpty);
    });
  });
}
