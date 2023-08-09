def generate_password(length, use_digits, use_special_chars)
    characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    characters += "0123456789" if use_digits
    characters += "!@#$%^&*()-_=+[]{}|;:,.<>?" if use_special_chars

    password = Array.new(length) { characters.chars.sample }.join
    password
end

print "Enter desired password length: "
password_length = gets.chomp.to_i

password = generate_password(password_length, true, true)
puts "Generated Password: #{password}"
