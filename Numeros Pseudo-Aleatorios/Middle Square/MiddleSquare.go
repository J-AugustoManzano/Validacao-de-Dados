/*
 PRNG .......: Middle Square
 Ano ........: 1946
 Autor ......: John von Neumann
*/

package main

import (
	"fmt"
	"time"
)

func meanSquare(seed int64) int64 {
	seed = (seed * seed / 100) % 10000
	return (seed + 10000) % 10000
}

func main() {
	var Xn1 int64 = 1234
	var Xn2 int64 = time.Now().UnixNano() / int64(time.Millisecond)

	fmt.Println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
	fmt.Println("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
	fmt.Println("PADRAO: Middle Square")
	fmt.Println("==========================================")
	fmt.Println()
	fmt.Println("    Semente: 1234        Semente: TIME")
	fmt.Println("    -------------        -------------")

	for i := 1; i <= 10; i++ {
		Xn1 = meanSquare(Xn1)
		Xn2 = meanSquare(Xn2)
		fmt.Printf("%17d        %13d\n", Xn1, Xn2)
	}
}
