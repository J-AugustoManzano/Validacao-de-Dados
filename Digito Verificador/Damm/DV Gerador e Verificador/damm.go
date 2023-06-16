package main

import (
	"fmt"
	"strconv"
	"strings"
)

var dammTab = [10][10]int{
	{0, 3, 1, 7, 5, 9, 8, 6, 4, 2},
	{7, 0, 9, 2, 1, 5, 4, 8, 6, 3},
	{4, 2, 0, 6, 8, 7, 1, 3, 5, 9},
	{1, 7, 5, 0, 9, 8, 3, 4, 2, 6},
	{6, 1, 2, 3, 0, 4, 5, 9, 7, 8},
	{3, 6, 7, 4, 2, 0, 9, 5, 8, 1},
	{5, 8, 6, 9, 7, 2, 0, 1, 3, 4},
	{8, 9, 4, 5, 3, 6, 2, 0, 1, 7},
	{9, 4, 3, 8, 6, 1, 7, 2, 0, 5},
	{2, 5, 8, 1, 4, 3, 6, 7, 9, 0},
}

func gerarDamm(NUMERO string) int {
	DV := 0
	for _, char := range NUMERO {
		DIGITO, _ := strconv.Atoi(string(char))
		DV = dammTab[DV][DIGITO]
	}
	return DV
}

func validarDamm(NUMERO string) bool {
	DV := 0
	for _, char := range NUMERO {
		DIGITO, _ := strconv.Atoi(string(char))
		DV = dammTab[DV][DIGITO]
	}
	return DV == 0
}

func removerMascara(NUMERO string) string {
	var NUMERO_SMASC strings.Builder
	encontrouPrimeiroDigito := false

	for _, char := range NUMERO {
		if char == '.' {
			encontrouPrimeiroDigito = true
		} else if char >= '0' && char <= '9' {
			if !encontrouPrimeiroDigito && char == '0' {
				continue
			}
			NUMERO_SMASC.WriteRune(char)
		}
	}

	return NUMERO_SMASC.String()
}

func main() {
	var entradaValida bool
	var NUMERO, NUMERO_COM_DV, NUMERO_SEM_MASCARA_DV, NUMERO_SMASC string
	var DV int

	entradaValida = false
	for !entradaValida {
		fmt.Print("Entre matricula no formato 999.999: ")
		fmt.Scanln(&NUMERO)
		fmt.Println()
		if len(NUMERO) != 7 || NUMERO[3] != '.' {
			fmt.Println()
			fmt.Println("Matricula invalida. Tente novamente.")
			fmt.Println()
		} else {
			entradaValida = true
		}
	}

	NUMERO_SMASC = removerMascara(NUMERO)
	DV = gerarDamm(NUMERO_SMASC)
	fmt.Println("Digito verificador:", DV)
	fmt.Println()

	entradaValida = false
	for !entradaValida {
		fmt.Print("Entre matricula e digito verificador no formato 999.999-9: ")
		fmt.Scanln(&NUMERO_COM_DV)
		fmt.Println()
		if len(NUMERO_COM_DV) != 9 || NUMERO_COM_DV[3] != '.' || NUMERO_COM_DV[7] != '-' {
			fmt.Println()
			fmt.Println("Matricula invalida. Tente novamente.")
			fmt.Println()
		} else {
			entradaValida = true
		}
	}

	NUMERO_SEM_MASCARA_DV = removerMascara(NUMERO_COM_DV)
	if validarDamm(NUMERO_SEM_MASCARA_DV) {
		fmt.Println("Matricula valida.")
	} else {
		fmt.Println("Matricula invalida.")
	}
}
