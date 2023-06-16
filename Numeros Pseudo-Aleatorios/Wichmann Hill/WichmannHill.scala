/*
 * PRNG .......: Wichmann Hill
 * Ano ........: 1982
 * Autor ......: Brian A. Wichmann & David H. Hill
 */
 
import scala.util.Random

object Main {
	
  def WichmannHill(X: Int): Double = {
    val newX = (171 * X) % 30269
    math.abs(newX.toDouble / 30269.0)
  }

  def main(args: Array[String]): Unit = {
    println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
    println("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
    println("PADRAO: Wichmann Hill")
    println("==========================================")
    println()
    println("    Semente: 1234        Semente: TIME")
    println("    -------------        -------------")

    var i: Int = 0
    val semente1234: Array[Double] = new Array[Double](10)
    val sementeTime: Array[Double] = new Array[Double](10)

    var X1: Int = 1234
    for (i <- 0 to 9) {
      semente1234(i) = WichmannHill(X1)
      X1 = (171 * X1) % 30269
    }

    var X2: Int = System.currentTimeMillis.toInt
    for (i <- 0 to 9) {
      sementeTime(i) = WichmannHill(X2)
      X2 = (171 * X2) % 30269
    }

    for (i <- 0 to 9) {
      printf("%17.11f        %13.11f\n", semente1234(i), sementeTime(i))
    }
  }
  
}
