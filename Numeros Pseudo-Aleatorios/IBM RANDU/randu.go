/*
  PRNG .......: RANDU
  Ano ........: Decada de 1960
  Autor ......: IBM
*/

package main

import (
  "fmt"
  "time"
)

func RANDU(seed int64) int64 {
  return (65539 * seed) % 2147483648
}

func main() {
  var Xn1 int64 = 1234
  Xn2 := time.Now().Unix()

  fmt.Println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
  fmt.Println("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
  fmt.Println("PADRAO: RANDU")
  fmt.Println("==========================================")
  fmt.Println()
  fmt.Println("    Semente: 1234        Semente: TIME")
  fmt.Println("    -------------        -------------")

  for i := 1; i <= 10; i++ {
    Xn1 = RANDU(Xn1)
    Xn2 = RANDU(Xn2)
    fmt.Printf("%17d        %13d\n", Xn1, Xn2)
  }
}
