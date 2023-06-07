import scala.io.StdIn
import scala.util.control.Breaks._ 

object Main {
  def main(args: Array[String]): Unit = {
	  
    var NUMERO: Int = 0
    var NUMERO_AUX: String = ""

    breakable {
      do {
        print("Entre com um numero: ")
        NUMERO_AUX = StdIn.readLine()
        try {
          NUMERO = NUMERO_AUX.toInt
          if (NUMERO != 0) {break()}
        } catch {
          case _: NumberFormatException =>
            println("Entrada invalida. Por favor, tente novamente.")
        }
      } while (true)
    }
    println(s"Voce informou o número: $NUMERO")
  }
}
