import 'dart:math';

class PasswordGenerator {
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
