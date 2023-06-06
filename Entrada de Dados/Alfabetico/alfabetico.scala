import scala.io.StdIn.readLine

object Main {
  def main(args: Array[String]): Unit = {
    
    var TEXTO: String = ""
    var VALIDACAO: Boolean = false

    while (true) {
      print("Entre uma cadeia alfabetica: ")
      TEXTO = readLine()
      VALIDACAO = true
      for (I <- 0 until TEXTO.length) {
        val CARACTERE = TEXTO.charAt(I)
        if (!(CARACTERE.isUpper || CARACTERE.isLower || 
              CARACTERE == ' ')) {
          VALIDACAO = false
        }
      }
      if (VALIDACAO == false) {
        println("Entrada invalida. Por favor, tente novamente.")
      }
    }
    println(s"Voce informou a cadeia: $TEXTO")
  }
}
