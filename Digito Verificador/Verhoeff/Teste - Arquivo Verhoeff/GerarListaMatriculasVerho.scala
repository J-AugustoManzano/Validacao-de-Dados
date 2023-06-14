import java.io.PrintWriter

object Main {
    val verhoeffD = Array(
      Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9),
      Array(1, 2, 3, 4, 0, 6, 7, 8, 9, 5),
      Array(2, 3, 4, 0, 1, 7, 8, 9, 5, 6),
      Array(3, 4, 0, 1, 2, 8, 9, 5, 6, 7),
      Array(4, 0, 1, 2, 3, 9, 5, 6, 7, 8),
      Array(5, 9, 8, 7, 6, 0, 4, 3, 2, 1),
      Array(6, 5, 9, 8, 7, 1, 0, 4, 3, 2),
      Array(7, 6, 5, 9, 8, 2, 1, 0, 4, 3),
      Array(8, 7, 6, 5, 9, 3, 2, 1, 0, 4),
      Array(9, 8, 7, 6, 5, 4, 3, 2, 1, 0)
    )

    val verhoeffP = Array(
      Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9),
      Array(1, 5, 7, 6, 2, 8, 3, 0, 9, 4),
      Array(5, 8, 0, 3, 7, 9, 6, 1, 4, 2),
      Array(8, 9, 1, 6, 0, 4, 3, 5, 2, 7),
      Array(9, 4, 5, 3, 1, 2, 6, 8, 7, 0),
      Array(4, 2, 8, 6, 5, 7, 3, 9, 0, 1),
      Array(2, 7, 9, 3, 8, 0, 6, 4, 1, 5),
      Array(7, 0, 4, 6, 9, 1, 3, 2, 5, 8)
    )

    val verhoeffInv = Array(0, 4, 3, 2, 1, 5, 6, 7, 8, 9)

    def gerarVerhoeff(NUMERO: String): Int = {
      var DIGITO = 0
      var POS = 0
      var NUM = 0
      var TAMANHO = NUMERO.length
      for (I <- 0 until TAMANHO) {
        POS = (I + 1) % 8
        NUM = NUMERO.charAt(TAMANHO - I - 1) - '0'
        DIGITO = verhoeffD(DIGITO)(verhoeffP(POS)(NUM))
      }
      verhoeffInv(DIGITO)
    }

  def formataMatricula(MATRICULA: Int): String = {
    f"$MATRICULA%06d"
  }

  def main(args: Array[String]): Unit = {
    val ARQUIVO = new PrintWriter("numeros.txt")

    println("GERADOR DE NUMEROS DE MATRICULA DE 000.000 ATE 999.999 COM \"DV\"")
    println("Padrao: Verhoeff")
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
      val DV = gerarVerhoeff(MATRICULA)
      ARQUIVO.println(s"${MATRICULA.substring(0, 3)}.${MATRICULA.substring(3)}-$DV")
    }

    ARQUIVO.close()

    println("\n\nSUCESSO: Arquivo gerado.\n")
  }
}
