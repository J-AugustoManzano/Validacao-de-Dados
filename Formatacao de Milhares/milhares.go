package main

import (
	"fmt"
	"strings"
)

func formataValor(valor string) string {
	var inteiro, decimal string
	// Verifica se o valor possui parte decimal
	if strings.Contains(valor, ".") {
		parts := strings.Split(valor, ".")
		inteiro = parts[0]
		decimal = parts[1]
	} else {
		inteiro = valor
		decimal = "00"
	}
	// Formata a parte inteira
	valorFormatado := ""
	for i := len(inteiro) - 1; i >= 0; i-- {
		valorFormatado = string(inteiro[i]) + valorFormatado
		if (len(inteiro)-i)%3 == 0 && i > 0 {
			valorFormatado = "." + valorFormatado
		}
	}
	// Concatena a parte decimal
	valorFormatado = valorFormatado + "," + decimal

	return valorFormatado
}

func main() {
	var valor string
	fmt.Print("Digite um valor real: ")
	fmt.Scanln(&valor)
	valorFormatado := formataValor(valor)
	fmt.Println("Valor formatado:", valorFormatado)
}
