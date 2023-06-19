import java.util.Date

object Main {
  
  def WichmannHill(X: Array[Int]): Double = {
    X(0) = (171 * X(0)) % 30269
    Math.abs(X(0) / 30269.0)
  }

  def main(args: Array[String]): Unit = {
    
    println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
    println("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
    println("PADRAO: Wichmann Hill")
    println("==========================================\n")

    println("    Semente: 1234        Semente: TIME")
    println("    -------------        -------------\n")

    val X1: Array[Int] = Array(1234)
    val X2: Array[Int] = Array(new Date().getTime.toInt)
    var Xn1 = .0
    var Xn2 = .0

    for (i <- 0 to 9) {
      Xn1 = WichmannHill(X1)
      Xn2 = WichmannHill(X2)
      printf("%17.11f        %17.11f%n", Xn1, Xn2)
    }
    
  }
  
}
