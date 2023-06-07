package main

import (
  "bufio"
  "fmt"
  "os"
  "strings"
  "unicode"
)

func main() {
  entrada := bufio.NewReader(os.Stdin)

  var TEXTO string
  var VALIDACAO bool

  for {
    fmt.Print("Entre uma cadeia alfabética: ")
    TEXTO, _ = entrada.ReadString('\n')
    TEXTO = strings.TrimSpace(TEXTO)
    VALIDACAO = false
    for _, CARACTERE := range TEXTO {
      if unicode.IsLetter(CARACTERE) || unicode.IsSpace(CARACTERE) {
        VALIDACAO = true
        break
      }
    }
    if !VALIDACAO {
      fmt.Println("Entrada inválida. Por favor, tente novamente.")
    } else {
      break
    }
  }
  fmt.Println("Você informou a cadeia:", TEXTO)
}
