/*
 * PRNG .......: Permuted Congruential Generator (PCG)
 * Ano ........: 2014
 * Autor ......: Dr. M.E. O'Neill
 */

object Main {
  def main(args: Array[String]): Unit = {
    import java.time.{Instant, Duration}

    def rotr32(x: Long, r: Int): Long = (x >>> r) | (x << (32 - r))

    def pcg32(seed: Array[Long]): Int = {
      var x = seed(0)
      val rotation = (x >>> 59).toInt
      seed(0) = x * 6364136223846793005L + 1442695040888963407L
      x ^= x >>> 18
      seed(0) += x
      ((rotr32(((x >>> 27) + rotation) ^ (seed(0) >>> 32), rotation) >>> 1) & 0x7FFFFFFF).toInt
    }

    def getTimer: Long = Instant.now().toEpochMilli

    val Xn1 = Array[Long](1234)
    val Xn2 = Array[Long](getTimer)

    println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
    println("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
    println("PADRAO: Permuted Congruential Generator (PCG)")
    println("=============================================")
    println()

    println("      Semente: 1234       Semente: TIME")
    println("      -------------       -------------")

    for (i <- 1 to 10) {
      print(f"${pcg32(Xn1)}%19d")
      println(f"${pcg32(Xn2)}%20d")
    }
  }
}
