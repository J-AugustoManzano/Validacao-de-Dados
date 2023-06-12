object Main {
  def validarMatricula(MATRICULA: String): Boolean = {
    if (MATRICULA.length != 7) return false
    if (!MATRICULA(0).isDigit || !MATRICULA(6).isDigit) return false
    if (MATRICULA(3) != '.') return false
    for (I <- 1 to 2) {
      if (!MATRICULA(I).isDigit || !MATRICULA(I + 4).isDigit) return false
    }
    true
  }

  def removerCaractere(CADEIA: StringBuilder, CARACTERE: Char): Unit = {
    val POS1 = CADEIA.indexOf(CARACTERE)
    var POS2 = POS1
    while (POS2 != -1) {
      CADEIA.deleteCharAt(POS2)
      POS2 = CADEIA.indexOf(CARACTERE, POS1)
    }
  }

  def mod11(MATRIC_CPT: String): Char = {
    val MATRIC_SPT = new StringBuilder(MATRIC_CPT)
    removerCaractere(MATRIC_SPT, '.')
    val MATRIC_INT = new Array[Int](6)
    for (I <- 0 until 6) {
      MATRIC_INT(I) = MATRIC_SPT(I).asDigit
    }
    var SOMA = 0
    for (I <- 0 until 6) {
      SOMA += MATRIC_INT(I) * (7 - I)
    }
    val DV = (SOMA % 11) match {
      case  0 => '0'
      case  1 => 'X'
      case 10 => '1'
      case _ => (11 - (SOMA % 11) + 48).toChar
    }
    DV
  }

  def main(args: Array[String]): Unit = {
    var MATRICULA = ""
    var DV: Char = ' '

    do {
      print("Informe matricula no formato 999.999: ")
      MATRICULA = scala.io.StdIn.readLine()
      if (!validarMatricula(MATRICULA)) {
        println()
        println("Matricula invalida. Tente novamente.")
        println()
      }
    } while (!validarMatricula(MATRICULA))

    DV = mod11(MATRICULA)
    println()
    println(s"Matricula com DV = $MATRICULA-$DV")
    println()
    print("Pressione <Enter> para encerrar...")
    scala.io.StdIn.readLine()
  }
}
