package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

var (
	algarismosRomanos = []string{"I", "IV", "V", "IX", "X", "XL", "L", "XC", "C", "CD", "D", "CM", "M"}
	valoresDecimais   = []int{1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000}
	limiteMaximoDecimal = 3999
	limiteMaximoRomano = "MMMCMXCIX"
)

func decimalParaRomano(decimal int) string {
	romano := ""
	i := len(algarismosRomanos) - 1
	for decimal > 0 {
		if decimal >= valoresDecimais[i] {
			romano += algarismosRomanos[i]
			decimal -= valoresDecimais[i]
		} else {
			i--
		}
	}
	return romano
}

func romanoParaDecimal(romano string) int {
	romano = strings.ToUpper(romano)
	resultado := 0
	valorAnterior := 0
	valorEncontrado := false
	for i := len(romano) - 1; i >= 0; i-- {
		valorEncontrado = false
		for valorAtual := 0; valorAtual < len(algarismosRomanos); valorAtual++ {
			if string(romano[i]) == algarismosRomanos[valorAtual] {
				valorEncontrado = true
				if valorAtual < valorAnterior {
					resultado -= valoresDecimais[valorAtual]
				} else {
					resultado += valoresDecimais[valorAtual]
					valorAnterior = valorAtual
				}
				break
			}
		}
		if !valorEncontrado {
			resultado = 0
			break
		}
	}
	return resultado
}

func main() {
	scanner := bufio.NewScanner(os.Stdin)
	for {
		fmt.Println("==========================")
		fmt.Println(" CONVERSOR DECIMAL-ROMANO ")
		fmt.Println("==========================")
		fmt.Println()
		fmt.Println("1 - Converter decimal para romano")
		fmt.Println("2 - Converter romano para decimal")
		fmt.Println("0 - Sair")
		fmt.Println()
		fmt.Print("Digite a opcao desejada: ")
		scanner.Scan()
		opcao := scanner.Text()
		switch opcao {
		case "1":
			fmt.Println()
			fmt.Printf("Digite um numero decimal (ate %d): ", limiteMaximoDecimal)
			scanner.Scan()
			input := scanner.Text()
			var decimal int
			_, err := fmt.Sscanf(input, "%d", &decimal)
			if err != nil || decimal < 1 || decimal > limiteMaximoDecimal {
				fmt.Println("Valor decimal fora do limite permitido.")
			} else {
				fmt.Printf("Valor em algarismo romano: %s\n", decimalParaRomano(decimal))
			}
		case "2":
			fmt.Println()
			fmt.Printf("Digite um numero romano (ate %s): ", limiteMaximoRomano)
			scanner.Scan()
			romano := scanner.Text()
			if len(romano) == 0 || romanoParaDecimal(romano) == 0 {
				fmt.Println("Valor romano fora do limite permitido.")
			} else {
				fmt.Printf("Valor em decimal: %d\n", romanoParaDecimal(romano))
			}
		case "0":
			return
		}
		fmt.Println()
	}
}
