/*
 PRNG .......: Add With Carry (AWC)
 Ano ........: 1991
 Autor ......: George Marsaglia
*/

package main

import (
	"fmt"
	"time"
)

func AWCNextRandom(Xn *uint64) uint64 {
	*Xn = (*Xn + 12345) % 4294967296
	return *Xn
}

func AWCInitialize(seed uint64, Xn *uint64) {
	*Xn = seed
}

func main() {

	fmt.Println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
	fmt.Println("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
	fmt.Println("PADRAO: Add With Carry")
	fmt.Println("==========================================")
	fmt.Println()
	fmt.Println("    Semente: 1234        Semente: TIME")
	fmt.Println("    -------------        -------------")

	var Xn1, Xn2 uint64
	var X1, X2 uint64

	X1 = 1234
	X2 = uint64(time.Now().Unix())
  
	AWCInitialize(X1, &Xn1)
	AWCInitialize(X2, &Xn2)

	for i := 1; i <= 10; i++ {
		fmt.Printf("%17d        %13d\n", AWCNextRandom(&Xn1), AWCNextRandom(&Xn2))
	}

}
