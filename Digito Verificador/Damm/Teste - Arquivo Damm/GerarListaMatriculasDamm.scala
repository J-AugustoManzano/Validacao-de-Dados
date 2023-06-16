import java.io.PrintWriter

object Main {
  val dammTab: Array[Array[Int]] = Array(
    Array(0, 3, 1, 7, 5, 9, 8, 6, 4, 2),
    Array(7, 0, 9, 2, 1, 5, 4, 8, 6, 3),
    Array(4, 2, 0, 6, 8, 7, 1, 3, 5, 9),
    Array(1, 7, 5, 0, 9, 8, 3, 4, 2, 6),
    Array(6, 1, 2, 3, 0, 4, 5, 9, 7, 8),
    Array(3, 6, 7, 4, 2, 0, 9, 5, 8, 1),
    Array(5, 8, 6, 9, 7, 2, 0, 1, 3, 4),
    Array(8, 9, 4, 5, 3, 6, 2, 0, 1, 7),
    Array(9, 4, 3, 8, 6, 1, 7, 2, 0, 5),
    Array(2, 5, 8, 1, 4, 3, 6, 7, 9, 0)
  )

  def gerarDamm(NUMERO: String): Int = {
    var DV = 0
    for (I <- 0 until NUMERO.length) {
      DV = dammTab(DV)(NUMERO(I).toString.toInt)
    }
    DV
  }


  def formataMatricula(MATRICULA: Int): String = {
    f"$MATRICULA%06d"
  }

  def main(args: Array[String]): Unit = {
    val ARQUIVO = new PrintWriter("numeros.txt")

    println("GERADOR DE NUMEROS DE MATRICULA DE 000.000 ATE 999.999 COM \"DV\"")
    println("Padrao: Damm")
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
      val DV = gerarDamm(MATRICULA)
      ARQUIVO.println(s"${MATRICULA.substring(0, 3)}.${MATRICULA.substring(3)}-$DV")
    }

    ARQUIVO.close()

    println("\n\nSUCESSO: Arquivo gerado.\n")
  }
}
