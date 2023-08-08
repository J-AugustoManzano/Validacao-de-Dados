/*
 PRNG .......: XorShift (128 bits)
 Ano ........: 2003
 Autor ......: George Marsaglia
*/

import java.util.Date

object Main {
  class XorShift128State(var seed: Long)

  def xorshift128(state: XorShift128State): Long = {
    var random = state.seed
    random ^= random << 13
    random ^= random >>> 7
    random ^= random << 17
    state.seed = random
    random & 0x7FFFFFFFFFFFFFFFL
  }

  def main(args: Array[String]): Unit = {
    val Xn1 = new XorShift128State(1234)
    val Xn2 = new XorShift128State(new Date().getTime)

    println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
    println("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
    println("PADRAO: XorShift (128 bits)")
    println("=================================================")
    println("")
    println("   Semente: 1234          Semente: TIME")
    println("   --------------------   --------------------")

    for (i <- 1 to 10) {
      println(f"${xorshift128(Xn1)}%23d${ xorshift128(Xn2)}%23d")
    }
  }
}


