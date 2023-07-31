/*
 PRNG .......: Tiny Mersenne Twister (TMT)
 Ano ........: 2015 (version 1.1)
 Autor ......: Mutsuo Saito & Makoto Matsumoto
*/

import java.util.concurrent.TimeUnit

class Tinymt32PRNG {
  private var status: Array[Int] = new Array[Int](4)
  private var matrixAlpha: Int = 0
  private var matrixBeta: Int = 0
  private var tempCoeff: Int = 0

  private def tinymt32NextState(): Unit = {
    val stateX: Int = status(0) & 0x7fffffff ^ status(1) ^ status(2)
    val stateY: Int = status(3)
    status(0) = status(1)
    status(1) = status(2)
    status(2) = stateX ^ (stateY << 10)
    status(3) = stateY
    if ((stateY & 1) != 0) {
      status(1) ^= matrixAlpha
      status(2) ^= matrixBeta
    }
  }

  private def tinymt32Temp(): Int = {
    val tempCalc: Int = status(0) + (status(2) >> 8)
    val finalValue: Int = status(3) ^ tempCalc
    finalValue ^ -((tempCalc & 1) & 0xffffffffL).intValue() & tempCoeff
  }

  def tinymt32Init(seed: Int): Unit = {
    status(0) = seed
    matrixAlpha = 0x8f7011ee
    matrixBeta = 0xfc78ff1f
    tempCoeff = 0x3793fdff
    for (i <- 1 to 7) {
      status(i & 3) ^= i + 1812433253 * (status((i - 1) & 3) ^ (status((i - 1) & 3) >>> 30))
    }
    for (_ <- 0 to 7) {
      tinymt32NextState()
    }
  }

  def tinymt32Gen(): Int = {
    tinymt32NextState()
    tinymt32Temp() & 0x7fffffff
  }
}

object Main {
  def main(args: Array[String]): Unit = {
    val seed1: Tinymt32PRNG = new Tinymt32PRNG()
    val seed2: Tinymt32PRNG = new Tinymt32PRNG()

    seed1.tinymt32Init(1234)
    seed2.tinymt32Init((System.currentTimeMillis() / 1000).toInt)

    println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
    println("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
    println("PADRAO: Tiny Mersenne Twister (TMT)")
    println("==========================================")
    println()
    println("    Semente: 1234        Semente: TIME")
    println("    -------------        -------------")

    for (_ <- 1 to 10) {
      val Xn1: Int = seed1.tinymt32Gen()
      val Xn2: Int = seed2.tinymt32Gen()
      println(f"${Xn1}%17d${Xn2}%21d")
    }
  }
}
