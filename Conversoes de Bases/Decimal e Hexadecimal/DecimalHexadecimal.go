package main

import (
	"fmt"
	"math"
	"strconv"
	"strings"
)

const (
	LimiteMaximoDecimal     uint32 = 2147483647
	LimiteMaximoHexadecimal        = "7FFFFFFF"
)

func DecimalParaHexadecimal(decimal uint32) string {
	hexadecimal := ""
	for decimal > 0 {
		resto := decimal % 16
		switch {
		case resto >= 0 && resto <= 9:
			hexadecimal = string(rune(resto+48)) + hexadecimal
		case resto >= 10 && resto <= 15:
			hexadecimal = string(rune(resto-10+65)) + hexadecimal
		}
		decimal /= 16
	}
	return hexadecimal
}

func HexadecimalParaDecimal(hexadecimal string) uint32 {
	potencia := 0
	decimal := uint32(0)
	for i := len(hexadecimal) - 1; i >= 0; i-- {
		digito := strings.ToUpper(string(hexadecimal[i]))
		switch {
		case digito >= "0" && digito <= "9":
			d, _ := strconv.Atoi(digito)
			decimal += uint32(d) * uint32(math.Pow(16, float64(potencia)))
		case digito >= "A" && digito <= "F":
			decimal += uint32(digito[0]-55) * uint32(math.Pow(16, float64(potencia)))
		}
		potencia++
	}
	return decimal
}

func IsValidHexadecimal(hexadecimal string) bool {
	for _, char := range hexadecimal {
		if !strings.Contains("0123456789ABCDEFabcdef", string(char)) {
			return false
		}
	}
	return true
}

func main() {
	var opcao int
	var decimal uint32
	var hexadecimal string
	for {
		fmt.Println("===============================")
		fmt.Println(" CONVERSOR DECIMAL-HEXADECIMAL ")
		fmt.Println("===============================")
		fmt.Println()
		fmt.Println("1 - Converter decimal para hexadecimal")
		fmt.Println("2 - Converter hexadecimal para decimal")
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
				fmt.Println("Valor em hexadecimal:", DecimalParaHexadecimal(decimal))
			}
		case 2:
			fmt.Println()
			fmt.Printf("Digite um numero hexadecimal (ate %s): ", LimiteMaximoHexadecimal)
			fmt.Scanln(&hexadecimal)
			if !IsValidHexadecimal(hexadecimal) {
				fmt.Println("Valor hexadecimal invalido.")
			} else if HexadecimalParaDecimal(hexadecimal) > LimiteMaximoDecimal {
				fmt.Println("Valor hexadecimal fora do limite permitido.")
			} else {
				fmt.Println("Valor em decimal:", HexadecimalParaDecimal(hexadecimal))
			}
		case 0:
			return
		}
		fmt.Println()
	}
}
