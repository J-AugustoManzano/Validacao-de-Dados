import scala.io.StdIn.readLine

object Main { // DecimalBinario

  val LimiteMaximoDecimal: Long = 2147483647
  val LimiteMaximoBinario: String = "1111111111111111111111111111111"

  def decimalParaBinario(decimal: Long): String = {
    var binario = ""
    var tempDecimal = decimal
    while (tempDecimal > 0) {
      val resto = (tempDecimal % 2).toString
      binario = resto + binario
      tempDecimal /= 2
    }
    while (binario.length < 32) {
      binario = "0" + binario
    }
    binario
  }

  def binarioParaDecimal(binario: String): Long = {
    var valor = 0L
    for (i <- binario.length - 1 to 0 by -1) {
      if (binario(i) == '1') {
        val potencia = binario.length - 1 - i
        valor += Math.pow(2, potencia).toLong
      }
    }
    valor
  }

  def isValidBinario(binario: String): Boolean = {
    binario.forall(c => c == '0' || c == '1')
  }

  def main(args: Array[String]): Unit = {
    var opcao = 0
    var decimal = 0L
    var binario = ""
    do {
      println("===========================")
      println(" CONVERSOR DECIMAL-BINARIO ")
      println("===========================")
      println()
      println("1 - Converter decimal para binario")
      println("2 - Converter binario para decimal")
      println("0 - Sair")
      println()
      print("Digite a opcao desejada: ")
      opcao = readLine().toInt
      opcao match {
        case 1 =>
          println()
          print(s"Digite um numero decimal (ate $LimiteMaximoDecimal): ")
          decimal = readLine().toLong
          if (decimal > LimiteMaximoDecimal)
            println("Valor decimal fora do limite permitido.")
          else
            println(s"Valor em binario: ${decimalParaBinario(decimal)}")
        case 2 =>
          println()
          print(s"Digite um numero binario (ate $LimiteMaximoBinario): ")
          binario = readLine()
          if (!isValidBinario(binario))
            println("Valor binario invalido.")
          else if (binario.length > LimiteMaximoBinario.length)
            println("Valor binario fora do limite permitido.")
          else
            println(s"Valor em decimal: ${binarioParaDecimal(binario)}")
        case 0 =>
        case _ => println("Opcao invalida. Tente novamente.")
      }
      println()
    } while (opcao != 0)
  }
}
