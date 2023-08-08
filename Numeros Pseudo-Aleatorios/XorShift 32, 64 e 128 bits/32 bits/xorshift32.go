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

type xorShift32State struct {
    seed uint32
}

func xorshift32(state *xorShift32State) uint32 {
    random := state.seed
    random ^= random << 13
    random ^= random >> 17
    random ^= random << 5
    state.seed = random
    return state.seed
}

func main() {
	
    var Xn1 xorShift32State
    var Xn2 xorShift32State

    Xn1.seed = 1234
    Xn2.seed = uint32(time.Now().Unix())

    fmt.Println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
    fmt.Println("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
    fmt.Println("PADRAO: XorShift (32 bits)")
    fmt.Println("=============================================")
    fmt.Println()
    fmt.Println("      Semente: 1234       Semente: TIME")
    fmt.Println("      -------------       -------------")

    for i := 1; i <= 10; i++ {
        fmt.Printf("%19d%20d\n", xorshift32(&Xn1), xorshift32(&Xn2))
    }
}
