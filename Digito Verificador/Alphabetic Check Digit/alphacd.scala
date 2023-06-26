object Main {
  def main(args: Array[String]): Unit = {
    import scala.io.StdIn.readLine

    object TabelaValores {

      def AlphaCD(valor: String): Char = {
        var soma = 0
        var proximo = 0
        val digitos = Array.ofDim[Int](valor.length)

        for (i <- 0 until valor.length) {
          val caractere = valor(i).toUpper
          if (caractere == ' ' || caractere == '.' || caractere == '-') {
            // Ignorar caracteres especiais
          } else if (caractere >= '0' && caractere <= '9') {
            digitos(valor.length - i - 1) = caractere.toInt - '0'.toInt
          } else if (caractere >= 'A' && caractere <= 'Z') {
            digitos(valor.length - i - 1) = (caractere.toInt - 'A'.toInt + 1) % 9
          }

          if ((i + 1) % 2 == 0) {
            digitos(valor.length - i - 1) *= 2
            if (digitos(valor.length - i - 1) >= 10) {
              digitos(valor.length - i - 1) = (digitos(valor.length - i - 1) / 10) + (digitos(valor.length - i - 1) % 10)
            }
          }

          soma += digitos(valor.length - i - 1)
        }

        if (soma % 10 == 0) {
          proximo = soma
        } else {
          proximo = ((soma / 10) + 1) * 10
        }

        (proximo - soma + '0').toChar
      }

      def trimString(str: String): String = {
        var i = 0
        while (i < str.length && str(i) == ' ') {
          i += 1
        }
        if (i < str.length) {
          var j = str.length - 1
          while (str(j) == ' ') {
            j -= 1
          }
          str.substring(i, j + 1)
        } else {
          ""
        }
      }

      def run(): Unit = {
        println("ALPHABETIC CHECK DIGIT")
        println("======================")
        println()

        print("Entre matricula alfanumerica (tamanho livre): ")
        val entrada = readLine()
        println("Dígito verificador para " + entrada + " = " + AlphaCD(entrada))
        println()

        print("Entre matricula e dígito verificador (juntos): ")
        val matricula = readLine()
        val digitoVerificador = matricula.charAt(matricula.length - 1)
        val matriculaSemDigito = trimString(matricula.substring(0, matricula.length - 1))

        if (AlphaCD(matriculaSemDigito) == digitoVerificador) {
          println("Numero valido.")
        } else {
          println("Numero invalido.")
        }
      }
    }

    TabelaValores.run()
  }
}
