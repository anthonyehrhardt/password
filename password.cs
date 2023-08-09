using System;

namespace PasswordGenerator
{
    class Program
    {
        static Random rand = new Random();

        static string GeneratePassword(int length, bool useDigits, bool useSpecialChars)
        {
            string characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
            if (useDigits)
            {
                characters += "0123456789";
            }
            if (useSpecialChars)
            {
                characters += "!@#$%^&*()-_=+[]{}|;:,.<>?";
            }

            char[] password = new char[length];
            for (int i = 0; i < length; i++)
            {
                int randomIndex = rand.Next(characters.Length);
                password[i] = characters[randomIndex];
            }

            return new string(password);
        }

        static void Main(string[] args)
        {
            Console.Write("Enter desired password length: ");
            int passwordLength;
            if (!int.TryParse(Console.ReadLine(), out passwordLength) || passwordLength <= 0)
            {
                Console.WriteLine("Invalid input. Using default password length of 12.");
                passwordLength = 12;
            }

            string password = GeneratePassword(passwordLength, true, true);
            Console.WriteLine("Generated Password: " + password);
        }
    }
}
