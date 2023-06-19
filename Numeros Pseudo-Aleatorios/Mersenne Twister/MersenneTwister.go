/*
 PRNG .......: Mersenne Twister (MT 19937)
 Ano ........: 2007
 Autor ......: Makoto Matsumoto & Takuji Nishimura
*/

package main

import (
	"fmt"
	"time"
)

const (
	w = 32
	n = 624
	m = 397
	r = 31
	a = 0x9908B0DF
	u = 11
	s = 7
	b = 0x9D2C5680
	t = 15
	c = 0xEFC60000
	l = 18
)

type MT19937 struct {
	X   [n]uint32
	cnt uint32
}

func (mt *MT19937) twist() {
	for i := 0; i < n; i++ {
		tmp := (mt.X[i] & 0x80000000) + (mt.X[(i+1)%n] & 0x7FFFFFFF)
		mt.X[i] = mt.X[(i+m)%n] ^ (tmp >> 1)
		if tmp%2 != 0 {
			mt.X[i] ^= a
		}
	}
	mt.cnt = 0
}

func (mt *MT19937) initialize(seed uint32) {
	mt.X[0] = seed
	for i := 1; i < n; i++ {
		mt.X[i] = uint32(uint64(0x6C078965)*(uint64(mt.X[i-1])^(uint64(mt.X[i-1])>>30)) + uint64(i))
	}
	mt.twist()
}

func (mt *MT19937) generateRandomNumber() uint32 {
	if mt.cnt == n {
		mt.twist()
	}
	y := mt.X[mt.cnt]
	y ^= (y >> u) & 0xDFFFFFFF
	y ^= (y << s) & b
	y ^= (y << t) & c
	y ^= y >> l
	mt.cnt++
	return y
}

func main() {
	var Xn1, Xn2 MT19937

	Xn1.initialize(1234)
	Xn2.initialize(uint32(time.Now().Unix()))

	fmt.Println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
	fmt.Println("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
	fmt.Println("PADRAO: Mersenne Twister (MT)")
	fmt.Println("==========================================\n")

	fmt.Printf("%17s %21s\n", "Semente: 1234", "Semente: TIME")
	fmt.Println("    -------------        -------------\n")

	for i := 0; i <= 9; i++ {
		fmt.Printf("%17d %21d\n", Xn1.generateRandomNumber(), Xn2.generateRandomNumber())
	}
}
