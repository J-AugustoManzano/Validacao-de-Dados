/*
 PRNG .......: XorShift (64 bits)
 Ano ........: 2003
 Autor ......: George Marsaglia
*/

object Main {

  object XorShift64 {
    case class XorShift64State(var seed: Long)

    def xorShift64(state: XorShift64State): Long = {
      var random = state.seed
      random ^= random << 13
      random ^= random >>> 7
      random ^= random << 17
      state.seed = random
      random & 0x7FFFFFFFFFFFFFFFL // Apenas os 63 bits mais significativos
    }
  }

  import XorShift64._

  def main(args: Array[String]): Unit = {
	  
    val Xn1 = XorShift64State(1234L)
    val Xn2 = XorShift64State(System.currentTimeMillis())

    println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
    println("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
    println("PADRAO: XorShift (64 bits)")
    println("=================================================")
    println()
    println("   Semente: 1234          Semente: TIME")
    println("   --------------------   --------------------")

    for (_ <- 1 to 10) {
      println(f"${xorShift64(Xn1)}%23d${xorShift64(Xn2)}%23d")
    }
    
  }
  
}
