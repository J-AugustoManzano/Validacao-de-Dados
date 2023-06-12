// ValidarMatricula
object Main {
  import scala.io.StdIn.readLine

  def validarMatricula(MATRICULA: String): Boolean = {
    if (MATRICULA.length != 9)
      return false
    if (!(MATRICULA(0).isDigit) || !(MATRICULA(1).isDigit) || !(MATRICULA(2).isDigit))
      return false
    if (MATRICULA(3) != '.')
      return false
    if (!(MATRICULA(4).isDigit) || !(MATRICULA(5).isDigit) || !(MATRICULA(6).isDigit))
      return false
    if (MATRICULA(7) != '-')
      return false
    if (!(MATRICULA(8).isDigit))
      return false
    true
  }

  def removerCaractere(CADEIA: StringBuilder, CARACTERE: Char): Unit = {
    var POS1 = 0
    var POS2 = 0
    while (POS1 < CADEIA.length) {
      if (CADEIA(POS1) != CARACTERE) {
        CADEIA(POS2) = CADEIA(POS1)
        POS2 += 1
      }
      POS1 += 1
    }
    CADEIA.setLength(POS2)
  }

  def mod10Check(MATRICULA: String): Int = {
    val MATRIC_INT = Array.ofDim[Int](6)
    var SOMA = 0
    var DV = 0
    for (i <- 0 until 6)
      MATRIC_INT(i) = MATRICULA(i).asDigit
    for (i <- 0 until 6) {
      if ((i + 1) % 2 == 0) {
        if (MATRIC_INT(i) * 2 > 9)
          SOMA += MATRIC_INT(i) * 2 - 9
        else
          SOMA += MATRIC_INT(i) * 2
      } else {
        SOMA += MATRIC_INT(i)
      }
    }
    DV = (10 - (SOMA % 10)) % 10
    DV
  }

  def main(args: Array[String]): Unit = {
    var MATRIC_CPT = ""
    var MATRIC_SPT = new StringBuilder
    val MATRIC_INT = Array.ofDim[Int](7)
    var DVC = 0
    var DVE = 0

    do {
      print("Informe a matricula no formato 999.999-9: ")
      MATRIC_CPT = readLine()

      if (!validarMatricula(MATRIC_CPT)) {
        println()
        println("Entrada invalida, tente novamente.")
        println()
        println()
      }
    } while (!validarMatricula(MATRIC_CPT))

    MATRIC_SPT.appendAll(MATRIC_CPT)
    removerCaractere(MATRIC_SPT, '.')
    removerCaractere(MATRIC_SPT, '-')
    DVC = mod10Check(MATRIC_SPT.toString)

    for (i <- 0 until 7)
      MATRIC_INT(i) = MATRIC_SPT(i).asDigit
    DVE = MATRIC_INT(6)

    println()
    if (DVC == DVE)
      println("Matricula valida.")
    else
      println("Matricula invalida.")
    println()

    print("Pressione <Enter> para encerrar... ")
    readLine()
  }
}
