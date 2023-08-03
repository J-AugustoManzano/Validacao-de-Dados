/*
 * PRNG .......: Wichmann Hill
 * Ano ........: 1982
 * Autor ......: Brian A. Wichmann & David H. Hill
 */

package main

import (
	"fmt"
	"time"
)

func WichmannHill(X *int) float64 {
	*X = (171 * *X) % 30269
	return float64(*X) / 30269.0
}

func main() {

	var Xn1 [10]float64
	var Xn2 [10]float64
	var X1, X2 int
	
	fmt.Println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
	fmt.Println("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
	fmt.Println("PADRAO: Wichmann Hill")
	fmt.Println("==========================================")
	fmt.Println()
	fmt.Println("    Semente: 1234        Semente: TIME")
	fmt.Println("    -------------        -------------")

	X1 = 1234
	X2 = int(time.Now().Unix())

	for i := 0; i <= 9; i++ {
		Xn1[i] = WichmannHill(&X1)
		Xn2[i] = WichmannHill(&X2)
		fmt.Printf("%17.11f        ", Xn1[i])
		fmt.Printf("%13.11f\n", Xn2[i])
	}
}
