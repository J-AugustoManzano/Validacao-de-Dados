/* 
 * PRNG .......: Blum-Blum-Shub
 * Ano ........: 1986
 * Autor ......: L. Blum, M. Blum & M. Shub
*/

package main

import (
	"fmt"
	"time"
)

func BlumBlumShub(X *uint32) uint32 {
	*X = (*X * *X) % 2467246241
	return *X
}

var Xn1 [10]uint32
var Xn2 [10]uint32
var X1, X2 uint32

func main() {
	
	fmt.Println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
	fmt.Println("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
	fmt.Println("PADRAO: Blum-Blum-Shub")
	fmt.Println("==========================================\n")
	fmt.Println("    Semente: 1234        Semente: TIME")
	fmt.Println("    -------------        -------------\n")

	X1 = 1234
	X2 = uint32(time.Now().Unix())

	for i := 0; i <= 9; i++ {
		Xn1[i] = BlumBlumShub(&X1)
		Xn2[i] = BlumBlumShub(&X2)
		fmt.Printf("%17d        %13d\n", Xn1[i], Xn2[i])
	}
	
}
