/*
 * PRNG .......: Permuted Congruential Generator (PCG)
 * Ano ........: 2014
 * Autor ......: Dr. M.E. O'Neill
 */

package main

import (
    "fmt"
    "time"
)

func rotr32(x uint32, r uint) uint32 {
    return (x >> r) | (x << (-r & 31))
}

func pcg32(seed *uint64) uint32 {
    x := *seed
    rotation := uint(x >> 59)
    *seed = x*6364136223846793005 + 1442695040888963407
    x ^= x >> 18
    *seed = *seed + x
    return rotr32(uint32(((x >> 27) + uint64(rotation)) ^ (*seed >> 32)), uint(rotation))
}

func getTimer() uint32 {
    currentTime := time.Now().Unix()
    return uint32(currentTime)
}

func main() {
	
    var Xn1, Xn2 uint64
    Xn1 = 1234
    Xn2 = uint64(getTimer())

    fmt.Println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
    fmt.Println("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
    fmt.Println("PADRAO: Permuted Congruential Generator (PCG)")
    fmt.Println("=============================================")
    fmt.Println()

    fmt.Println("      Semente: 1234       Semente: TIME")
    fmt.Println("      -------------       -------------")

    for i := 1; i <= 10; i++ {
        fmt.Printf("%19d%20d\n", pcg32(&Xn1), pcg32(&Xn2))
    }
}
