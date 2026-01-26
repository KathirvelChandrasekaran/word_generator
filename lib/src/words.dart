import 'dart:math';

import 'package:word_generator/data/names.dart';
import 'package:word_generator/data/nouns.dart';
import 'package:word_generator/data/verbs.dart';

class WordGenerator {
  Random? _seededRandom;

  /// Creates a WordGenerator with an optional seed for deterministic generation.
  ///
  /// - [seed]: Optional seed value for reproducible random generation.
  WordGenerator({int? seed}) {
    if (seed != null) {
      _seededRandom = Random(seed);
    }
  }

  Random get _random => _seededRandom ?? Random();

  // Cache for parsed first and last names from the names list
  List<String>? _cachedFirstNames;
  List<String>? _cachedLastNames;

  /// Extracts first names from the names list
  List<String> get _firstNames {
    _cachedFirstNames ??= names.map((fullName) {
      final parts = fullName.trim().split(' ');
      return parts.first;
    }).toList();
    return _cachedFirstNames!;
  }

  /// Extracts last names from the names list
  List<String> get _lastNames {
    _cachedLastNames ??= names.where((fullName) {
      final parts = fullName.trim().split(' ');
      return parts.length > 1;
    }).map((fullName) {
      final parts = fullName.trim().split(' ');
      return parts.last;
    }).toList();
    return _cachedLastNames!;
  }

  // Email domains for fake email generation
  static const List<String> _emailDomains = [
    'gmail.com',
    'yahoo.com',
    'outlook.com',
    'hotmail.com',
    'example.com',
    'test.com',
    'demo.com',
    'mail.com',
    'email.com',
    'inbox.com',
  ];

  // Lorem ipsum word bank
  static const List<String> _loremWords = [
    'lorem',
    'ipsum',
    'dolor',
    'sit',
    'amet',
    'consectetur',
    'adipiscing',
    'elit',
    'sed',
    'do',
    'eiusmod',
    'tempor',
    'incididunt',
    'ut',
    'labore',
    'et',
    'dolore',
    'magna',
    'aliqua',
    'enim',
    'ad',
    'minim',
    'veniam',
    'quis',
    'nostrud',
    'exercitation',
    'ullamco',
    'laboris',
    'nisi',
    'aliquip',
    'ex',
    'ea',
    'commodo',
    'consequat',
    'duis',
    'aute',
    'irure',
    'in',
    'reprehenderit',
    'voluptate',
    'velit',
    'esse',
    'cillum',
    'fugiat',
    'nulla',
    'pariatur',
    'excepteur',
    'sint',
    'occaecat',
    'cupidatat',
    'non',
    'proident',
    'sunt',
    'culpa',
    'qui',
    'officia',
    'deserunt',
    'mollit',
    'anim',
    'id',
    'est',
    'laborum',
  ];

  /// Returns a list of random nouns.
  /// [count] is the number of nouns to return.
  List<String> randomNouns([int count = 2]) {
    if (count < 2) {
      throw Exception('Count must be at least 2');
    }
    final pickedNouns = <String>[];
    for (var i = 0; i < count; i++) {
      pickedNouns.add(randomNoun());
    }
    return pickedNouns;
  }

  /// Returns a random noun.
  String randomNoun() {
    return nouns[_random.nextInt(nouns.length)];
  }

  /// Returns a random sentence.
  /// [count] is the number of nouns to return.
  String randomSentence([int count = 2]) {
    if (count < 2) {
      throw Exception('Count must be at least 2');
    }
    var sentence = '';
    for (var i = 0; i < count; i++) {
      sentence += '${nouns[_random.nextInt(nouns.length)]} ';
    }
    return sentence;
  }

  /// count the syllables in a noun
  /// [noun] is the noun to count the syllables in.
  int countSyllables(String noun) {
    var count = 0;
    var vowels = 'aeiouy';
    noun = noun.toLowerCase().trim();
    if (noun.isEmpty) {
      return count;
    }
    if (noun.length == 1) {
      return count;
    }
    if (vowels.contains(noun[0])) {
      count++;
    }
    for (var i = 1; i < noun.length; i++) {
      if (vowels.contains(noun[i]) && !vowels.contains(noun[i - 1])) {
        count++;
      }
    }
    if (noun.endsWith('e')) {
      count--;
    }
    if (count == 0) {
      count++;
    }
    return count;
  }

  /// Returns a list of random verbs.
  /// [count] is the number of words to return.
  List<String> randomVerbs([int count = 2]) {
    if (count < 2) {
      throw Exception('Count must be at least 2');
    }
    final verbsRes = <String>[];
    for (var i = 0; i < count; i++) {
      verbsRes.add(verbs[_random.nextInt(verbs.length)]);
    }
    return verbsRes;
  }

  // Fetch the verbs starting with the letter
  /// [letter] is the letter to filter the verbs by.
  List<String> verbsStartingWith(String letter) {
    final filteredVerbs = <String>[];
    for (var i = 0; i < verbs.length; i++) {
      if (verbs[i].startsWith(letter)) {
        filteredVerbs.add(verbs[i]);
      }
    }
    return filteredVerbs;
  }

  // Fetch the verbs ending with the letter
  /// [letter] is the letter to filter the verbs by.
  List<String> verbsEndingWith(String letter) {
    final filteredVerbs = <String>[];
    for (var i = 0; i < verbs.length; i++) {
      if (verbs[i].endsWith(letter)) {
        filteredVerbs.add(verbs[i]);
      }
    }
    return filteredVerbs;
  }

  // Fetch the verbs containing the letter
  /// [letter] is the letter to filter the verbs by.
  List<String> verbsContaining(String letter) {
    final filteredVerbs = <String>[];
    for (var i = 0; i < verbs.length; i++) {
      if (verbs[i].contains(letter)) {
        filteredVerbs.add(verbs[i]);
      }
    }
    return filteredVerbs;
  }

  // Fetch the nouns starting with the letter
  /// [letter] is the letter to filter the nouns by.
  List<String> nounsStartingWith(String letter) {
    final filteredNouns = <String>[];
    for (var i = 0; i < nouns.length; i++) {
      if (nouns[i].startsWith(letter)) {
        filteredNouns.add(nouns[i]);
      }
    }
    return filteredNouns;
  }

  // Fetch the nouns ending with the letter
  /// [letter] is the letter to filter the nouns by.
  List<String> nounsEndingWith(String letter) {
    final filteredNouns = <String>[];
    for (var i = 0; i < nouns.length; i++) {
      if (nouns[i].endsWith(letter)) {
        filteredNouns.add(nouns[i]);
      }
    }
    return filteredNouns;
  }

  // Fetch the nouns containing the letter
  /// [letter] is the letter to filter the nouns by.
  List<String> nounsContaining(String letter) {
    final filteredNouns = <String>[];
    for (var i = 0; i < nouns.length; i++) {
      if (nouns[i].contains(letter)) {
        filteredNouns.add(nouns[i]);
      }
    }
    return filteredNouns;
  }

  /// Returns a random verb.
  /// [count] is the number of words to return.
  String randomVerb() {
    return verbs[_random.nextInt(verbs.length)];
  }

  /// Returns a random names.
  /// [count] is the number of words to return.
  List<String> randomNames([int count = 2]) {
    if (count < 2) {
      throw Exception('Count must be at least 2');
    }
    final namesRes = <String>[];
    for (var i = 0; i < count; i++) {
      namesRes.add(names[_random.nextInt(names.length)]);
    }
    return namesRes;
  }

  /// Returns a random name.
  String randomName() {
    return names[_random.nextInt(names.length)];
  }

  // ==================== Name Enhancements ====================

  /// Returns a random first name from the built-in list.
  String randomFirstName() {
    return _firstNames[_random.nextInt(_firstNames.length)];
  }

  /// Returns a random last name from the built-in list.
  String randomLastName() {
    return _lastNames[_random.nextInt(_lastNames.length)];
  }

  /// Generates a random username combining words and optional numbers.
  ///
  /// - [style]: The style of username - 'adjective-noun', 'noun-number',
  ///   'firstname-lastname', or 'word-word'. Defaults to 'adjective-noun'.
  /// - [separator]: Character to separate parts. Defaults to empty string.
  /// - [includeNumber]: Whether to append a random number. Defaults to false.
  /// - [capitalize]: Whether to capitalize each word. Defaults to false.
  ///
  /// Returns a username like 'HappyTiger42' or 'quick_fox_77'.
  String generateUsername({
    String style = 'adjective-noun',
    String separator = '',
    bool includeNumber = false,
    bool capitalize = false,
  }) {
    String username;

    switch (style) {
      case 'noun-number':
        username = randomNoun();
        break;
      case 'firstname-lastname':
        username = '${randomFirstName()}$separator${randomLastName()}';
        if (!capitalize) {
          username = username.toLowerCase();
        }
        if (includeNumber) {
          username += separator + _random.nextInt(1000).toString();
        }
        return username;
      case 'word-word':
        username = '${randomNoun()}$separator${randomVerb()}';
        break;
      case 'adjective-noun':
      default:
        // For simplicity, using noun-noun as adjective placeholder
        username = '${randomNoun()}$separator${randomNoun()}';
        break;
    }

    if (capitalize) {
      final parts = username.split(separator);
      username = parts
          .map((p) => p.isEmpty ? p : p[0].toUpperCase() + p.substring(1))
          .join(separator);
    }

    if (includeNumber) {
      username += separator + _random.nextInt(1000).toString();
    }

    return username;
  }

  /// Generates a fake email address for testing purposes.
  ///
  /// - [username]: Optional custom username. If not provided, generates one.
  /// - [domain]: Optional custom domain. If not provided, uses a random one.
  ///
  /// Returns an email address like 'happytiger42@example.com'.
  String generateEmail({String? username, String? domain}) {
    final user = username ??
        generateUsername(separator: '', includeNumber: true).toLowerCase();
    final emailDomain =
        domain ?? _emailDomains[_random.nextInt(_emailDomains.length)];
    return '$user@$emailDomain';
  }

  // ==================== Utility Features ====================

  /// Generates a URL-friendly slug from random words.
  ///
  /// - [wordCount]: Number of words to include. Defaults to 3.
  /// - [separator]: Character to separate words. Defaults to '-'.
  ///
  /// Returns a slug like 'blue-ocean-adventure'.
  String generateSlug({int wordCount = 3, String separator = '-'}) {
    if (wordCount < 1) {
      throw Exception('Word count must be at least 1');
    }
    final words = <String>[];
    for (var i = 0; i < wordCount; i++) {
      words.add(randomNoun().toLowerCase());
    }
    return words.join(separator);
  }

  /// Generates a random string in camelCase format.
  ///
  /// - [wordCount]: Number of words to include. Defaults to 2.
  ///
  /// Returns a camelCase string like 'quickBrownFox'.
  String generateCamelCase({int wordCount = 2}) {
    if (wordCount < 2) {
      throw Exception('Word count must be at least 2');
    }
    final words = <String>[];
    for (var i = 0; i < wordCount; i++) {
      final word = randomNoun().toLowerCase();
      if (i == 0) {
        words.add(word);
      } else {
        words.add(word[0].toUpperCase() + word.substring(1));
      }
    }
    return words.join();
  }

  /// Generates a random string in snake_case format.
  ///
  /// - [wordCount]: Number of words to include. Defaults to 2.
  ///
  /// Returns a snake_case string like 'quick_brown_fox'.
  String generateSnakeCase({int wordCount = 2}) {
    if (wordCount < 2) {
      throw Exception('Word count must be at least 2');
    }
    final words = <String>[];
    for (var i = 0; i < wordCount; i++) {
      words.add(randomNoun().toLowerCase());
    }
    return words.join('_');
  }

  /// Generates a random string in PascalCase format.
  ///
  /// - [wordCount]: Number of words to include. Defaults to 2.
  ///
  /// Returns a PascalCase string like 'QuickBrownFox'.
  String generatePascalCase({int wordCount = 2}) {
    if (wordCount < 2) {
      throw Exception('Word count must be at least 2');
    }
    final words = <String>[];
    for (var i = 0; i < wordCount; i++) {
      final word = randomNoun().toLowerCase();
      words.add(word[0].toUpperCase() + word.substring(1));
    }
    return words.join();
  }

  /// Generates a random string in kebab-case format.
  ///
  /// - [wordCount]: Number of words to include. Defaults to 2.
  ///
  /// Returns a kebab-case string like 'quick-brown-fox'.
  String generateKebabCase({int wordCount = 2}) {
    if (wordCount < 2) {
      throw Exception('Word count must be at least 2');
    }
    final words = <String>[];
    for (var i = 0; i < wordCount; i++) {
      words.add(randomNoun().toLowerCase());
    }
    return words.join('-');
  }

  /// Generates Lorem Ipsum placeholder text.
  ///
  /// - [paragraphs]: Number of paragraphs to generate. Defaults to 1.
  /// - [sentencesPerParagraph]: Number of sentences per paragraph. Defaults to 5.
  /// - [wordsPerSentence]: Approximate words per sentence. Defaults to 10.
  ///
  /// Returns Lorem Ipsum text.
  String generateLoremIpsum({
    int paragraphs = 1,
    int sentencesPerParagraph = 5,
    int wordsPerSentence = 10,
  }) {
    final result = <String>[];

    for (var p = 0; p < paragraphs; p++) {
      final paragraphSentences = <String>[];

      for (var s = 0; s < sentencesPerParagraph; s++) {
        final words = <String>[];
        final wordCount =
            wordsPerSentence + _random.nextInt(5) - 2; // Add variation

        for (var w = 0; w < wordCount; w++) {
          words.add(_loremWords[_random.nextInt(_loremWords.length)]);
        }

        // Capitalize first word
        if (words.isNotEmpty) {
          words[0] = words[0][0].toUpperCase() + words[0].substring(1);
        }

        paragraphSentences.add('${words.join(' ')}.');
      }

      result.add(paragraphSentences.join(' '));
    }

    return result.join('\n\n');
  }

  /// Returns statistics about the available word lists.
  ///
  /// Returns a map with counts and averages for nouns, verbs, and names.
  Map<String, dynamic> getWordStatistics() {
    double averageLength(List<String> words) {
      if (words.isEmpty) return 0;
      return words.map((w) => w.length).reduce((a, b) => a + b) / words.length;
    }

    return {
      'nouns': {
        'count': nouns.length,
        'averageLength': averageLength(nouns).toStringAsFixed(2),
      },
      'verbs': {
        'count': verbs.length,
        'averageLength': averageLength(verbs).toStringAsFixed(2),
      },
      'names': {
        'count': names.length,
        'averageLength': averageLength(names).toStringAsFixed(2),
      },
    };
  }

  /// Converts a string to Title Case.
  ///
  /// - [text]: The text to convert.
  ///
  /// Returns the text in Title Case.
  String toTitleCase(String text) {
    if (text.isEmpty) return text;
    return text.split(' ').map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }

  /// Returns a list of unique random nouns.
  ///
  /// - [count]: The number of unique nouns to return.
  ///
  /// Throws if count exceeds available nouns.
  List<String> uniqueRandomNouns(int count) {
    if (count > nouns.length) {
      throw Exception('Count cannot exceed available nouns (${nouns.length})');
    }
    final shuffled = List<String>.from(nouns)..shuffle(_random);
    return shuffled.take(count).toList();
  }

  /// Returns a list of unique random verbs.
  ///
  /// - [count]: The number of unique verbs to return.
  ///
  /// Throws if count exceeds available verbs.
  List<String> uniqueRandomVerbs(int count) {
    if (count > verbs.length) {
      throw Exception('Count cannot exceed available verbs (${verbs.length})');
    }
    final shuffled = List<String>.from(verbs)..shuffle(_random);
    return shuffled.take(count).toList();
  }

  /// Returns a list of unique random names.
  ///
  /// - [count]: The number of unique names to return.
  ///
  /// Throws if count exceeds available names.
  List<String> uniqueRandomNames(int count) {
    if (count > names.length) {
      throw Exception('Count cannot exceed available names (${names.length})');
    }
    final shuffled = List<String>.from(names)..shuffle(_random);
    return shuffled.take(count).toList();
  }

  /// Returns nouns filtered by length.
  ///
  /// - [length]: The exact length of nouns to return.
  List<String> nounsByLength(int length) {
    return nouns.where((noun) => noun.length == length).toList();
  }

  /// Returns nouns with minimum length.
  ///
  /// - [minLength]: The minimum length of nouns to return.
  List<String> nounsWithMinLength(int minLength) {
    return nouns.where((noun) => noun.length >= minLength).toList();
  }

  /// Returns verbs filtered by length.
  ///
  /// - [length]: The exact length of verbs to return.
  List<String> verbsByLength(int length) {
    return verbs.where((verb) => verb.length == length).toList();
  }

  /// Returns verbs with minimum length.
  ///
  /// - [minLength]: The minimum length of verbs to return.
  List<String> verbsWithMinLength(int minLength) {
    return verbs.where((verb) => verb.length >= minLength).toList();
  }
}
