import 'dart:math';

import 'package:word_generator/data/names.dart';
import 'package:word_generator/data/nouns.dart';
import 'package:word_generator/data/verbs.dart';

class WordGenerator {
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
    final random = Random();
    return nouns[random.nextInt(nouns.length)];
  }

  /// Returns a random sentence.
  /// [count] is the number of nouns to return.
  String randomSentence([int count = 2]) {
    if (count < 2) {
      throw Exception('Count must be at least 2');
    }
    final random = Random();
    var sentence = '';
    for (var i = 0; i < count; i++) {
      sentence += '${nouns[random.nextInt(nouns.length)]} ';
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
    final random = Random();
    final verbsRes = <String>[];
    for (var i = 0; i < count; i++) {
      verbsRes.add(verbs[random.nextInt(verbs.length)]);
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
    final random = Random();
    return verbs[random.nextInt(verbs.length)];
  }

  /// Returns a random names.
  /// [count] is the number of words to return.
  List<String> randomNames([int count = 2]) {
    if (count < 2) {
      throw Exception('Count must be at least 2');
    }
    final random = Random();
    final namesRes = <String>[];
    for (var i = 0; i < count; i++) {
      namesRes.add(names[random.nextInt(names.length)]);
    }
    return namesRes;
  }

  /// Returns a random name.
  String randomName() {
    final random = Random();
    return names[random.nextInt(names.length)];
  }
}
