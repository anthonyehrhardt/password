#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

char* generate_password(int length, int use_digits, int use_special_chars) {
    const char* characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    if (use_digits) {
        characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    }
    if (use_special_chars) {
        characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_=+[]{}|;:,.<>?";
    }

    char* password = (char*)malloc((length + 1) * sizeof(char));
    if (!password) {
        perror("Memory allocation failed");
        exit(EXIT_FAILURE);
    }

    srand(time(NULL));
    for (int i = 0; i < length; i++) {
        int random_index = rand() % strlen(characters);
        password[i] = characters[random_index];
    }
    password[length] = '\0';

    return password;
}

int main() {
    int password_length;
    printf("Enter desired password length: ");
    if (scanf("%d", &password_length) != 1) {
        printf("Invalid input. Using default password length of 12.\n");
        password_length = 12;
    }

    char* password = generate_password(password_length, 1, 1);
    printf("Generated Password: %s\n", password);

    free(password);
    return 0;
}
