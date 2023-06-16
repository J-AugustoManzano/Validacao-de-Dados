/*
 * PRNG .......: Wichmann Hill
 * Ano ........: 1982
 * Autor ......: Brian A. Wichmann & David H. Hill
 */

package main

import (
	"fmt"
	"math"
	"time"
)

func WichmannHill(X *int) float64 {
	*X = (171 * *X) % 30269
	return math.Abs(float64(*X) / 30269.0)
}

func main() {
	fmt.Println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
	fmt.Println("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
	fmt.Println("PADRAO: Wichmann Hill")
	fmt.Println("==========================================")
	fmt.Println()
	fmt.Println("    Semente: 1234        Semente: TIME")
	fmt.Println("    -------------        -------------")

	var semente1234 [10]float64
	var sementeTime [10]float64
	var X1, X2 int

	X1 = 1234
	for i := 0; i <= 9; i++ {
		semente1234[i] = WichmannHill(&X1)
	}

	X2 = int(time.Now().Unix())
	for i := 0; i <= 9; i++ {
		sementeTime[i] = WichmannHill(&X2)
	}

	for i := 0; i <= 9; i++ {
		fmt.Printf("%17.11f        ", semente1234[i])
		fmt.Printf("%13.11f\n", sementeTime[i])
	}
}
