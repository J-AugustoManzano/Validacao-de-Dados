package main

import (
  "fmt"
  "strings"
)

func VALIDA_HEXA(VALOR string) bool {
  for _, C := range VALOR {
    CARACTERE := strings.ToUpper(string(C))
    if !((CARACTERE >= "0" && CARACTERE <= "9") || (CARACTERE >= "A" && CARACTERE <= "F")) {
      return false
    }
  }
  return true
}

func main() {
  fmt.Println("")
  var VALOR_HEX string
  SAIR_LOOP := false
  for !SAIR_LOOP {
    fmt.Print("Entre valor hexadecimal de 4 caracteres: ")
    fmt.Scanln(&VALOR_HEX)
    VALOR_HEX = strings.TrimSpace(VALOR_HEX)
    if len(VALOR_HEX) != 4 {
      fmt.Println("Valor invalido, deve ter exatamente 4 caracteres.\n")
    } else if !VALIDA_HEXA(VALOR_HEX) {
      fmt.Println("Valor invalido, apenas caracteres [0-9] e [A-F].\n")
    } else {
      SAIR_LOOP = true
    }
  }
  VALOR_HEX_CONVERTIDO := ""
  for _, C := range VALOR_HEX {
    CARACTERE := strings.ToUpper(string(C))
    VALOR_HEX_CONVERTIDO += CARACTERE
  }
  fmt.Println("Valor fornecido: ", VALOR_HEX_CONVERTIDO, "\n")
}
