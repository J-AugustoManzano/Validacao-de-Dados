/**
 * PRNG .......: Mersenne Twister (MT)
 * Ano ........: 1998
 * Autor ......: Makoto Matsumoto & Takuji Nishimura
 */

object Main {
  def main(args: Array[String]): Unit = {

    class MT19937 {
      private val w: Int = 32
      private val n: Int = 624
      private val f: Int = 1812433253
      private val m: Int = 397
      private val r: Int = 31
      private val a: Int = 0x9908B0DF
      private val d: Int = 0xFFFFFFFF.toInt
      private val b: Int = 0x9D2C5680
      private val c: Int = 0xEFC60000
      private val u: Int = 11
      private val s: Int = 7
      private val t: Int = 15
      private val l: Int = 18

      private var X: Array[Int] = new Array[Int](n)
      private var cnt: Int = 0

      private def twist(): Unit = {
        for (i <- 0 until n) {
          val lower_mask: Int = (1 << r) - 1
          val upper_mask: Int = ~lower_mask
          val tmp: Int = (X(i) & upper_mask) + (X((i + 1) % n) & lower_mask)
          val tmpA: Int = tmp >> 1
          if ((tmp & 1) != 0) {
            tmpA ^ a
          }
          X(i) = X((i + m) % n) ^ tmpA
        }
        cnt = 0
      }

      def initialize(seed: Int): Unit = {
        X(0) = seed
        for (i <- 1 until n) {
          X(i) = (f * (X(i - 1) ^ (X(i - 1) >> (w - 2))) + i) & 0xFFFFFFFF
        }
        twist()
      }

      def generateRandomNumber(): Int = {
        if (cnt == n) {
          twist()
        }
        var y: Int = X(cnt)
        y ^= (y >> u) & d
        y ^= (y << s) & b
        y ^= (y << t) & c
        y ^= y >> l
        cnt += 1
        y
      }
    }

    val Xn1: MT19937 = new MT19937
    val Xn2: MT19937 = new MT19937

    Xn1.initialize(1234)
    Xn2.initialize(System.currentTimeMillis().toInt)

    println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
    println("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
    println("PADRAO: Mersenne Twister (MT)")
    println("==========================================\n")
    println("    Semente: 1234        Semente: TIME")
    println("    -------------        -------------\n")

    for (_ <- 0 to 9) {
      print(f"${Xn1.generateRandomNumber()}%17s")
      print(f"${Xn2.generateRandomNumber()}%21s")
      println()
    }
  }
}
