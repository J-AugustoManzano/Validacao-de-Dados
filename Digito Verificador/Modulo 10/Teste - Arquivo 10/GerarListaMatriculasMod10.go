package main

import (
	"fmt"
	"os"
)

func formataMatricula(matricula int) string {
	return fmt.Sprintf("%06d", matricula)
}

func mod10(matricula string) int {
	soma := 0
	for i := 0; i < 6; i++ {
		digito := int(matricula[i] - '0')
		if i%2 != 0 && digito*2 > 9 {
			soma += digito*2 - 9
		} else if i%2 != 0 && digito*2 <= 9 {
			soma += digito * 2
		} else {
			soma += digito
		}
	}
	dv := (soma % 10)
	if dv != 0 {
		dv = 10 - dv
	}
	return dv
}

func main() {
	arquivo, err := os.Create("numeros.txt")
	if err != nil {
		fmt.Println("Erro ao abrir o arquivo.")
		fmt.Println("Programa encerrado.")
		return
	}
	defer arquivo.Close()

	fmt.Println("GERADOR DE NUMEROS DE MATRICULA DE 000.000 ATE 999.999 COM \"DV\"")
	fmt.Println("Padrao: Modulo 10")
	fmt.Println("---------------------------------------------------------------")
	fmt.Println()

	fmt.Print("Aguarde arquivo sendo gerado... ")

	for i := 0; i <= 999999; i++ {
		matricula := formataMatricula(i)
		dv := mod10(matricula)
		fmt.Fprintf(arquivo, "%s.%s-%d\n", matricula[:3], matricula[3:], dv)
	}

	fmt.Println("\n\nSUCESSO: Arquivo gerado.\n")
}
