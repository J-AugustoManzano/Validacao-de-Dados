/*
 PRNG .......: Blum-Blum-Shub
 Ano ........: 1986
 Autor ......: L. Blum, M. Blum & M. Shub
*/

object Main {

  def blumBlumShub(X: BigInt): BigInt = {
    (X * X) % 2467246241L
  }

  def main(args: Array[String]): Unit = {
	  
    println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
    println("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
    println("PADRAO: Blum-Blum-Shub")
    println("==========================================\n")
    println("    Semente: 1234        Semente: TIME")
    println("    -------------        -------------")

    var X1: BigInt = 1234
    var X2: BigInt = System.currentTimeMillis() 
    
    val Xn1 = new Array[BigInt](10)
    val Xn2 = new Array[BigInt](10)    
    
    for (i <- 0 to 9) {
      Xn1(i) = blumBlumShub(X1)
      X1 = Xn1(i)
      Xn2(i) = blumBlumShub(X2)
      X2 = Xn2(i)
      printf("%17s        %13s\n", Xn1(i).toString, Xn2(i).toString)
    }
	  
  }
  
}
