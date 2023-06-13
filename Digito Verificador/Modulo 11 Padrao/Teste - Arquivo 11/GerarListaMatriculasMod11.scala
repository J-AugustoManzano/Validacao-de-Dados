import java.io._

object Main {
  def removerCaractere(CADEIA: Array[Char], CARACTERE: Char): Unit = {
    var POS1 = 0
    var POS2 = 0
    while (CADEIA(POS1) != 0) {
      CADEIA(POS2) = CADEIA(POS1)
      POS2 += (if (CADEIA(POS2) != CARACTERE) 1 else 0)
      POS1 += 1
    }
    CADEIA(POS2) = 0
  }

  def mod11(MATRIC_CPT: Array[Char]): Char = {
    val MATRIC_SPT = new Array[Char](8)
    val MATRIC_INT = new Array[Int](6)
    var SOMA = 0
    var DV: Char = ' '
    Array.copy(MATRIC_CPT, 0, MATRIC_SPT, 0, MATRIC_SPT.length)
    removerCaractere(MATRIC_SPT, '.')
    for (I <- 0 to 5)
      MATRIC_INT(I) = MATRIC_SPT(I) - 48
    for (I <- 0 to 5)
      SOMA += MATRIC_INT(I) * (7 - I)
    if ((SOMA % 11) == 0)
      DV = 48.toChar // DV = 0
    else if ((SOMA % 11) == 1)
      DV = 88.toChar // DV = X
    else if ((SOMA % 11) == 10)
      DV = 49.toChar // DV = 1
    else
      DV = (11 - (SOMA % 11) + 48).toChar
    DV
  }

  def main(args: Array[String]): Unit = {
    val MATRICULA = new Array[Char](12)
    val ARQUIVO = new PrintWriter(new FileWriter("numeros.txt"))

    println("GERADOR DE NUMEROS DE MATRICULA DE 000.000 ATE 999.999 COM \"DV\"")
    println("Padrao: Modulo 11")
    println("---------------------------------------------------------------")
    println()

    if (ARQUIVO == null) {
      System.err.println("Erro ao abrir o arquivo.")
      println("Programa encerrado.")
      println()
      return
    }

    print("Aguarde arquivo sendo gerado... ")

    for (I <- 0 to 999999) {
      val MATRICULA_STR = "%06d".format(I)
      MATRICULA_STR.getChars(0, MATRICULA_STR.length, MATRICULA, 0)
      val DV = mod11(MATRICULA)
      val MATRICULA_FORMATADA = "%s.%s-%c".format(MATRICULA_STR.substring(0, 3), MATRICULA_STR.substring(3), DV)
      ARQUIVO.println(MATRICULA_FORMATADA)
    }

    ARQUIVO.close()

    println("\n\nSUCESSO: Arquivo gerado.\n")
  }
}
