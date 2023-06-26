/*
PRNG .......: Lehmer (Metodo Congruencial Linear Multiplicativo)
Ano ........: 1951
Autor ......: Derrick Henry "Dick" Lehmer
*/

object Main {

  def main(args: Array[String]): Unit = {
    
    object PRNG {
      def Lehmer(seed: Long): Long = {
        var currentSeed = seed
        currentSeed = (16807 * currentSeed) % 2147483647
        currentSeed & 0x7FFFFFFF // Manter apenas os bits positivos
      }
    }

    println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
    println("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
    println("PADRAO: Lehmer")
    println("==========================================\n")
    println("    Semente: 1234        Semente: TIME")
    println("    -------------        -------------")

    var Xn1: Long = 1234
    var Xn2: Long = System.currentTimeMillis() / 1000

    for (i <- 1 to 10) {
      Xn1 = PRNG.Lehmer(Xn1)
      Xn2 = PRNG.Lehmer(Xn2)
      println(f"${Xn1}%17d        ${Xn2}%13d")
    }
    
  }

}
