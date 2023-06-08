import scala.io.StdIn.readLine
import scala.math.pow

object Main { // DecimalHezadecimal
  val LimiteMaximoDecimal: Long = 2147483647
  val LimiteMaximoHexadecimal: String = "7FFFFFFF"
  def DecimalParaHexadecimal(decimal: Long): String = {
    var resto: Long = 0
    var hexadecimal: String = ""
    var tempDecimal = decimal
    while (tempDecimal > 0) {
      resto = tempDecimal % 16
      resto match {
        case r if r >= 0 && r <= 9 =>
          hexadecimal = (r + '0').toChar.toString + hexadecimal
        case r if r >= 10 && r <= 15 =>
          hexadecimal = (r - 10 + 'A').toChar.toString + hexadecimal
      }
      tempDecimal = tempDecimal / 16
    }
    hexadecimal
  }

  def HexadecimalParaDecimal(hexadecimal: String): Long = {
    var potencia: Long = 0
    var digito: Char = ' '
    var decimal: Long = 0
    var tempHexadecimal = hexadecimal
    while (tempHexadecimal.nonEmpty) {
      digito = tempHexadecimal.last.toUpper
      digito match {
        case d if d >= '0' && d <= '9' =>
          decimal += (d - '0') * pow(16, potencia).toLong
        case d if d >= 'A' && d <= 'F' =>
          decimal += (d - 'A' + 10) * pow(16, potencia).toLong
      }
      tempHexadecimal = tempHexadecimal.dropRight(1)
      potencia += 1
    }
    decimal
  }

  def IsValidHexadecimal(hexadecimal: String): Boolean = {
    hexadecimal.forall(c => c.isDigit || (c.toUpper >= 'A' && c.toUpper <= 'F'))
  }

  def main(args: Array[String]): Unit = {
    var opcao = 0
    var decimal = 0L
    var hexadecimal = ""
    do {
      println("===============================")
      println(" CONVERSOR DECIMAL-HEXADECIMAL ")
      println("===============================")
      println()
      println("1 - Converter decimal para hexadecimal")
      println("2 - Converter hexadecimal para decimal")
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
            println(s"Valor em hexadecimal: ${DecimalParaHexadecimal(decimal)}")
        case 2 =>
          println()
          print(s"Digite um numero hexadecimal (ate $LimiteMaximoHexadecimal): ")
          hexadecimal = readLine()
          if (!IsValidHexadecimal(hexadecimal))
            println("Valor hexadecimal invalido.")
          else if (HexadecimalParaDecimal(hexadecimal) > LimiteMaximoDecimal)
            println("Valor hexadecimal fora do limite permitido.")
          else
            println(s"Valor em decimal: ${HexadecimalParaDecimal(hexadecimal)}")
        case 0 =>
        case _ => println("Opcao invalida. Tente novamente.")
      }
      println()
    } while (opcao != 0)
  }
}
