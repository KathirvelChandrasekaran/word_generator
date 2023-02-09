import 'package:flutter_test/flutter_test.dart';
import 'package:word_generator/word_generator.dart';

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
}
