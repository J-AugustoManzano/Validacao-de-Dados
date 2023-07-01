/**
 * PRNG .......: Linear-Feedback Shift Register (LFSR)
 * Ano ........: 1965
 * Autor ......: R. C. Tausworthe
 */

object Main {
  
  def lfsr(state: Array[Long]): Double = {
    
    state(0) = (state(0) >> 1) ^ (0xB4BCD35CL * (state(0) & 1))
    state(0) / 4294967296.0
  }

  def main(args: Array[String]): Unit = {
    val Xn1: Array[Long] = Array(0x1234L)
    val Xn2: Array[Long] = Array(new java.util.Date().getTime & 0xFFFFFFFFL)
    var i: Int = 1

    println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
    println("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
    println("PADRAO: Linear-Feedback Shift Register")
    println("==========================================\n")
    println("    Semente: 1234        Semente: TIME")
    println("    -------------        -------------\n")

    for (i <- 1 to 10) {
      printf("%17.11f        %13.11f\n", lfsr(Xn1), lfsr(Xn2))
    }
    
  }
  
}
