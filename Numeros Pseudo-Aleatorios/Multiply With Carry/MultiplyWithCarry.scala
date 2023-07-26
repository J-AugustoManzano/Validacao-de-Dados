/*
 PRNG .......: Multiply With Carry (MWC)
 Ano ........: Desconhecido
 Autor ......: George Marsaglia
*/

import scala.util.Random

class CmwcRnd {
  
  private val randomValues: Array[Long] = Array.fill[Long](4096)(0)
  private var carry: Long = 0
  private var currentIndex: Int = 0

  private def log2ibase(n: Int, acc: Int): Int = {
    if (n == 1) acc
    else log2ibase(n >> 1, acc + 1)
  }

  private def log2i(n: Int): Int = {
    log2ibase(n, 0)
  }

  private def rand32(): Long = {
    var seed: Long = 0
    var result: Long = 0
    val bits: Int = log2i(Random.nextInt(Int.MaxValue)) + 1
    var remainingBits: Int = 32 - bits
    do {
      seed = (seed * 1103515245 + 12345) & 0xFFFFFFFFL
      result = (result << bits) | (seed >> (32 - bits))
      remainingBits -= bits
    } while (remainingBits > 0)
    result
  }

  def initCMWC(seed: Int): Unit = {
    var tempSeed = seed.toLong & 0xFFFFFFFFL
    for (i <- 0 to 4095) {
      tempSeed = (tempSeed * 1103515245 + 12345) & 0xFFFFFFFFL
      randomValues(i) = tempSeed
    }
    do {
      tempSeed = (tempSeed * 1103515245 + 12345) & 0xFFFFFFFFL
      carry = tempSeed
    } while (carry >= 809430660L)
    currentIndex = 4095
  }

  def randCMWC(): Long = {
    val t: Long = 18782L * randomValues(currentIndex) + carry
    carry = t >> 32
    var x: Long = t + carry
    if (x < carry) {
      x += 1
      carry += 1
    }
    randomValues(currentIndex) = 0xfffffffeL - x
    currentIndex = (currentIndex + 1) & 4095
    randomValues(currentIndex)
  }
  
}

object Main extends App {
  
  val cmwc1 = new CmwcRnd
  val cmwc2 = new CmwcRnd
  
  var Xn1: Int = 1234
  var Xn2: Int = System.currentTimeMillis().toInt
  var i: Int = 0

  cmwc1.initCMWC(Xn1)
  cmwc2.initCMWC(Xn2)

  println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
  println("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
  println("PADRAO: Multiply With Carry (MWC)")
  println("==========================================")
  println()
  println("    Semente: 1234        Semente: TIME")
  println("    -------------        -------------")

  for (i <- 1 to 10)
    println(f"${cmwc1.randCMWC()}%17d${cmwc2.randCMWC()}%21d")
}
