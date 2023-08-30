import 'dart:io';
import 'dart:math';

String generatePassword(int length, bool useDigits, bool useSpecialChars) {
  String characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
  if (useDigits) {
    characters += "0123456789";
  }
  if (useSpecialChars) {
    characters += "!@#\$%^&*()-_=+[]{}|;:,.<>?";
  }

  String password = '';
  Random random = Random();
  for (int i = 0; i < length; i++) {
    int randomIndex = random.nextInt(characters.length);
    password += characters[randomIndex];
  }

  return password;
}

void main() {
  stdout.write("Enter desired password length: ");
  String? input = stdin.readLineSync();
  int passwordLength = 12; // Default length

  try {
    passwordLength = int.parse(input!);
  } catch (e) {
    print("Invalid input. Using default password length of 12.");
  }

  String password = generatePassword(passwordLength, true, true);
  print("Generated Password: $password");
}
