/*
 PRNG .......: Linear Congruential
 Ano ........: 1965
 Autor ......: W. E. Thomson
*/

package main

import (
    "fmt"
    "time"
)

func linearCongruential(seed *int64) float64 {
    const M = 2147483647
    *seed = (1664525 * *seed + 1013904223) % M
    return float64(*seed) / float64(M)
}

func main() {
    var Xn1 int64 = 1234
    Xn2 := time.Now().UnixNano() / int64(time.Millisecond)

    fmt.Println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
    fmt.Println("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
    fmt.Println("PADRAO: Linear Congruential")
    fmt.Println("==========================================")
    fmt.Println()
    fmt.Println("    Semente: 1234        Semente: TIME")
    fmt.Println("    -------------        -------------")

    for i := 1; i <= 10; i++ {
        fmt.Printf("%17.11f        %13.11f\n", linearCongruential(&Xn1), linearCongruential(&Xn2))
    }
}
