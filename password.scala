import scala.io.StdIn
import scala.util.Random

object PasswordGenerator extends App {

  def generatePassword(length: Int, useDigits: Boolean, useSpecialChars: Boolean): String = {
    val characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" +
                     (if (useDigits) "0123456789" else "") +
                     (if (useSpecialChars) "!@#$%^&*()-_=+[]{}|;:,.<>?" else "")

    val random = new Random()
    val password = new StringBuilder
    for (_ <- 1 to length) {
      val randomIndex = random.nextInt(characters.length)
      password.append(characters(randomIndex))
    }

    password.toString()
  }

  print("Enter desired password length: ")
  val passwordLength = StdIn.readInt()

  val password = generatePassword(passwordLength, useDigits = true, useSpecialChars = true)
  println(s"Generated Password: $password")
}
