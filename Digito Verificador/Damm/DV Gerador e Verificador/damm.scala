import scala.io.StdIn.readLine

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

  def validarDamm(NUMERO: String): Boolean = {
    var DV = 0
    for (I <- 0 until NUMERO.length) {
      DV = dammTab(DV)(NUMERO(I).toString.toInt)
    }
    DV == 0
  }

  def removerMascara(NUMERO: String): String = {
    var NUMERO_SMASC = ""
    var encontrouPrimeiroDigito = false

    for (caractere <- NUMERO) {
      if (caractere == '.') {
        encontrouPrimeiroDigito = true
      } else if (caractere.isDigit) {
        if (!encontrouPrimeiroDigito && caractere == '0') {
          // Continuar o loop se ainda não encontrou o primeiro dígito e o caractere for '0'
          ()
        } else {
          NUMERO_SMASC += caractere
        }
      }
    }

    NUMERO_SMASC
  }

  def main(args: Array[String]): Unit = {
    var entradaValida = false
    var NUMERO, NUMERO_COM_DV, NUMERO_SEM_MASCARA_DV, NUMERO_SMASC = ""
    var DV = 0

    do {
      print("Entre matricula no formato 999.999: ")
      NUMERO = readLine()
      println()
      if (NUMERO.length != 7 || NUMERO(3) != '.') {
        println()
        println("Matricula invalida. Tente novamente.")
        println()
      } else {
        entradaValida = true
      }
    } while (!entradaValida)

    NUMERO_SMASC = removerMascara(NUMERO)
    DV = gerarDamm(NUMERO_SMASC)
    println(s"Digito verificador: $DV")
    println()

    entradaValida = false
    do {
      print("Entre matricula e digito verificador no formato 999.999-9: ")
      NUMERO_COM_DV = readLine()
      println()
      if (NUMERO_COM_DV.length != 9 || NUMERO_COM_DV(3) != '.' || NUMERO_COM_DV(7) != '-') {
        println()
        println("Matricula invalida. Tente novamente.")
        println()
      } else {
        entradaValida = true
      }
    } while (!entradaValida)

    NUMERO_SEM_MASCARA_DV = removerMascara(NUMERO_COM_DV)
    if (validarDamm(NUMERO_SEM_MASCARA_DV)) {
      println("Matricula valida.")
    } else {
      println("Matricula invalida.")
    }
  }
}
