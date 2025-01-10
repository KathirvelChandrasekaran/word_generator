import 'dart:math';

/// A utility class for generating and validating passwords.
class PasswordGenerator {
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
}
