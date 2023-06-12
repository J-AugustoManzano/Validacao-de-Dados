// GerarMatricula
package main

import (
	"fmt"
	"strconv"
	"strings"
	"unicode"
)

func validarMatricula(MATRICULA string) bool {
	if len(MATRICULA) != 7 {
		return false
	}
	if !isdigit(MATRICULA[0]) || !isdigit(MATRICULA[6]) {
		return false
	}
	if MATRICULA[3] != '.' {
		return false
	}
	for I := 1; I <= 2; I++ {
		if !isdigit(MATRICULA[I]) || !isdigit(MATRICULA[I + 4]) {
			return false
		}
	}
	return true
}

func removerCaractere(CADEIA string, CARACTERE string) string {
	return strings.Replace(CADEIA, CARACTERE, "", -1)
}

func mod10(MATRICULA string) int {
	SOMA := 0
	for I := 0; I <= 5; I++ {
		DIGITO, _ := strconv.Atoi(string(MATRICULA[I]))
		if I % 2 != 0 && DIGITO * 2 > 9 {
			SOMA += DIGITO*2 - 9
		} else if I % 2 != 0 && DIGITO * 2 <= 9 {
			SOMA += DIGITO * 2
		} else {
			SOMA += DIGITO
		}
	}
	DV := (SOMA / 10 + 1) * 10 - SOMA
	return DV
}

func isdigit(CARACTERE uint8) bool {
	return unicode.IsDigit(rune(CARACTERE))
}

func main() {
	var MATRIC_CPT string
	var MATRIC_SPT string
	var MATRIC_INT [6]int
	var I, DV int

	for {
		fmt.Print("Informe matricula no formato 999.999: ")
		fmt.Scanln(&MATRIC_CPT)
		if !validarMatricula(MATRIC_CPT) {
			fmt.Println()
			fmt.Println("Matricula invalida. Tente novamente.\n")
			fmt.Println()
			continue
		}
		break
	}
	
	MATRIC_SPT = MATRIC_CPT
	MATRIC_SPT = removerCaractere(MATRIC_SPT, ".")
	for I = 0; I <= 5; I++ {
		MATRIC_INT[I], _ = strconv.Atoi(string(MATRIC_SPT[I]))
	}
	DV = mod10(MATRIC_SPT)
	fmt.Println()
	fmt.Printf("Matricula com DV = %s-%d\n", MATRIC_CPT, DV)
	fmt.Println()
	fmt.Println("Tecle <Enter> para encerrar...")
	fmt.Scanln()
}
