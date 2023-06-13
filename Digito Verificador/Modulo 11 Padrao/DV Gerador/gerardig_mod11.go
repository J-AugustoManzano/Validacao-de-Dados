package main

import (
	"fmt"
	"strconv"
	"strings"
)

func validarMatricula(MATRICULA string) bool {
	if len(MATRICULA) != 7 {
		return false
	}
	if !isDigit(MATRICULA[0]) || !isDigit(MATRICULA[6]) {
		return false
	}
	if MATRICULA[3] != '.' {
		return false
	}
	for I := 1; I <= 2; I++ {
		if !isDigit(MATRICULA[I]) || !isDigit(MATRICULA[I + 4]) {
			return false
		}
	}
	return true
}

func isDigit(char byte) bool {
	return char >= '0' && char <= '9'
}

func removerCaractere(CADEIA string, CARACTERE string) string {
	return strings.ReplaceAll(CADEIA, CARACTERE, "")
}

func mod11(MATRIC_CPT string) string {
	MATRIC_SPT := MATRIC_CPT
	MATRIC_SPT = removerCaractere(MATRIC_SPT, ".")
	MATRIC_INT := make([]int, 6)
	for I := 0; I <= 5; I++ {
		MATRIC_INT[I], _ = strconv.Atoi(string(MATRIC_SPT[I]))
	}
	SOMA := 0
	for I := 0; I <= 5; I++ {
		SOMA += MATRIC_INT[I] * (7 - I)
	}
	var DV string
	if (SOMA % 11) == 0 {
		DV = "0"
	} else if (SOMA % 11) == 1 {
		DV = "X"
	} else if (SOMA % 11) == 10 {
		DV = "1"
	} else {
		DV = strconv.Itoa(11 - (SOMA % 11))
	}
	return DV
}

func main() {
	
	var MATRICULA string
	var DV string

	for {
		fmt.Print("Informe matricula no formato 999.999: ")
		fmt.Scanln(&MATRICULA)
		if !validarMatricula(MATRICULA) {
			fmt.Println()
			fmt.Println("Matricula invalida. Tente novamente.")
			fmt.Println()
		} else {
			break
		}
	}

	DV = mod11(MATRICULA)
	fmt.Println()
	fmt.Printf("Matricula com DV = %s-%s\n", MATRICULA, DV)
	fmt.Println()
	fmt.Print("Tecle <Enter> para encerrar... ")
	fmt.Scanln()
}
