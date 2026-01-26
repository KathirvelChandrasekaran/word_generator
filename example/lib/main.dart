import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:word_generator/word_generator.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word Generator Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const DemoHomePage(),
    );
  }
}

class DemoHomePage extends StatefulWidget {
  const DemoHomePage({super.key});

  @override
  State<DemoHomePage> createState() => _DemoHomePageState();
}

class _DemoHomePageState extends State<DemoHomePage> {
  String _output = 'Tap any button to see results';
  final _wordGenerator = WordGenerator();
  final _passwordGenerator = PasswordGenerator();

  void _updateOutput(String text) {
    setState(() {
      _output = text;
    });
  }

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Copied to clipboard!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Word Generator Demo'),
        elevation: 2,
      ),
      body: Column(
        children: [
          // Output Display Area
          Container(
            width: double.infinity,
            height: 150,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: SingleChildScrollView(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SelectableText(
                      _output,
                      style: const TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 14,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.copy, size: 20),
                    onPressed: () => _copyToClipboard(_output),
                    tooltip: 'Copy to clipboard',
                  ),
                ],
              ),
            ),
          ),

          // Scrollable Button Groups
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle('Word Generator - Nouns'),
                  _buildButtonGrid([
                    _DemoButton('Random Noun', () {
                      _updateOutput(_wordGenerator.randomNoun());
                    }),
                    _DemoButton('Random Nouns (3)', () {
                      _updateOutput(_wordGenerator.randomNouns(3).join(', '));
                    }),
                    _DemoButton('Random Sentence', () {
                      _updateOutput(_wordGenerator.randomSentence(4));
                    }),
                    _DemoButton('Nouns Starting with "a"', () {
                      _updateOutput(
                          '${_wordGenerator.nounsStartingWith('a').take(5).join(', ')}...');
                    }),
                    _DemoButton('Nouns Ending with "ing"', () {
                      _updateOutput(
                          '${_wordGenerator.nounsEndingWith('ing').take(5).join(', ')}...');
                    }),
                    _DemoButton('Nouns Containing "sp"', () {
                      _updateOutput(
                          '${_wordGenerator.nounsContaining('sp').take(5).join(', ')}...');
                    }),
                  ]),
                  const SizedBox(height: 24),
                  _buildSectionTitle('Word Generator - Verbs'),
                  _buildButtonGrid([
                    _DemoButton('Random Verb', () {
                      _updateOutput(_wordGenerator.randomVerb());
                    }),
                    _DemoButton('Random Verbs (3)', () {
                      _updateOutput(_wordGenerator.randomVerbs(3).join(', '));
                    }),
                    _DemoButton('Verbs Starting with "a"', () {
                      _updateOutput(
                          '${_wordGenerator.verbsStartingWith('a').take(5).join(', ')}...');
                    }),
                    _DemoButton('Verbs Ending with "ing"', () {
                      _updateOutput(
                          '${_wordGenerator.verbsEndingWith('ing').take(5).join(', ')}...');
                    }),
                    _DemoButton('Verbs Containing "sp"', () {
                      _updateOutput(
                          '${_wordGenerator.verbsContaining('sp').take(5).join(', ')}...');
                    }),
                  ]),
                  const SizedBox(height: 24),
                  _buildSectionTitle('Word Generator - Names'),
                  _buildButtonGrid([
                    _DemoButton('Random Name', () {
                      _updateOutput(_wordGenerator.randomName());
                    }),
                    _DemoButton('Random Names (3)', () {
                      _updateOutput(_wordGenerator.randomNames(3).join(', '));
                    }),
                    _DemoButton('Random First Name', () {
                      _updateOutput(_wordGenerator.randomFirstName());
                    }),
                    _DemoButton('Random Last Name', () {
                      _updateOutput(_wordGenerator.randomLastName());
                    }),
                  ]),
                  const SizedBox(height: 24),
                  _buildSectionTitle('Name Enhancements - Usernames & Emails'),
                  _buildButtonGrid([
                    _DemoButton('Username (Default)', () {
                      _updateOutput(_wordGenerator.generateUsername());
                    }),
                    _DemoButton('Username + Number', () {
                      _updateOutput(_wordGenerator.generateUsername(
                        includeNumber: true,
                      ));
                    }),
                    _DemoButton('Username (Capitalized)', () {
                      _updateOutput(_wordGenerator.generateUsername(
                        capitalize: true,
                        includeNumber: true,
                      ));
                    }),
                    _DemoButton('Username (Underscore)', () {
                      _updateOutput(_wordGenerator.generateUsername(
                        separator: '_',
                        includeNumber: true,
                      ));
                    }),
                    _DemoButton('Username (Name Style)', () {
                      _updateOutput(_wordGenerator.generateUsername(
                        style: 'firstname-lastname',
                        includeNumber: true,
                      ));
                    }),
                    _DemoButton('Generate Email', () {
                      _updateOutput(_wordGenerator.generateEmail());
                    }),
                    _DemoButton('Email (Custom Domain)', () {
                      _updateOutput(_wordGenerator.generateEmail(
                        domain: 'mycompany.com',
                      ));
                    }),
                  ]),
                  const SizedBox(height: 24),
                  _buildSectionTitle('Utility - Case Formats'),
                  _buildButtonGrid([
                    _DemoButton('camelCase', () {
                      _updateOutput(_wordGenerator.generateCamelCase());
                    }),
                    _DemoButton('snake_case', () {
                      _updateOutput(_wordGenerator.generateSnakeCase());
                    }),
                    _DemoButton('PascalCase', () {
                      _updateOutput(_wordGenerator.generatePascalCase());
                    }),
                    _DemoButton('kebab-case', () {
                      _updateOutput(_wordGenerator.generateKebabCase());
                    }),
                    _DemoButton('Slug (3 words)', () {
                      _updateOutput(_wordGenerator.generateSlug());
                    }),
                    _DemoButton('Slug (5 words)', () {
                      _updateOutput(_wordGenerator.generateSlug(wordCount: 5));
                    }),
                  ]),
                  const SizedBox(height: 24),
                  _buildSectionTitle('Utility - Lorem Ipsum & Stats'),
                  _buildButtonGrid([
                    _DemoButton('Lorem Ipsum (1 para)', () {
                      _updateOutput(_wordGenerator.generateLoremIpsum());
                    }),
                    _DemoButton('Lorem Ipsum (2 para)', () {
                      _updateOutput(
                          _wordGenerator.generateLoremIpsum(paragraphs: 2));
                    }),
                    _DemoButton('Word Statistics', () {
                      final stats = _wordGenerator.getWordStatistics();
                      _updateOutput(
                          'Nouns: ${stats['nouns']['count']} (avg: ${stats['nouns']['averageLength']})\n'
                          'Verbs: ${stats['verbs']['count']} (avg: ${stats['verbs']['averageLength']})\n'
                          'Names: ${stats['names']['count']} (avg: ${stats['names']['averageLength']})');
                    }),
                    _DemoButton('Title Case', () {
                      _updateOutput(_wordGenerator
                          .toTitleCase('the quick brown fox jumps'));
                    }),
                  ]),
                  const SizedBox(height: 24),
                  _buildSectionTitle('Utility - Unique & Filtered Words'),
                  _buildButtonGrid([
                    _DemoButton('Unique Nouns (5)', () {
                      _updateOutput(
                          _wordGenerator.uniqueRandomNouns(5).join(', '));
                    }),
                    _DemoButton('Unique Verbs (5)', () {
                      _updateOutput(
                          _wordGenerator.uniqueRandomVerbs(5).join(', '));
                    }),
                    _DemoButton('Nouns (Length 5)', () {
                      _updateOutput(
                          _wordGenerator.nounsByLength(5).take(10).join(', '));
                    }),
                    _DemoButton('Nouns (Min Length 10)', () {
                      _updateOutput(_wordGenerator
                          .nounsWithMinLength(10)
                          .take(10)
                          .join(', '));
                    }),
                    _DemoButton('Verbs (Length 4)', () {
                      _updateOutput(
                          _wordGenerator.verbsByLength(4).take(10).join(', '));
                    }),
                    _DemoButton('Verbs (Min Length 8)', () {
                      _updateOutput(_wordGenerator
                          .verbsWithMinLength(8)
                          .take(10)
                          .join(', '));
                    }),
                  ]),
                  const SizedBox(height: 24),
                  _buildSectionTitle('Word Generator - Utils'),
                  _buildButtonGrid([
                    _DemoButton('Count Syllables', () {
                      const word = 'beautiful';
                      _updateOutput(
                          '"$word" has ${_wordGenerator.countSyllables(word)} syllables');
                    }),
                    _DemoButton('Seeded Generator', () {
                      final seededGen = WordGenerator(seed: 42);
                      final word1 = seededGen.randomNoun();
                      final seededGen2 = WordGenerator(seed: 42);
                      final word2 = seededGen2.randomNoun();
                      _updateOutput(
                          'Seed 42 always gives: "$word1"\nVerify: "$word2"');
                    }),
                  ]),
                  const SizedBox(height: 24),
                  _buildSectionTitle('Password Generator - Basic'),
                  _buildButtonGrid([
                    _DemoButton('Generate Password (8)', () {
                      _updateOutput(_passwordGenerator.generatePassword());
                    }),
                    _DemoButton('Generate Password (16)', () {
                      _updateOutput(_passwordGenerator.generatePassword(16));
                    }),
                    _DemoButton('Password without @', () {
                      _updateOutput(
                          _passwordGenerator.generatePassword(12, ['@']));
                    }),
                    _DemoButton('Custom (No Special)', () {
                      _updateOutput(_passwordGenerator.generateCustomPassword(
                        length: 12,
                        includeSpecial: false,
                      ));
                    }),
                    _DemoButton('Only Letters', () {
                      _updateOutput(_passwordGenerator.generateCustomPassword(
                        length: 12,
                        includeNumbers: false,
                        includeSpecial: false,
                      ));
                    }),
                  ]),
                  const SizedBox(height: 24),
                  _buildSectionTitle('Password Generator - Passphrase'),
                  _buildButtonGrid([
                    _DemoButton('Basic Passphrase', () {
                      _updateOutput(_passwordGenerator.generatePassphrase());
                    }),
                    _DemoButton('Capitalized + Number', () {
                      _updateOutput(_passwordGenerator.generatePassphrase(
                        capitalize: true,
                        includeNumber: true,
                      ));
                    }),
                    _DemoButton('Underscore Separator', () {
                      _updateOutput(_passwordGenerator.generatePassphrase(
                        wordCount: 3,
                        separator: '_',
                      ));
                    }),
                    _DemoButton('5 Words', () {
                      _updateOutput(_passwordGenerator.generatePassphrase(
                        wordCount: 5,
                      ));
                    }),
                  ]),
                  const SizedBox(height: 24),
                  _buildSectionTitle('Password Generator - Special Types'),
                  _buildButtonGrid([
                    _DemoButton('Pronounceable', () {
                      _updateOutput(_passwordGenerator.generatePronounceable());
                    }),
                    _DemoButton('Pronounceable (No #)', () {
                      _updateOutput(_passwordGenerator.generatePronounceable(
                        includeNumbers: false,
                      ));
                    }),
                    _DemoButton('4-Digit PIN', () {
                      _updateOutput(_passwordGenerator.generatePin());
                    }),
                    _DemoButton('6-Digit PIN', () {
                      _updateOutput(_passwordGenerator.generatePin(6));
                    }),
                  ]),
                  const SizedBox(height: 24),
                  _buildSectionTitle('Password Validation & Strength'),
                  _buildButtonGrid([
                    _DemoButton('Validate Weak', () {
                      const pwd = 'password';
                      final valid = _passwordGenerator.validatePassword(pwd);
                      _updateOutput('"$pwd"\nValid: $valid');
                    }),
                    _DemoButton('Validate Strong', () {
                      const pwd = 'MyStr0ng!P@ss';
                      final valid = _passwordGenerator.validatePassword(pwd);
                      _updateOutput('"$pwd"\nValid: $valid');
                    }),
                    _DemoButton('Strength Score (Weak)', () {
                      const pwd = 'password';
                      final score =
                          _passwordGenerator.passwordStrengthScore(pwd);
                      final label =
                          _passwordGenerator.passwordStrengthLabel(pwd);
                      _updateOutput('"$pwd"\nScore: $score/100\nLabel: $label');
                    }),
                    _DemoButton('Strength Score (Strong)', () {
                      const pwd = 'MyStr0ng!P@ssw0rd';
                      final score =
                          _passwordGenerator.passwordStrengthScore(pwd);
                      final label =
                          _passwordGenerator.passwordStrengthLabel(pwd);
                      _updateOutput('"$pwd"\nScore: $score/100\nLabel: $label');
                    }),
                    _DemoButton('Entropy (Weak)', () {
                      const pwd = 'password';
                      final entropy = _passwordGenerator.calculateEntropy(pwd);
                      final label = _passwordGenerator.entropyLabel(pwd);
                      _updateOutput(
                          '"$pwd"\nEntropy: ${entropy.toStringAsFixed(2)} bits\n$label');
                    }),
                    _DemoButton('Entropy (Strong)', () {
                      const pwd = 'MyStr0ng!P@ssw0rd';
                      final entropy = _passwordGenerator.calculateEntropy(pwd);
                      final label = _passwordGenerator.entropyLabel(pwd);
                      _updateOutput(
                          '"$pwd"\nEntropy: ${entropy.toStringAsFixed(2)} bits\n$label');
                    }),
                  ]),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _buildButtonGrid(List<_DemoButton> buttons) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: buttons
          .map((btn) => ElevatedButton(
                onPressed: btn.onPressed,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                child: Text(btn.label),
              ))
          .toList(),
    );
  }
}

class _DemoButton {
  final String label;
  final VoidCallback onPressed;

  _DemoButton(this.label, this.onPressed);
}
