/*
 PRNG .......: Middle Square
 Ano ........: 1946
 Autor ......: John von Neumann
*/

object Main {
  def main(args: Array[String]): Unit = {

    import scala.util.Random

    def meanSquare(seed: Long): Long = {
      val updatedSeed = (seed * seed / 100) % 10000
      if (updatedSeed < 0) updatedSeed + 10000 else updatedSeed
    }

    var Xn1: Long = 1234
    var Xn2: Long = System.currentTimeMillis() % 10000

    println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
    println("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
    println("PADRAO: Middle Square")
    println("==========================================\n")
    println("    Semente: 1234        Semente: TIME")
    println("    -------------        -------------\n")

    for (_ <- 1 to 10) {
      Xn1 = meanSquare(Xn1)
      Xn2 = meanSquare(Xn2)
      println(f"${Xn1}%17d        ${Xn2}%13d")
    }
  }
}
