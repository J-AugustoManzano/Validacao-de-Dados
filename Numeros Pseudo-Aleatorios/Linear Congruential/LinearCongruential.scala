/*
 PRNG .......: Linear Congruential
 Ano ........: 1965
 Autor ......: W. E. Thomson
*/

import java.util.Date

object Main {
  def linearCongruential(seed: Array[Long]): Double = {
    val M: Long = 2147483647
    seed(0) = (1664525 * seed(0) + 1013904223) % M
    seed(0).toDouble / M
  }

  def main(args: Array[String]): Unit = {
    val Xn1: Array[Long] = Array(1234)
    val Xn2: Array[Long] = Array(new Date().getTime)

    println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
    println("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
    println("PADRAO: Linear Congruential")
    println("==========================================")
    println()
    println("    Semente: 1234        Semente: TIME")
    println("    -------------        -------------")

    for (i <- 1 to 10) {
      printf("%17.11f        %13.11f%n", linearCongruential(Xn1), linearCongruential(Xn2))
    }
  }
}
