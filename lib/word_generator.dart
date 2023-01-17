library word_generator;

import 'dart:math';

import 'package:word_generator/nouns.dart';

class WordGenerator {
  /// Returns a list of random words.
  /// [count] is the number of words to return.
  randomNouns([int count = 2]) {
    final random = Random();
    final nouns = <String>[];
    for (var i = 0; i < count; i++) {
      var noun = '';
      for (var j = 0; j < count; j++) {
        noun += nouns[random.nextInt(nouns.length)];
      }
      nouns.add(noun);
    }
    return nouns;
  }

  /// Returns a random noun.
  randomNoun() {
    final random = Random();
    return nouns[random.nextInt(nouns.length)];
  }

  /// Returns a random sentence.
  /// [count] is the number of nouns to return.
  randomSentence([int count = 2]) {
    final random = Random();
    var sentence = '';
    for (var i = 0; i < count; i++) {
      sentence += '${nouns[random.nextInt(nouns.length)]} ';
    }
    return sentence;
  }

  /// count the syllables in a noun
  /// [noun] is the noun to count the syllables in.
  countSyllables(String noun) {
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
}
