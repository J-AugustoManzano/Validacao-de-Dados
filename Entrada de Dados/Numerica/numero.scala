import scala.io.StdIn

object Main {
  def main(args: Array[String]): Unit = {

    var NUMERO: Int = 0
    var NUMERO_AUX: String = ""

    do {
      print("Entre um numero: ")
      NUMERO_AUX = StdIn.readLine()
      try {
        NUMERO = NUMERO_AUX.toInt
      } catch {
        case _: NumberFormatException =>
          println("Entrada invalida. Por favor, tente novamente.")
      }
    } while (NUMERO == 0)
    println(s"Voce informou o numero: $NUMERO")
  }
}
