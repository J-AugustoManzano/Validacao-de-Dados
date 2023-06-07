import scala.io.StdIn

object Main {
  def main(args: Array[String]): Unit = {
    print("Digite um texto .....: ")
    val texto = StdIn.readLine()

    val textoMaiusculo = texto.toUpperCase
    val textoMinusculo = texto.toLowerCase

    print("Texto em maiusculo ..: ")
    println(textoMaiusculo)

    print("Texto em minusculo ..: ")
    println(textoMinusculo)
  }
}
