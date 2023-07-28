/*
 PRNG .......: SplitMix64
 Ano ........: 2015
 Autor ......: Sebastiano Vigna
*/

// Fundamentado: rosettacode.org/wiki/Pseudo-random_numbers/Splitmix64

import java.time.Instant

class SplitMix64(private var state: Long) {
  def nextInt(): Long = {
    state += 0x9e3779b97f4a7c15L
    var z = state
    z = (z ^ (z >> 30)) * 0xbf58476d1ce4e5b9L
    z = (z ^ (z >> 27)) * 0x94d049bb133111ebL
    z ^ (z >> 31)
  }

  def nextFloat(): Float = {
    ((nextInt() >>> 11) & 0x7FFFFF).toFloat / (1 << 23).toFloat
  }
}

object Main extends App {
	
  val Xn1 = new SplitMix64(1234L)
  val Xn2 = new SplitMix64(Instant.now().getEpochSecond)

  println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
  println("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
  println("PADRAO: SplitMix64")
  println("===================================================")
  println()

  println("  Semente: 1234 (int)        Semente: TIME (int)")
  println("  --------------------       --------------------")
  for (_ <- 1 to 5) {
    println(f"${Xn1.nextInt()}%22d${Xn2.nextInt()}%27d")
  }
  println()

  println("  Semente: 1234 (real)       Semente: TIME (real)")
  println("  --------------------       --------------------")
  for (_ <- 1 to 5) {
    println(f"${Xn1.nextFloat()}%22.18f${Xn2.nextFloat()}%27.18f")
  }
  
}
