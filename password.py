import random
import string

def generate_password(length=12, use_digits=True, use_special_chars=True):
    characters = string.ascii_letters
    if use_digits:
        characters += string.digits
    if use_special_chars:
        characters += string.punctuation

    password = ''.join(random.choice(characters) for _ in range(length))
    return password

# Get user input for password length
try:
    password_length = int(input("Enter desired password length: "))
except ValueError:
    print("Invalid input. Using default password length of 12.")
    password_length = 12

# Example usage
password = generate_password(length=password_length, use_digits=True, use_special_chars=True)
print("Generated Password:", password)
