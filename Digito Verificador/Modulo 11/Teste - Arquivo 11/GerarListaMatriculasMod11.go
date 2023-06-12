package main

import (
	"fmt"
	"os"
)

func removerCaractere(CADEIA []byte, CARACTERE byte) {
	POS1 := 0
	POS2 := 0
	for CADEIA[POS1] != 0 {
		CADEIA[POS2] = CADEIA[POS1]
		if CADEIA[POS2] != CARACTERE {
			POS2++
		}
		POS1++
	}
	CADEIA[POS2] = 0
}

func mod11(MATRIC_CPT []byte) byte {
	MATRIC_SPT := make([]byte, 8)
	MATRIC_INT := make([]int, 6)
	SOMA := 0
	var DV byte
	copy(MATRIC_SPT, MATRIC_CPT)
	removerCaractere(MATRIC_SPT, '.')
	for I := 0; I <= 5; I++ {
		MATRIC_INT[I] = int(MATRIC_SPT[I]) - 48
	}
	for I := 0; I <= 5; I++ {
		SOMA += MATRIC_INT[I] * (7 - I)
	}
	if SOMA%11 == 0 {
		DV = 48 // DV = 0
	} else if SOMA%11 == 1 {
		DV = 88 // DV = X
	} else if SOMA%11 == 10 {
		DV = 49 // DV = 1
	} else {
		DV = byte(11 - (SOMA % 11) + 48)
	}
	return DV
}

func main() {
	MATRICULA := make([]byte, 12)
	ARQUIVO, err := os.Create("numeros.txt")
	if err != nil {
		fmt.Fprintln(os.Stderr, "Erro ao abrir o arquivo.")
		fmt.Println("Programa encerrado.")
		fmt.Println()
		return
	}

	fmt.Println("GERADOR DE NUMEROS DE MATRICULA DE 000.000 ATE 999.999 COM \"DV\"")
	fmt.Println("Padrao: Modulo 11")
	fmt.Println("---------------------------------------------------------------")
	fmt.Println()

	fmt.Print("Aguarde arquivo sendo gerado... ")

	for I := 0; I <= 999999; I++ {
		MATRICULA_STR := fmt.Sprintf("%06d", I)
		copy(MATRICULA, MATRICULA_STR)
		DV := mod11(MATRICULA)
		MATRICULA_FORMATADA := fmt.Sprintf("%s.%s-%c", MATRICULA_STR[:3], MATRICULA_STR[3:], DV)
		fmt.Fprintln(ARQUIVO, MATRICULA_FORMATADA)
	}

	ARQUIVO.Close()

	fmt.Println("\n\nSUCESSO: Arquivo gerado.\n")
}
