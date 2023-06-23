/*
   PRNG .......: RANDU
   Ano ........: Decada de 1960
   Autor ......: IBM
*/

object Main {
  def main(args: Array[String]): Unit = {
    
    import java.time.Instant

    object PRNG {
      def RANDU(seed: Long): Long = {
        (65539 * seed) % 2147483648L
      }
    }

    println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
    println("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
    println("PADRAO: RANDU")
    println("==========================================")
    println()
    println("    Semente: 1234        Semente: TIME")
    println("    -------------        -------------")

    var Xn1: Long = 1234
    var Xn2: Long = Instant.now().getEpochSecond

    for (i <- 1 to 10) {
      Xn1 = PRNG.RANDU(Xn1)
      Xn2 = PRNG.RANDU(Xn2)
      println(f"$Xn1%17d        $Xn2%13d")
    }
    
  }
}
