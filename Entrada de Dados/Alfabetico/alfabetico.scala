import scala.io.StdIn.readLine

object Main {
  def main(args: Array[String]): Unit = {

    var TEXTO: String = ""
    var VALIDACAO: Boolean = false
    var CARACTERE: Char = ' '

    while (true) {
      print("Entre uma cadeia alfabEtica: ")
      TEXTO = readLine()
      VALIDACAO = false
      for (I <- 0 until TEXTO.length) {
        CARACTERE = TEXTO.charAt(I)
        if (CARACTERE.isLetter || CARACTERE.isWhitespace) {
          VALIDACAO = true
        }
      }
      if (VALIDACAO == false) {
        println("Entrada invAlida. Por favor, tente novamente.")
      } else {
        println(s"VocE informou a cadeia: $TEXTO")
        return
      }
    }
  }
}
