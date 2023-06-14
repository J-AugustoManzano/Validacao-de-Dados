package main

import (
	"fmt"
	"os"
	"strconv"
)

var verhoeffD = [][]int{
    {0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
    {1, 2, 3, 4, 0, 6, 7, 8, 9, 5},
    {2, 3, 4, 0, 1, 7, 8, 9, 5, 6},
    {3, 4, 0, 1, 2, 8, 9, 5, 6, 7},
    {4, 0, 1, 2, 3, 9, 5, 6, 7, 8},
    {5, 9, 8, 7, 6, 0, 4, 3, 2, 1},
    {6, 5, 9, 8, 7, 1, 0, 4, 3, 2},
    {7, 6, 5, 9, 8, 2, 1, 0, 4, 3},
    {8, 7, 6, 5, 9, 3, 2, 1, 0, 4},
    {9, 8, 7, 6, 5, 4, 3, 2, 1, 0},
}

var verhoeffP = [][]int{
    {0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
    {1, 5, 7, 6, 2, 8, 3, 0, 9, 4},
    {5, 8, 0, 3, 7, 9, 6, 1, 4, 2},
    {8, 9, 1, 6, 0, 4, 3, 5, 2, 7},
    {9, 4, 5, 3, 1, 2, 6, 8, 7, 0},
    {4, 2, 8, 6, 5, 7, 3, 9, 0, 1},
    {2, 7, 9, 3, 8, 0, 6, 4, 1, 5},
    {7, 0, 4, 6, 9, 1, 3, 2, 5, 8},
}

var verhoeffInv = []int{0, 4, 3, 2, 1, 5, 6, 7, 8, 9}

func gerarVerhoeff(NUMERO string) int {
    DIGITO := 0
    TAMANHO := len(NUMERO)
    for I := 0; I < TAMANHO; I++ {
        POS := (I + 1) % 8
        NUM, _ := strconv.Atoi(string(NUMERO[TAMANHO - I - 1]))
        DIGITO = verhoeffD[DIGITO][verhoeffP[POS][NUM]]
    }
    return verhoeffInv[DIGITO]
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
	fmt.Println("Padrao: Verhoeff")
	fmt.Println("---------------------------------------------------------------")
	fmt.Println()

	fmt.Print("Aguarde ARQUIVO sendo gerado... ")

	for I := 0; I <= 999999; I++ {
		MATRICULA := formataMatricula(I)
		DV := gerarVerhoeff(MATRICULA)
		fmt.Fprintf(ARQUIVO, "%s.%s-%d\n", MATRICULA[:3], MATRICULA[3:], DV)
	}

	fmt.Println("\n\nSUCESSO: Arquivo gerado.\n")
}
