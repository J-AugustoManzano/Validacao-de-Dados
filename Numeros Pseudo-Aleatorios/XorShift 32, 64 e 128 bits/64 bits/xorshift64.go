/*
 PRNG .......: XorShift (64 bits)
 Ano ........: 2003
 Autor ......: George Marsaglia
*/

package main

import (
    "fmt"
    "time"
)

type xorShift64State struct {
    seed uint64
}

func xorshift64(state *xorShift64State) uint64 {
    random := state.seed
    random ^= random << 13
    random ^= random >> 7
    random ^= random << 17
    state.seed = random
    return state.seed & 0x7FFFFFFFFFFFFFFF
}

func main() {
    var Xn1, Xn2 xorShift64State
    Xn1.seed = 1234
    Xn2.seed = uint64(time.Now().Unix())

    fmt.Println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
    fmt.Println("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
    fmt.Println("PADRAO: XorShift (64 bits)")
    fmt.Println("=================================================")
    fmt.Println()
    fmt.Println("   Semente: 1234          Semente: TIME")
    fmt.Println("   --------------------   --------------------")

    for i := 1; i <= 10; i++ {
        fmt.Printf("%23d%23d\n", xorshift64(&Xn1), xorshift64(&Xn2))
    }
}
