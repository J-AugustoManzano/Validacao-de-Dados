/*
 PRNG .......: XorShift (128 bits)
 Ano ........: 2003
 Autor ......: George Marsaglia
*/

package main

import (
	"fmt"
	"time"
)

type xorShift128State struct {
	seed uint64
}

func xorshift128(state *xorShift128State) uint64 {
	random := state.seed
	random ^= random << 13
	random ^= random >> 7
	random ^= random << 17
	state.seed = random
	return random & 0x7FFFFFFFFFFFFFFF
}

func main() {
	var Xn1 xorShift128State
	var Xn2 xorShift128State

	Xn1.seed = 1234
	Xn2.seed = uint64(time.Now().UnixNano())

	fmt.Println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
	fmt.Println("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
	fmt.Println("PADRAO: XorShift (128 bits)")
	fmt.Println("=================================================")
	fmt.Println("")
	fmt.Println("   Semente: 1234          Semente: TIME")
	fmt.Println("   --------------------   --------------------")

	for i := 1; i <= 10; i++ {
		fmt.Printf("%23d%23d\n", xorshift128(&Xn1), xorshift128(&Xn2))
	}
}
