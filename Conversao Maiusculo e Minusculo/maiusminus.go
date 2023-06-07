package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

func main() {
	reader := bufio.NewReader(os.Stdin)

	fmt.Print("Digite um texto .....: ")
	texto, _ := reader.ReadString('\n')
	texto = strings.TrimSpace(texto)

	textoMaiusculo := strings.ToUpper(texto)
	textoMinusculo := strings.ToLower(texto)

	fmt.Println("Texto em maiusculo ..: ", textoMaiusculo)
	fmt.Println("Texto em minusculo ..: ", textoMinusculo)
}
