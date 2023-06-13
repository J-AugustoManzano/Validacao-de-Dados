object Main {
  def main(args: Array[String]): Unit = {
    def validarMatricula(MATRICULA: String): Boolean = {
      val TAMANHO = MATRICULA.length
      if (TAMANHO != 9)
        return false
      if (MATRICULA(3) != '.' || MATRICULA(7) != '-')
        return false
      for (I <- 0 until TAMANHO)
        if (I != 3 && I != 7 && !MATRICULA(I).isDigit)
          return false
      true
    }

    def removerCaractere(CADEIA: String, CARACTERE: Char): String = {
      var POS1 = 0
      var POS2 = 0
      val NOVA_CADEIA = new StringBuilder(CADEIA)
      while (POS1 < CADEIA.length) {
        if (CADEIA(POS1) != CARACTERE) {
          NOVA_CADEIA(POS2) = CADEIA(POS1)
          POS2 += 1
        }
        POS1 += 1
      }
      NOVA_CADEIA.substring(0, POS2)
    }

    def mod11Check(MATRIC_CPT: String): Char = {
      var MATRIC_SPT = MATRIC_CPT
      val MATRIC_INT = new Array[Int](6)
      var I = 0
      var SOMA = 0
      var DV: Char = ' '

      MATRIC_SPT = removerCaractere(MATRIC_SPT, '.')
      while (I <= 5) {
        MATRIC_INT(I) = MATRIC_SPT(I).asDigit
        I += 1
      }
      I = 0
      while (I <= 5) {
        SOMA += MATRIC_INT(I) * (7 - I)
        I += 1
      }
      if (SOMA % 11 == 0)
        DV = '0'
      else if (SOMA % 11 == 1)
        DV = 'X'
      else if (SOMA % 11 == 10)
        DV = '1'
      else
        DV = (11 - (SOMA % 11) + '0').toChar
      DV
    }

    var MATRICULA: String = ""
    var DVC: Char = ' '
    var DVE: Char = ' '

    do {
      print("Informe matricula no formato 999.999-9: ")
      MATRICULA = scala.io.StdIn.readLine()
      if (!validarMatricula(MATRICULA)) {
        println()
        println("Matricula invalida. Tente novamente.")
        println()
      }
    } while (!validarMatricula(MATRICULA))

    DVC = mod11Check(MATRICULA)
    DVE = MATRICULA(8)
    println()
    if (DVC.toUpper == DVE.toUpper)
      println("Numero de matricula valido")
    else
      println("Numero de matricula invalido")
    println()
    println("Tecle <Enter> para encerrar...")
    scala.io.StdIn.readLine()
  }
}
