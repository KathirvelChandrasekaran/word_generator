import 'package:flutter_test/flutter_test.dart';
import 'package:word_generator/word_generator.dart';
import 'package:word_generator/data/verbs.dart' as verbs_data;
import 'package:word_generator/data/names.dart' as names_data;

void main() {
  test('randomNoun', () {
    final wordGenerator = WordGenerator();
    expect(wordGenerator.randomNoun(), isNotNull);
  });

  test('randomSentence', () {
    final wordGenerator = WordGenerator();
    expect(wordGenerator.randomSentence(), isNotNull);
  });

  test('countSyllables', () {
    final wordGenerator = WordGenerator();
    expect(wordGenerator.countSyllables('hello'), 2);
  });

  test('randomNouns', () {
    final wordGenerator = WordGenerator();
    expect(wordGenerator.randomNouns(5).length, 5);
  });

  test('randomNames', () {
    final wordGenerator = WordGenerator();
    expect(wordGenerator.randomNames(5).length, 5);
  });

  test('randomNamesNotAppended', () {
    final wordGenerator = WordGenerator();
    final names = wordGenerator.randomNames(5);

    expect(names.every((name) => names_data.names.contains(name)), isTrue);
  });

   test('randomVerbs', () {
    final wordGenerator = WordGenerator();
    expect(wordGenerator.randomVerbs(5).length, 5);
  });

  test('randomVerbsNotAppended', () {
    final wordGenerator = WordGenerator();
    final verbs = wordGenerator.randomVerbs(5);

    expect(verbs.every((verb) => verbs_data.verbs.contains(verb)), isTrue);
  });
}
