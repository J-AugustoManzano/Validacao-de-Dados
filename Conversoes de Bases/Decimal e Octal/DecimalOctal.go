package main

import (
	"fmt"
	"math"
)

const (
	LimiteMaximoDecimal uint32 = 2147483647
	LimiteMaximoOctal   uint32 = 017777777777
)

func DecimalParaOctal(decimal uint32) uint32 {
	var resto, potencia, octal uint32
	octal = 0
	potencia = 1
	for decimal > 0 {
		resto = decimal % 8
		octal += resto * potencia
		decimal /= 8
		potencia *= 10
	}
	return octal
}

func OctalParaDecimal(octal uint32) uint32 {
	var potencia, digito, decimal uint32
	decimal = 0
	potencia = 0
	for octal > 0 {
		digito = octal % 10
		decimal += digito * uint32(math.Pow(8, float64(potencia)))
		octal /= 10
		potencia++
	}
	return decimal
}

func IsValidOctal(octal uint32) bool {
	for octal > 0 {
		if octal%10 > 7 {
			return false
		}
		octal /= 10
	}
	return true
}

func main() {
	var opcao int
	var decimal, octal uint32
	for {
		fmt.Println("=========================")
		fmt.Println(" CONVERSOR DECIMAL-OCTAL ")
		fmt.Println("=========================")
		fmt.Println()
		fmt.Println("1 - Converter decimal para octal")
		fmt.Println("2 - Converter octal para decimal")
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
				fmt.Println("Valor em octal:", DecimalParaOctal(decimal))
			}
		case 2:
			fmt.Println()
			fmt.Printf("Digite um numero octal (ate %o): ", LimiteMaximoOctal)
			fmt.Scanln(&octal)
			if !IsValidOctal(octal) {
				fmt.Println("Valor octal invalido.")
			} else if octal > LimiteMaximoOctal {
				fmt.Println("Valor octal fora do limite permitido.")
			} else {
				fmt.Println("Valor em decimal:", OctalParaDecimal(octal))
			}
		}
		fmt.Println()
		if opcao == 0 {
			break
		}
	}
}
