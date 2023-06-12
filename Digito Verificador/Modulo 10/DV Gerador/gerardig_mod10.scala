// GerarMatricula
object Main {
  def main(args: Array[String]): Unit = {
    import scala.io.StdIn.readLine

    def validarMatricula(MATRICULA: String): Boolean = {
      if (MATRICULA.length != 7)
        return false
      if (!MATRICULA(0).isDigit || !MATRICULA(6).isDigit)
        return false
      if (MATRICULA(3) != '.')
        return false
      for (I <- 1 to 2)
        if (!MATRICULA(I).isDigit || !MATRICULA(I + 4).isDigit)
          return false
      true
    }

    def removerCaractere(CADEIA: StringBuilder, CARACTERE: Char): Unit = {
      val INDICES = CADEIA.indices.filter(I => CADEIA(I) == CARACTERE)
      for (I <- INDICES.reverse)
        CADEIA.deleteCharAt(I)
    }

    def mod10(MATRICULA: StringBuilder): Int = {
      val MATRIC_INT = new Array[Int](6)
      val SOMA = {
        for (I <- 0 to 5)
          MATRIC_INT(I) = MATRICULA(I) - '0'
        var SOMA = 0
        for (I <- 0 to 5) {
          if (I % 2 != 0 && MATRIC_INT(I) * 2 > 9)
            SOMA += MATRIC_INT(I) * 2 - 9
          else if (I % 2 != 0 && MATRIC_INT(I) * 2 <= 9)
            SOMA += MATRIC_INT(I) * 2
          if (I % 2 == 0)
            SOMA += MATRIC_INT(I)
        }
        SOMA
      }
      val DV = (SOMA / 10 + 1) * 10 - SOMA
      DV
    }

    val ENTRADA = new java.util.Scanner(System.in)
    var MATRIC_CPT: String = ""
    var MATRIC_SPT: StringBuilder = new StringBuilder
    var DV: Int = 0

    do {
      print("Informe matricula no formato 999.999: ")
      MATRIC_CPT = ENTRADA.nextLine()
      if (!validarMatricula(MATRIC_CPT)) {
        println()
        println("Matricula invalida. Tente novamente.")
        println("\n")
      }
    } while (!validarMatricula(MATRIC_CPT))
    
    MATRIC_SPT.append(MATRIC_CPT)
    removerCaractere(MATRIC_SPT, '.')
    DV = mod10(MATRIC_SPT)
    println()
    println("Matricula com DV = " + MATRIC_CPT + "-" + DV)
    println()
    print("Tecle <Enter> para encerrar... ")
    ENTRADA.nextLine()
    ENTRADA.close()
  }
}
