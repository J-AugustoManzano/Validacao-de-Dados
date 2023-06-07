import scala.io.StdIn.readLine

object Main {
  def main(args: Array[String]): Unit = {

    var TEXTO: String = ""
    var VALIDACAO: Boolean = false

    while (true) {
      print("Entre uma cadeia alfabética: ")
      TEXTO = readLine()
      VALIDACAO = true

      for (I <- 0 until TEXTO.length) {
        val CARACTERE = TEXTO.charAt(I)
        if (!(CARACTERE.isLetter || CARACTERE.isWhitespace)) {
          VALIDACAO = false
        }
      }

      if (VALIDACAO == false) {
        println("Entrada inválida. Por favor, tente novamente.")
      } else {
        println(s"Você informou a cadeia: $TEXTO")
        return
      }
    }
  }
}
