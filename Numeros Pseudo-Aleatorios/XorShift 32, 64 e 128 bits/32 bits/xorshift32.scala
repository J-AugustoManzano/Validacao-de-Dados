/*
 PRNG .......: XorShift (32 bits)
 Ano ........: 2003
 Autor ......: George Marsaglia
*/

object Main {

  object XorShift32 {
    class XorShift32State(var seed: Int)
    def xorshift32(state: XorShift32State): Int = {
      var random = state.seed
      random ^= random << 13
      random ^= random >>> 17
      random ^= random << 5
      state.seed = random
      random & 0x7FFFFFFF // Apenas os 31 bits mais significativos
    }
  }

  import XorShift32._

  def main(args: Array[String]): Unit = {
	  
    val Xn1 = new XorShift32State(1234)
    val Xn2 = new XorShift32State(System.currentTimeMillis().toInt)

    println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
    println("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
    println("PADRAO: XorShift (32 bits)")
    println("=============================================")
    println()
    println("      Semente: 1234       Semente: TIME")
    println("      -------------       -------------")

    for (_ <- 1 to 10) {
      println(f"${xorshift32(Xn1)}%19d${xorshift32(Xn2)}%20d")
    }
    
  }
  
}
