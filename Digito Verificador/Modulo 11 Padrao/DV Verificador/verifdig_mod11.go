package main

import (
	"fmt"
	"strconv"
	"strings"
)

func isDigit(CARACTERE byte) bool {
	return CARACTERE >= '0' && CARACTERE <= '9'
}

func validarMatricula(MATRICULA string) bool {
	if len(MATRICULA) != 9 {
		return false
	}
	for I := 0; I <= 2; I++ {
		if !isDigit(MATRICULA[I]) {
			return false
		}
	}
	if MATRICULA[3] != '.' {
		return false
	}
	for I := 4; I <= 6; I++ {
		if !isDigit(MATRICULA[I]) {
			return false
		}
	}
	if MATRICULA[7] != '-' {
		return false
	}
	if !isDigit(MATRICULA[8]) {
		return false
	}
	return true
}

func removerCaractere(CADEIA string, CARACTERE byte) string {
	NOVA_CADEIA := strings.Builder{}
	for I := 0; I < len(CADEIA); I++ {
		if CADEIA[I] != CARACTERE {
			NOVA_CADEIA.WriteByte(CADEIA[I])
		}
	}
	return NOVA_CADEIA.String()
}

func mod11Check(MATRICULA string) int {
	MATRIC_INT := make([]int, 7)
	for I := 0; I <= 6; I++ {
		MATRIC_INT[I], _ = strconv.Atoi(string(MATRICULA[I]))
	}
	SOMA := 0
	for I := 0; I <= 5; I++ {
		SOMA += MATRIC_INT[I] * (7 - I)
	}
	DV := (11 - SOMA % 11) % 10
	return DV
}

func main() {
	var MATRIC_CPT string
	var MATRIC_SPT string
	var DVC, DVE int

	for {
		fmt.Print("Informe matricula no formato 999.999-9: ")
		fmt.Scanln(&MATRIC_CPT)
		if !validarMatricula(MATRIC_CPT) {
			fmt.Println("\nMatricula invalida. Tente novamente.\n")
		} else {
			break
		}
	}

	MATRIC_SPT = MATRIC_CPT
	MATRIC_SPT = removerCaractere(MATRIC_SPT, '.')
	MATRIC_SPT = removerCaractere(MATRIC_SPT, '-')
	DVC = mod11Check(MATRIC_SPT)
	MATRIC_INT := make([]int, 7)
	for I := 0; I <= 5; I++ {
		MATRIC_INT[I], _ = strconv.Atoi(string(MATRIC_SPT[I]))
	}
	DVE, _ = strconv.Atoi(string(MATRIC_SPT[6]))
	fmt.Println()
	if DVC == DVE {
		fmt.Println("Numero de matricula valido")
	} else {
		fmt.Println("Numero de matricula invalido")
	}
	fmt.Println()
	fmt.Print("Tecle <Enter> para encerrar...")
	fmt.Scanln()
}
