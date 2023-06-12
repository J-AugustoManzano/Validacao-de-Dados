// ValidarMatricula
package main

import (
	"fmt"
	"strings"
 	"strconv"
)

func ValidarMatricula(MATRICULA string) bool {
	if len(MATRICULA) != 9 {
		return false
	}
	if !(MATRICULA[0] >= '0' && MATRICULA[0] <= '9') || !(MATRICULA[1] >= '0' && MATRICULA[1] <= '9') || !(MATRICULA[2] >= '0' && MATRICULA[2] <= '9') {
		return false
	}
	if MATRICULA[3] != '.' {
		return false
	}
	if !(MATRICULA[4] >= '0' && MATRICULA[4] <= '9') || !(MATRICULA[5] >= '0' && MATRICULA[5] <= '9') || !(MATRICULA[6] >= '0' && MATRICULA[6] <= '9') {
		return false
	}
	if MATRICULA[7] != '-' {
		return false
	}
	if !(MATRICULA[8] >= '0' && MATRICULA[8] <= '9') {
		return false
	}
	return true
}

func RemoverCaractere(CADEIA string, CARACTERE byte) string {
	return strings.ReplaceAll(CADEIA, string(CARACTERE), "")
}

func Mod10Check(MATRICULA string) int {
	MATRIC_INT := make([]int, 6)
	SOMA := 0
	DV := 0
	for i := 0; i < 6; i++ {
		MATRIC_INT[i] = int(MATRICULA[i] - '0')
	}
	for i := 0; i < 6; i++ {
		if (i+1)%2 == 0 {
			if MATRIC_INT[i]*2 > 9 {
				SOMA += MATRIC_INT[i]*2 - 9
			} else {
				SOMA += MATRIC_INT[i] * 2
			}
		} else {
			SOMA += MATRIC_INT[i]
		}
	}
	DV = (10 - (SOMA % 10)) % 10
	return DV
}

func main() {
	var MATRIC_CPT string
	var MATRIC_SPT string
	MATRIC_INT := make([]int, 7)
	var DVC, DVE int

	for {
		fmt.Print("Informe a matricula no formato 999.999-9: ")
		fmt.Scanln(&MATRIC_CPT)
		if !ValidarMatricula(MATRIC_CPT) {
			fmt.Println("\nEntrada invalida, tente novamente.\n\n")
		} else {
			break
		}
	}

	MATRIC_SPT = MATRIC_CPT
	MATRIC_SPT = RemoverCaractere(MATRIC_SPT, '.')
	MATRIC_SPT = RemoverCaractere(MATRIC_SPT, '-')

	DVC = Mod10Check(MATRIC_SPT)

	for i := 0; i < 7; i++ {
		MATRIC_INT[i], _ = strconv.Atoi(string(MATRIC_SPT[i]))
	}

	DVE = MATRIC_INT[6]

	fmt.Println()
	if DVC == DVE {
		fmt.Println("Matricula valida.")
	} else {
		fmt.Println("Matricula invalida.")
	}
	fmt.Println()

	fmt.Print("Pressione <Enter> para encerrar...")
	fmt.Scanln()
}
