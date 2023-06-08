package main

import (
	"fmt"
	"strconv"
)

const (
	LimiteMaximoDecimal uint32 = 2147483647
	LimiteMaximoBinario        = "1111111111111111111111111111111"
)

func DecimalParaBinario(decimal uint32) string {
	binario := ""
	for decimal > 0 {
		resto := decimal % 2
		binario = strconv.Itoa(int(resto)) + binario
		decimal /= 2
	}
	for len(binario) < 32 {
		binario = "0" + binario
	}
	return binario
}

func BinarioParaDecimal(binario string) uint32 {
	valor := uint32(0)
	for i := len(binario) - 1; i >= 0; i-- {
		if binario[i] == '1' {
			potencia := len(binario) - 1 - i
			valor += 1 << potencia
		}
	}
	return valor
}

func IsValidBinario(binario string) bool {
	for _, char := range binario {
		if char != '0' && char != '1' {
			return false
		}
	}
	return true
}

func main() {
	var opcao int
	var decimal uint32
	var binario string
	for {
		fmt.Println("===========================")
		fmt.Println(" CONVERSOR DECIMAL-BINARIO ")
		fmt.Println("===========================")
		fmt.Println()
		fmt.Println("1 - Converter decimal para binario")
		fmt.Println("2 - Converter binario para decimal")
		fmt.Println("0 - Sair")
		fmt.Println()
		fmt.Print("Digite a opcao desejada: ")
		fmt.Scanln(&opcao)
		switch opcao {
		case 1:
			fmt.Println()
			fmt.Printf("Digite um numero decimal (ate %d): ", LimiteMaximoDecimal)
			fmt.Scanln(&decimal)
			if decimal > LimiteMaximoDecimal {
				fmt.Println("Valor decimal fora do limite permitido.")
			} else {
				fmt.Println("Valor em binario:", DecimalParaBinario(decimal))
			}
		case 2:
			fmt.Println()
			fmt.Printf("Digite um numero binario (ate %s): ", LimiteMaximoBinario)
			fmt.Scanln(&binario)
			if !IsValidBinario(binario) {
				fmt.Println("Valor binario invalido.")
			} else if len(binario) > len(LimiteMaximoBinario) {
				fmt.Println("Valor binario fora do limite permitido.")
			} else {
				valor, _ := strconv.ParseUint(binario, 2, 32)
				fmt.Println("Valor em decimal:", valor)
			}
		}
		fmt.Println()
		if opcao == 0 {
			break
		}
	}
}
