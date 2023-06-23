/*
 PRNG .......: Add With Carry (AWC)
 Ano ........: 1991
 Autor ......: George Marsaglia
*/

import scala.util.Random

object Main extends App {

  def AWCNextRandom(Xn: Long): Long = {
    (Xn + 12345L) % 4294967296L
  }

  def AWCInitialize(seed: Long): Long = {
    seed
  }

  println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
  println("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
  println("PADRAO: Add With Carry")
  println("==========================================")
  println()
  println("    Semente: 1234        Semente: TIME")
  println("    -------------        -------------")

  var Xn1: Long = 0
  var Xn2: Long = 0
  var i: Int = 0
  var seed1: Long = 1234
  var seed2: Long = System.currentTimeMillis()

  Xn1 = AWCInitialize(seed1)
  Xn2 = AWCInitialize(seed2)

  for (i <- 1 to 10) {
    Xn1 = AWCNextRandom(Xn1)
    Xn2 = AWCNextRandom(Xn2)
    println(f"${Xn1}%17d        ${Xn2}%13d")
  }

}
