import java.io.PrintWriter

object Main {
  def formataMatricula(matricula: Int): String = {
    f"$matricula%06d"
  }

  def mod10(matricula: String): Int = {
    var soma = 0
    for (i <- 0 until 6) {
      val digito = matricula(i) - '0'
      if (i % 2 != 0 && digito * 2 > 9)
        soma += digito * 2 - 9
      else if (i % 2 != 0 && digito * 2 <= 9)
        soma += digito * 2
      else
        soma += digito
    }
    val dv = if (soma % 10 == 0) 0 else 10 - soma % 10
    dv
  }

  def main(args: Array[String]): Unit = {
    val arquivo = new PrintWriter("numeros.txt")

    println("GERADOR DE NUMEROS DE MATRICULA DE 000.000 ATE 999.999 COM \"DV\"")
    println("Padrao: Modulo 10")
    println("---------------------------------------------------------------")
    println()

    if (arquivo == null) {
      Console.err.println("Erro ao abrir o arquivo.")
      println("Programa encerrado.")
      return
    }

    print("Aguarde arquivo sendo gerado... ")

    for (i <- 0 to 999999) {
      val matricula = formataMatricula(i)
      val dv = mod10(matricula)
      arquivo.println(s"${matricula.substring(0, 3)}.${matricula.substring(3)}-$dv")
    }

    arquivo.close()

    println("\n\nSUCESSO: Arquivo gerado.\n")
  }
}
