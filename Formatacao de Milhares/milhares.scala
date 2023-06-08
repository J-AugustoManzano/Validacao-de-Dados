import scala.io.StdIn

object Main { // SeparacaoMilhares
def formataValor(valor: String): String = {
    var inteiro, decimal: String = ""
    var i: Int = 0
    // Verifica se o valor possui parte decimal
    if (valor.contains(".")) {
      inteiro = valor.substring(0, valor.indexOf("."))
      decimal = valor.substring(valor.indexOf(".") + 1)
    } else {
      inteiro = valor
      decimal = "00"
    }
    // Formata a parte inteira
    var valorFormatado: String = ""
    for (i <- inteiro.length - 1 to 0 by -1) {
      valorFormatado = inteiro(i) + valorFormatado
      if (i > 0 && (inteiro.length - i) % 3 == 0)
        valorFormatado = "." + valorFormatado
    }
    // Concatena a parte decimal
    valorFormatado += "," + decimal
    valorFormatado
  }
  
  def main(args: Array[String]): Unit = {
    print("Digite um valor real: ")
    val valor = StdIn.readLine()
    val valorFormatado = formataValor(valor)
    println(s"Valor formatado: $valorFormatado")
  }
}
