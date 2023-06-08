object Main { // DecimalRomano

  val AlgarismosRomanos = Array("I", "IV", "V", "IX", "X", "XL", "L", "XC", "C", "CD", "D", "CM", "M")
  val ValoresDecimais = Array(1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000)
  val LimiteMaximoDecimal = 3999
  val LimiteMaximoRomano = "MMMCMXCIX"

  def decimalParaRomano(decimal: Int): String = {
    var i = 12
    var romano = ""
    var num = decimal
    while (num > 0) {
      if (num >= ValoresDecimais(i)) {
        romano += AlgarismosRomanos(i)
        num -= ValoresDecimais(i)
      } else {
        i -= 1
      }
    }
    romano
  }

  def romanoParaDecimal(romano: String): Int = {
    var resultado = 0
    var i = 0
    val romanoUpper = romano.toUpperCase()
    while (i < romanoUpper.length) {
      val algarismoAtual = romanoUpper(i).toString
      val proximoAlgarismo = if (i + 1 < romanoUpper.length) romanoUpper(i + 1).toString else ""
      val valorAtual = obterValorDecimal(algarismoAtual)
      val valorProximo = obterValorDecimal(proximoAlgarismo)
      if (valorProximo > valorAtual) {
        resultado += valorProximo - valorAtual
        i += 2
      } else {
        resultado += valorAtual
        i += 1
      }
    }
    resultado
  }

  def obterValorDecimal(algarismoRomano: String): Int = {
    for (i <- 0 until AlgarismosRomanos.length) {
      if (AlgarismosRomanos(i) == algarismoRomano) {
        return ValoresDecimais(i)
      }
    }
    0
  }

  def main(args: Array[String]): Unit = {
    var opcao = 0
    var decimal = 0
    var romano = ""
    do {
      println("==========================")
      println(" CONVERSOR DECIMAL-ROMANO ")
      println("==========================")
      println()
      println("1 - Converter decimal para romano")
      println("2 - Converter romano para decimal")
      println("0 - Sair")
      println()
      print("Digite a opcao desejada: ")
      opcao = scala.io.StdIn.readInt()
      opcao match {
        case 1 =>
          println()
          print(s"Digite um numero decimal (ate $LimiteMaximoDecimal): ")
          decimal = scala.io.StdIn.readInt()
          if (decimal < 1 || decimal > LimiteMaximoDecimal) {
            println("Valor decimal fora do limite permitido.")
          } else {
            println("Valor em algarismo romano: " + decimalParaRomano(decimal))
          }
        case 2 =>
          println()
          print(s"Digite um numero romano (ate $LimiteMaximoRomano): ")
          romano = scala.io.StdIn.readLine()
          if (romano.isEmpty || romanoParaDecimal(romano) == 0) {
            println("Valor romano fora do limite permitido.")
          } else {
            println("Valor em decimal: " + romanoParaDecimal(romano))
          }
      }
      println()
    } while (opcao != 0)
  }
}
