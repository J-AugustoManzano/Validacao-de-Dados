import scala.math.pow

object Main { // DecimalOctal
  val LimiteMaximoDecimal: Long = 2147483647
  val LimiteMaximoOctal: Long = 17777777777L
  def decimalParaOctal(decimal: Long): Long = {
    var octal: Long = 0
    var potencia: Long = 1
    var numDecimal = decimal
    while (numDecimal > 0) {
      val resto: Long = numDecimal % 8
      octal += resto * potencia
      numDecimal = numDecimal / 8
      potencia = potencia * 10
    }
    octal
  }

  def octalParaDecimal(octal: Long): Long = {
    var decimal: Long = 0
    var potencia: Long = 0
    var numOctal = octal
    while (numOctal > 0) {
      val digito: Long = numOctal % 10
      decimal += digito * pow(8, potencia).toLong
      numOctal = numOctal / 10
      potencia += 1
    }
    decimal
  }

  def isValidOctal(octal: Long): Boolean = {
    var numOctal = octal
    while (numOctal > 0) {
      if (numOctal % 10 > 7) {
        return false
      }
      numOctal = numOctal / 10
    }
    true
  }

  def main(args: Array[String]): Unit = {
    var opcao: Int = -1
    var decimal: Long = 0
    var octal: Long = 0
    while (opcao != 0) {
      println("=========================")
      println(" CONVERSOR DECIMAL-OCTAL ")
      println("=========================")
      println()
      println("1 - Converter decimal para octal")
      println("2 - Converter octal para decimal")
      println("0 - Sair")
      println()
      print("Digite a opcao desejada: ")
      opcao = scala.io.StdIn.readInt()
      opcao match {
        case 1 =>
          println()
          print(s"Digite um numero decimal (ate $LimiteMaximoDecimal): ")
          decimal = scala.io.StdIn.readLong()
          if (decimal > LimiteMaximoDecimal)
            println("Valor decimal fora do limite permitido.")
          else
            println(s"Valor em octal: ${decimalParaOctal(decimal)}")
        case 2 =>
          println()
          print(s"Digite um numero octal (ate $LimiteMaximoOctal): ")
          octal = scala.io.StdIn.readLong()
          if (!isValidOctal(octal))
            println("Valor octal invalido.")
          else if (octal > LimiteMaximoOctal)
            println("Valor octal fora do limite permitido.")
          else
            println(s"Valor em decimal: ${octalParaDecimal(octal)}")
        case 0 =>
          // Sair do loop
        case _ =>
          println("Opcao invalida. Digite novamente.")
      }
      println()
    }
  }
}
