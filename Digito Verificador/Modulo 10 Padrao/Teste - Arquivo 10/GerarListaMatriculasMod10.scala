import java.io.PrintWriter

object Main {
  def formataMatricula(MATRICULA: Int): String = {
    f"$MATRICULA%06d"
  }

  def mod10(MATRICULA: String): Int = {
    var SOMA = 0
    for (i <- 0 until 6) {
      val DIGITO = MATRICULA(i) - '0'
      if (i % 2 != 0 && DIGITO * 2 > 9)
        SOMA += DIGITO * 2 - 9
      else if (i % 2 != 0 && DIGITO * 2 <= 9)
        SOMA += DIGITO * 2
      else
        SOMA += DIGITO
    }
    val DV = if (SOMA % 10 == 0) 0 else 10 - SOMA % 10
    DV
  }

  def main(args: Array[String]): Unit = {
    val ARQUIVO = new PrintWriter("numeros.txt")

    println("GERADOR DE NUMEROS DE MATRICULA DE 000.000 ATE 999.999 COM \"DV\"")
    println("Padrao: Modulo 10")
    println("---------------------------------------------------------------")
    println()

    if (ARQUIVO == null) {
      Console.err.println("Erro ao abrir o ARQUIVO.")
      println("Programa encerrado.")
      return
    }

    print("Aguarde ARQUIVO sendo gerado... ")

    for (I <- 0 to 999999) {
      val MATRICULA = formataMatricula(I)
      val DV = mod10(MATRICULA)
      ARQUIVO.println(s"${MATRICULA.substring(0, 3)}.${MATRICULA.substring(3)}-$DV")
    }

    ARQUIVO.close()

    println("\n\nSUCESSO: Arquivo gerado.\n")
  }
}
