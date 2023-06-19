/*
 * PRNG .......: Park-Miller
 * Ano ........: 1988
 * Autor ......: S. K. Park & K. W. Miller
 */

package main

import (
  "fmt"
  "time"
)

func ParkMiller(X *uint32) uint32 {
  *X = (16807 * *X) % 2147483647
  return *X
}

func main() {
  
  var Xn1, Xn2 uint32

  Xn1 = 1234
  Xn2 = uint32(time.Now().Unix())

  fmt.Println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
  fmt.Println("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
  fmt.Println("PADRAO: Park-Miller")
  fmt.Println("==========================================")
  fmt.Println()
  fmt.Println("    Semente: 1234        Semente: TIME")
  fmt.Println("    -------------        -------------")

  for i := 1; i <= 10; i++ {
    fmt.Printf("%17v        %13v\n", ParkMiller(&Xn1), ParkMiller(&Xn2))
  }
  
}
