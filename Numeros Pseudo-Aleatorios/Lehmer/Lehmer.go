/*
 PRNG .......: Lehmer (Metodo Congruencial Linear Multiplicativo)
 Ano ........: 1951
 Autor ......: Derrick Henry "Dick" Lehmer
*/

package main

import (
    "fmt"
    "time"
)

func Lehmer(seed int) int {
    seed = (16807 * seed) % 2147483647
    return seed
}

func main() {
  
    fmt.Println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
    fmt.Println("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
    fmt.Println("PADRAO: Lehmer")
    fmt.Println("==========================================\n")
    fmt.Println("    Semente: 1234        Semente: TIME")
    fmt.Println("    -------------        -------------")

    Xn1 := 1234
    Xn2 := int(time.Now().Unix())

    for i := 1; i <= 10; i++ {
        Xn1 = Lehmer(Xn1)
        Xn2 = Lehmer(Xn2)
        fmt.Printf("%17d        %13d\n", Xn1, Xn2)
    }
  
}
