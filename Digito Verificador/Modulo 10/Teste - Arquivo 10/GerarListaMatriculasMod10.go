package main

import (
	"fmt"
	"os"
)

func formataMatricula(MATRICULA int) string {
	return fmt.Sprintf("%06d", MATRICULA)
}

func mod10(MATRICULA string) int {
	SOMA := 0
	for I := 0; I <= 5; I++ {
		DIGITO := int(MATRICULA[I] - '0')
		if I % 2 != 0 && DIGITO * 2 > 9 {
			SOMA += DIGITO * 2 - 9
		} else if I % 2 != 0 && DIGITO * 2 <= 9 {
			SOMA += DIGITO * 2
		} else {
			SOMA += DIGITO
		}
	}
	DV := (SOMA % 10)
	if DV != 0 {
		DV = 10 - DV
	}
	return DV
}

func main() {
	ARQUIVO, ERRO := os.Create("numeros.txt")
	if ERRO != nil {
		fmt.Println("Erro ao abrir o ARQUIVO.")
		fmt.Println("Programa encerrado.")
		return
	}
	defer ARQUIVO.Close()

	fmt.Println("GERADOR DE NUMEROS DE MATRICULA DE 000.000 ATE 999.999 COM \"DV\"")
	fmt.Println("Padrao: Modulo 10")
	fmt.Println("---------------------------------------------------------------")
	fmt.Println()

	fmt.Print("Aguarde ARQUIVO sendo gerado... ")

	for I := 0; I <= 999999; I++ {
		MATRICULA := formataMatricula(I)
		DV := mod10(MATRICULA)
		fmt.Fprintf(ARQUIVO, "%s.%s-%d\n", MATRICULA[:3], MATRICULA[3:], DV)
	}

	fmt.Println("\n\nSUCESSO: Arquivo gerado.\n")
}
