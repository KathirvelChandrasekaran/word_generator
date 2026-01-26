import 'dart:math';

/// A utility class for generating and validating passwords.
class PasswordGenerator {
  /// Default character sets for password generation
  static const String lowercaseChars = 'abcdefghijklmnopqrstuvwxyz';
  static const String uppercaseChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  static const String numberChars = '0123456789';
  static const String specialChars = '!@#%^&*()';

  /// Consonants and vowels for pronounceable passwords
  static const String _consonants = 'bcdfghjklmnpqrstvwxyz';
  static const String _vowels = 'aeiou';

  /// Default word list for passphrase generation
  static const List<String> _defaultWordList = [
    'apple',
    'banana',
    'cherry',
    'dragon',
    'eagle',
    'falcon',
    'garden',
    'harbor',
    'island',
    'jungle',
    'kitchen',
    'lemon',
    'mountain',
    'nuclear',
    'orange',
    'planet',
    'quantum',
    'river',
    'sunset',
    'thunder',
    'umbrella',
    'village',
    'winter',
    'xenon',
    'yellow',
    'zebra',
    'anchor',
    'bridge',
    'castle',
    'dolphin',
    'engine',
    'forest',
    'glacier',
    'horizon',
    'ivory',
    'jasmine',
    'kingdom',
    'lantern',
    'meadow',
    'nebula',
    'octopus',
    'phoenix',
    'quartz',
    'rainbow',
    'silver',
    'tornado',
    'unicorn',
    'volcano',
    'whisper',
    'correct',
    'horse',
    'battery',
    'staple',
    'crystal',
    'diamond',
    'emerald',
    'flame',
    'ghost',
    'hunter',
    'jewel',
    'knight',
    'legend',
    'magic',
    'ninja',
    'ocean',
    'pirate',
    'quest',
    'rocket',
    'shadow',
    'tiger',
    'vampire',
    'wizard',
    'zombie',
    'alpha',
    'bravo',
    'charlie',
    'delta',
    'echo',
    'foxtrot',
    'golf',
    'hotel',
    'india',
    'juliet',
    'kilo',
    'lima',
    'mike',
    'november',
    'oscar',
    'papa',
    'quebec',
    'romeo',
    'sierra',
    'tango',
    'uniform',
    'victor',
    'whiskey',
    'xray',
    'yankee',
    'zulu',
    'cosmic',
    'digital',
    'electric',
    'fusion',
    'gravity',
    'harmony',
    'infinite',
  ];

  /// Generates a random password.
  ///
  /// - [length]: The desired length of the password. Must be at least 8 characters.
  ///   Defaults to 8 if not specified.
  /// - [exceptionCharacters]: A list of characters to exclude from the generated password.
  ///
  /// Throws:
  /// - `Exception` if the length is less than 8.
  ///
  /// Returns:
  /// - A randomly generated password string that meets the specified criteria.
  String generatePassword([
    double length = 8,
    List<String>? exceptionCharacters,
  ]) {
    if (length < 8) {
      throw Exception('Password must be at least 8 characters long');
    }

    var password = '';
    var random = Random.secure();
    var characters =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#%^&*()';
    if (exceptionCharacters != null) {
      for (String character in exceptionCharacters) {
        characters = characters.replaceAll(character, '');
      }
    }
    for (var i = 0; i < length; i++) {
      password += characters[random.nextInt(characters.length)];
    }
    return password;
  }

  /// Generates a password with custom character sets.
  ///
  /// - [length]: The desired length of the password. Must be at least 4 characters.
  /// - [includeLowercase]: Whether to include lowercase letters. Defaults to true.
  /// - [includeUppercase]: Whether to include uppercase letters. Defaults to true.
  /// - [includeNumbers]: Whether to include numbers. Defaults to true.
  /// - [includeSpecial]: Whether to include special characters. Defaults to true.
  /// - [customCharacters]: Additional custom characters to include.
  ///
  /// Throws:
  /// - `Exception` if the length is less than 4 or no character sets are selected.
  ///
  /// Returns:
  /// - A randomly generated password string.
  String generateCustomPassword({
    int length = 12,
    bool includeLowercase = true,
    bool includeUppercase = true,
    bool includeNumbers = true,
    bool includeSpecial = true,
    String? customCharacters,
  }) {
    if (length < 4) {
      throw Exception('Password must be at least 4 characters long');
    }

    var characters = '';
    if (includeLowercase) characters += lowercaseChars;
    if (includeUppercase) characters += uppercaseChars;
    if (includeNumbers) characters += numberChars;
    if (includeSpecial) characters += specialChars;
    if (customCharacters != null) characters += customCharacters;

    if (characters.isEmpty) {
      throw Exception('At least one character set must be selected');
    }

    var password = '';
    var random = Random.secure();
    for (var i = 0; i < length; i++) {
      password += characters[random.nextInt(characters.length)];
    }
    return password;
  }

  /// Generates a memorable passphrase using random words.
  ///
  /// - [wordCount]: The number of words in the passphrase. Must be at least 3.
  ///   Defaults to 4.
  /// - [separator]: The character(s) to separate words. Defaults to '-'.
  /// - [capitalize]: Whether to capitalize the first letter of each word.
  ///   Defaults to false.
  /// - [includeNumber]: Whether to append a random number. Defaults to false.
  /// - [customWordList]: Optional custom list of words to use.
  ///
  /// Throws:
  /// - `Exception` if wordCount is less than 3.
  ///
  /// Returns:
  /// - A passphrase string like "correct-horse-battery-staple".
  String generatePassphrase({
    int wordCount = 4,
    String separator = '-',
    bool capitalize = false,
    bool includeNumber = false,
    List<String>? customWordList,
  }) {
    if (wordCount < 3) {
      throw Exception('Passphrase must contain at least 3 words');
    }

    final wordList = customWordList ?? _defaultWordList;
    final random = Random.secure();
    final words = <String>[];

    for (var i = 0; i < wordCount; i++) {
      var word = wordList[random.nextInt(wordList.length)];
      if (capitalize) {
        word = word[0].toUpperCase() + word.substring(1);
      }
      words.add(word);
    }

    var passphrase = words.join(separator);

    if (includeNumber) {
      passphrase += separator + random.nextInt(1000).toString();
    }

    return passphrase;
  }

  /// Generates a pronounceable password that is easier to remember.
  ///
  /// - [length]: The desired length of the password. Must be at least 6.
  ///   Defaults to 10.
  /// - [includeNumbers]: Whether to include numbers. Defaults to true.
  ///
  /// Returns:
  /// - A pronounceable password string like "kobami42".
  String generatePronounceable({
    int length = 10,
    bool includeNumbers = true,
  }) {
    if (length < 6) {
      throw Exception('Pronounceable password must be at least 6 characters');
    }

    final random = Random.secure();
    var password = '';
    var useConsonant = random.nextBool();

    // Generate consonant-vowel pattern
    final baseLength = includeNumbers ? length - 2 : length;
    for (var i = 0; i < baseLength; i++) {
      if (useConsonant) {
        password += _consonants[random.nextInt(_consonants.length)];
      } else {
        password += _vowels[random.nextInt(_vowels.length)];
      }
      useConsonant = !useConsonant;
    }

    // Optionally capitalize first letter
    if (random.nextBool()) {
      password = password[0].toUpperCase() + password.substring(1);
    }

    // Add numbers if requested
    if (includeNumbers) {
      password += random.nextInt(100).toString().padLeft(2, '0');
    }

    return password;
  }

  /// Generates a numeric PIN.
  ///
  /// - [length]: The desired length of the PIN. Must be at least 4.
  ///   Defaults to 4.
  ///
  /// Throws:
  /// - `Exception` if the length is less than 4.
  ///
  /// Returns:
  /// - A numeric PIN string like "4829".
  String generatePin([int length = 4]) {
    if (length < 4) {
      throw Exception('PIN must be at least 4 digits long');
    }

    final random = Random.secure();
    var pin = '';
    for (var i = 0; i < length; i++) {
      pin += random.nextInt(10).toString();
    }
    return pin;
  }

  /// Validates the strength of a password.
  ///
  /// A valid password must meet the following criteria:
  /// - Contains at least one number (`0-9`).
  /// - Contains at least one uppercase letter (`A-Z`).
  /// - Contains at least one lowercase letter (`a-z`).
  /// - Contains at least one special character (`!@#%^&*()`).
  /// - Is at least 8 characters long.
  ///
  /// - [password]: The password string to validate.
  ///
  /// Returns:
  /// - `true` if the password meets all the criteria.
  /// - `false` otherwise.
  bool validatePassword(String password) {
    var hasNumber = RegExp(r'[0-9]');
    var hasUpper = RegExp(r'[A-Z]');
    var hasLower = RegExp(r'[a-z]');
    var hasSpecial = RegExp(r'[!@#%^&*()]');
    var hasMinLength = password.length >= 8;

    return hasNumber.hasMatch(password) &&
        hasUpper.hasMatch(password) &&
        hasLower.hasMatch(password) &&
        hasSpecial.hasMatch(password) &&
        hasMinLength;
  }

  /// Calculates a password strength score from 0 to 100.
  ///
  /// Scoring criteria:
  /// - Length: up to 30 points (2 points per character, max at 15+ chars)
  /// - Lowercase letters: 10 points
  /// - Uppercase letters: 15 points
  /// - Numbers: 15 points
  /// - Special characters: 20 points
  /// - Mixed character types bonus: 10 points
  ///
  /// - [password]: The password string to evaluate.
  ///
  /// Returns:
  /// - An integer score from 0 to 100.
  int passwordStrengthScore(String password) {
    if (password.isEmpty) return 0;

    var score = 0;

    // Length score (up to 30 points)
    score += (password.length * 2).clamp(0, 30);

    // Character type scores
    final hasLower = RegExp(r'[a-z]').hasMatch(password);
    final hasUpper = RegExp(r'[A-Z]').hasMatch(password);
    final hasNumber = RegExp(r'[0-9]').hasMatch(password);
    final hasSpecial =
        RegExp(r'[!@#$%^&*()_+\-=\[\]{};:"\\|,.<>\/?]').hasMatch(password);

    if (hasLower) score += 10;
    if (hasUpper) score += 15;
    if (hasNumber) score += 15;
    if (hasSpecial) score += 20;

    // Bonus for using multiple character types
    final typesUsed =
        [hasLower, hasUpper, hasNumber, hasSpecial].where((e) => e).length;
    if (typesUsed >= 3) score += 10;

    return score.clamp(0, 100);
  }

  /// Returns a descriptive strength label based on the password score.
  ///
  /// - [password]: The password string to evaluate.
  ///
  /// Returns:
  /// - A string label: 'Very Weak', 'Weak', 'Fair', 'Strong', or 'Very Strong'.
  String passwordStrengthLabel(String password) {
    final score = passwordStrengthScore(password);
    if (score < 20) return 'Very Weak';
    if (score < 40) return 'Weak';
    if (score < 60) return 'Fair';
    if (score < 80) return 'Strong';
    return 'Very Strong';
  }

  /// Calculates the entropy of a password in bits.
  ///
  /// Entropy is a measure of password unpredictability. Higher entropy
  /// means a more secure password.
  ///
  /// - [password]: The password string to evaluate.
  ///
  /// Returns:
  /// - The entropy value in bits as a double.
  double calculateEntropy(String password) {
    if (password.isEmpty) return 0;

    var poolSize = 0;

    if (RegExp(r'[a-z]').hasMatch(password)) poolSize += 26;
    if (RegExp(r'[A-Z]').hasMatch(password)) poolSize += 26;
    if (RegExp(r'[0-9]').hasMatch(password)) poolSize += 10;
    if (RegExp(r'[!@#$%^&*()_+\-=\[\]{};:"\\|,.<>\/?]').hasMatch(password)) {
      poolSize += 32;
    }
    if (RegExp(r'\s').hasMatch(password)) poolSize += 1;

    if (poolSize == 0) return 0;

    // Entropy = length * log2(pool size)
    return password.length * (log(poolSize) / log(2));
  }

  /// Returns a descriptive entropy label based on the entropy bits.
  ///
  /// - [password]: The password string to evaluate.
  ///
  /// Returns:
  /// - A string describing the entropy level and estimated crack time.
  String entropyLabel(String password) {
    final entropy = calculateEntropy(password);
    if (entropy < 28) return 'Very Weak (instantly crackable)';
    if (entropy < 36) return 'Weak (crackable in minutes)';
    if (entropy < 60) return 'Reasonable (crackable in hours/days)';
    if (entropy < 128) return 'Strong (crackable in years)';
    return 'Very Strong (practically uncrackable)';
  }
}
