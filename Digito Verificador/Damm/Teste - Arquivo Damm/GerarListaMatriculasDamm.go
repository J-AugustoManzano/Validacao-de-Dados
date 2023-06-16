package main

import (
	"fmt"
	"os"
	"strconv"
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

func formataMatricula(MATRICULA int) string {
	return fmt.Sprintf("%06d", MATRICULA)
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
	fmt.Println("Padrao: Damm")
	fmt.Println("---------------------------------------------------------------")
	fmt.Println()

	fmt.Print("Aguarde ARQUIVO sendo gerado... ")

	for I := 0; I <= 999999; I++ {
		MATRICULA := formataMatricula(I)
		DV := gerarDamm(MATRICULA)
		fmt.Fprintf(ARQUIVO, "%s.%s-%d\n", MATRICULA[:3], MATRICULA[3:], DV)
	}

	fmt.Println("\n\nSUCESSO: Arquivo gerado.\n")
}
