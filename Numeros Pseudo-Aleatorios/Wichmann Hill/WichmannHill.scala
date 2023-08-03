/*
 * PRNG .......: Wichmann Hill
 * Ano ........: 1982
 * Autor ......: Brian A. Wichmann & David H. Hill
 */
 
import java.util.Date

object Main {
  
  def WichmannHill(X: Array[Int]): Double = {
    X(0) = (171 * X(0)) % 30269
    X(0) / 30269.0
  }

  def main(args: Array[String]): Unit = {
    
    val X1: Array[Int] = Array(1234)
    val X2: Array[Int] = Array(new Date().getTime.toInt)
    var Xn1 = .0
    var Xn2 = .0

    println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
    println("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
    println("PADRAO: Wichmann Hill")
    println("==========================================\n")

    println("    Semente: 1234        Semente: TIME")
    println("    -------------        -------------\n")

    for (i <- 1 to 10) {
      Xn1 = WichmannHill(X1)
      Xn2 = WichmannHill(X2)
      printf("%17.11f        %13.11f%n", Xn1, Xn2)
    }
    
  }
  
}
