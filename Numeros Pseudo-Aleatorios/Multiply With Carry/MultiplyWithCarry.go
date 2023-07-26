/*
 PRNG .......: Multiply With Carry (MWC)
 Ano ........: Desconhecido
 Autor ......: George Marsaglia
*/

package main

import (
	"fmt"
	"math"
	"time"
)

func log2ibase(n, acc int) int {
	if n == 1 {
		return acc
	} else {
		return log2ibase(n >> 1, acc+1)
	}
}

func log2i(n int) int {
	return log2ibase(n, 0)
}

func rand32() uint32 {
	seed := uint32(0)
	result := uint32(0)
	bits := log2i(math.MaxInt64) + 1
	remainingBits := 32 - bits
	for remainingBits > 0 {
		result = (result << bits) | (seed * 1103515245 + 12345) >> (32 - bits)
		seed = (seed * 1103515245 + 12345) & 0xFFFFFFFF
		remainingBits -= bits
	}
	return result
}

type CmwcRnd struct {
	randomValues [4096]uint32
	carry        uint32
	currentIndex int
}

func (cmwc *CmwcRnd) initCMWC(seed uint32) {
	for i := 0; i < 4096; i++ {
		seed = (seed*1103515245 + 12345) & 0xFFFFFFFF
		cmwc.randomValues[i] = seed
	}
	for {
		seed = (seed * 1103515245 + 12345) & 0xFFFFFFFF
		cmwc.carry = seed
		if cmwc.carry < 809430660 {
			break
		}
	}
	cmwc.currentIndex = 4095
}

func (cmwc *CmwcRnd) randCMWC() uint32 {
	cmwc.currentIndex = (cmwc.currentIndex + 1) & 4095
	t := uint64(18782 * cmwc.randomValues[cmwc.currentIndex]) + uint64(cmwc.carry)
	cmwc.carry = uint32(t >> 32)
	x := t + uint64(cmwc.carry)
	if x < uint64(cmwc.carry) {
		x += 1
		cmwc.carry += 1
	}
	cmwc.randomValues[cmwc.currentIndex] = 0xFFFFFFFE - uint32(x)
	return cmwc.randomValues[cmwc.currentIndex]
}

func main() {
	cmwc1 := CmwcRnd{}
	cmwc2 := CmwcRnd{}
	Xn1 := uint32(1234)
	Xn2 := uint32(time.Now().Unix())

	cmwc1.initCMWC(Xn1)
	cmwc2.initCMWC(Xn2)

	fmt.Println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
	fmt.Println("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
	fmt.Println("PADRAO: Multiply With Carry (MWC)")
	fmt.Println("==========================================")
	fmt.Println()
	fmt.Println("    Semente: 1234        Semente: TIME")
	fmt.Println("    -------------        -------------")

	for i := 0; i < 10; i++ {
		fmt.Printf("%17d        %13d\n", cmwc1.randCMWC(), cmwc2.randCMWC())
	}
}
