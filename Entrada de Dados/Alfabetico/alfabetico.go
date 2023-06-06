package main

import (
  "bufio"
  "fmt"
  "os"
  "strings"
)

func main() {
  reader := bufio.NewReader(os.Stdin)
  
  var TEXTO string
  var VALIDACAO bool

  for {
    fmt.Print("Entre uma cadeia alfabética: ")
    TEXTO, _ = reader.ReadString('\n')
    TEXTO = strings.TrimSpace(TEXTO)
    VALIDACAO = true
    for _, CARACTERE := range TEXTO {
      if !((CARACTERE >= 'A' && CARACTERE <= 'Z') ||
           (CARACTERE >= 'a' && CARACTERE <= 'z') ||
            CARACTERE == ' ') {
        VALIDACAO = false
        break
      }
    }
    if (VALIDACAO == false) {
      fmt.Println("Entrada inválida. Por favor, tente novamente.")
    } else {
      break
    }
  }
  fmt.Println("Você informou a cadeia:", TEXTO)
}
