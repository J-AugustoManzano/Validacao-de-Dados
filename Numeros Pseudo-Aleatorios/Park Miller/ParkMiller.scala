/**
 * PRNG .......: Park-Miller
 * Ano ........: 1988
 * Autor ......: S. K. Park & K. W. Miller
 */

object Main {
  def main(args: Array[String]): Unit = {
     
    object ParkMillerPRNG {

      import java.util.Date
      import scala.util.Random

      def ParkMiller(X: Long): Long = {
        X * 16807 % 2147483647
      }

      def runProgram(args: Array[String]): Unit = {

        var Xn1: Long = 1234
        var Xn2: Long = new Date().getTime

        println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
        println("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
        println("PADRAO: Park-Miller")
        println("==========================================")
        println()
        println("    Semente: 1234        Semente: TIME")
        println("    -------------        -------------")

        for (i <- 1 to 10) {
          Xn1 = ParkMiller(Xn1)
          Xn2 = ParkMiller(Xn2)
          println(f"${Xn1}%17d        ${Xn2}%13d")
        }

      }

    }

    ParkMillerPRNG.runProgram(args)
  }
}
