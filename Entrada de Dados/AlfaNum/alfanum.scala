import scala.io.StdIn.readLine
import scala.util.control.Breaks._

object Main {
  def VALIDA_HEXA(VALOR: String): Boolean = {
    for (c <- VALOR) {
      val CARACTERE = c.toUpper
      if (!(Character.isDigit(CARACTERE) || (CARACTERE >= 'A' && CARACTERE <= 'F')))
        return false
    }
    true
  }

  def main(args: Array[String]): Unit = {
    println()
    var VALOR_HEX = ""
    var sairLoop = false
    breakable {
      do {
        print("Entre valor hexadecimal de 4 caracteres: ")
        VALOR_HEX = readLine()
        if (VALOR_HEX.length != 4) {
          println("Valor invalido, deve ter exatamente 4 caracteres.\n")
        } else if (!VALIDA_HEXA(VALOR_HEX)) {
          println("Valor invalido, apenas caracteres [0-9] e [A-F].\n")
        } else {
          sairLoop = true
          break
        }
      } while (!sairLoop)
    }
    VALOR_HEX = VALOR_HEX.toUpperCase()
    println("Valor fornecido: " + VALOR_HEX + "\n")
  }
}
