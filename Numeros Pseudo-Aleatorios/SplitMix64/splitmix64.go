/*
 PRNG .......: SplitMix64
 Ano ........: 2015
 Autor ......: Sebastiano Vigna
*/

// Fundamentado: rosettacode.org/wiki/Pseudo-random_numbers/Splitmix64

package main

import (
	"fmt"
	"time"
)

type SplitMix64 struct {
	state uint64
}

func SplitMix64Init(state uint64) SplitMix64 {
	return SplitMix64{state}
}

func (sm64 *SplitMix64) nextInt() uint64 {
	sm64.state += 0x9e3779b97f4a7c15
	z := sm64.state
	z = (z ^ (z >> 30)) * 0xbf58476d1ce4e5b9
	z = (z ^ (z >> 27)) * 0x94d049bb133111eb
	return z ^ (z >> 31)
}

func (sm64 *SplitMix64) nextFloat() float64 {
	return float64(sm64.nextInt()>>11) / (1 << 53)
}

func main() {
	
	Xn1 := SplitMix64Init(1234)
	Xn2 := SplitMix64Init(uint64(time.Now().UnixNano()))

	fmt.Println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
	fmt.Println("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
	fmt.Println("PADRAO: SplitMix64")
	fmt.Println("===================================================\n")

	fmt.Println("  Semente: 1234 (int)        Semente: TIME (int)")
	fmt.Println("  --------------------       --------------------")
	for i := 1; i <= 5; i++ {
		fmt.Printf("%22d%27d\n", Xn1.nextInt(), Xn2.nextInt())
	}
	fmt.Println()

	fmt.Println("  Semente: 1234 (real)       Semente: TIME (real)")
	fmt.Println("  --------------------       --------------------")
	for i := 1; i <= 5; i++ {
		fmt.Printf("%22.18f%27.18f\n", Xn1.nextFloat(), Xn2.nextFloat())
	}
	
}
