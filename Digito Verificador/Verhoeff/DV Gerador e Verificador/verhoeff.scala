object Main {
  def main(args: Array[String]): Unit = {
    // Tabela de multiplicacao >>> d(j, k)
    // k = 10 colunas
    // j = 10 linhas
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

    // Tabela de permutacao >>> p(pos, num)
    // num = 10 colunas
    // pos =  8 linhas (mod 8)
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

    // Tabela de inversao >>> inv(j)
    // j = 8 colunas
    //     1 linha
    val verhoeffInv = Array(0, 4, 3, 2, 1, 5, 6, 7, 8, 9)

    // Gerar digito verificador no padrao Verhoeff
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

    // Validar digito verificador no padrao Verhoeff
    // Ultimo digito do numero fornecido
    def validarVerhoeff(NUMERO: String): Boolean = {
      var DIGITO = 0
      var POS = 0
      var NUM = 0
      var TAMANHO = NUMERO.length
      for (I <- 0 until TAMANHO) {
        POS = I % 8
        NUM = NUMERO.charAt(TAMANHO - I - 1) - '0'
        DIGITO = verhoeffD(DIGITO)(verhoeffP(POS)(NUM))
      }
      DIGITO == 0
    }
    // Remove a mascara do numero
    def removerMascara(NUMERO: String): String = {
      var NUMERO_SMASC = ""
      var ENCONTROU_PRIMEIRO_DIGITO = false
      for (CARACTERE <- NUMERO) {
        if (CARACTERE == '.')
          ENCONTROU_PRIMEIRO_DIGITO = true
        else if (Character.isDigit(CARACTERE)) {
          if (!ENCONTROU_PRIMEIRO_DIGITO && CARACTERE == 48)
            ()
          else
            NUMERO_SMASC += CARACTERE
        }
      }
      NUMERO_SMASC
    }

    var DV = 0
    var entradaValida = false
    var NUMERO = ""
    var NUMERO_COM_DV = ""
    var NUMERO_SEM_MASCARA_DV = ""
    var NUMERO_SMASC = ""

    while (!entradaValida) {
      print("Entre matricula no formato 999.999: ")
      NUMERO = scala.io.StdIn.readLine()
      println()
      if (NUMERO.length != 7 || NUMERO.charAt(3) != '.') {
        println()
        println("Matricula invalida. Tente novamente.")
        println()
      } else
        entradaValida = true
    }

    NUMERO_SMASC = removerMascara(NUMERO)
    DV = gerarVerhoeff(NUMERO_SMASC)
    println("Digito verificador: " + DV)
    println()

    entradaValida = false
    while (!entradaValida) {
      print("Entre matricula e digito verificador no formato 999.999-9: ")
      NUMERO_COM_DV = scala.io.StdIn.readLine()
      println()
      if (NUMERO_COM_DV.length != 9 || NUMERO_COM_DV.charAt(3) != '.' || NUMERO_COM_DV.charAt(7) != '-') {
        println()
        println("Matricula invalida. Tente novamente.")
        println()
      } else
        entradaValida = true
    }

    NUMERO_SEM_MASCARA_DV = removerMascara(NUMERO_COM_DV)
    if (validarVerhoeff(NUMERO_SEM_MASCARA_DV))
      println("Matricula valida.")
    else
      println("Matricula invalida.")
  }
}
