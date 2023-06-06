package main

import ("fmt"; "strconv")

var NUMERO int
var NUMERO_AUX string

func main() {
  for {
    fmt.Print("Entre um numero: ")
    fmt.Scanln(&NUMERO_AUX)
    if ACERTO, ERRO := strconv.Atoi(NUMERO_AUX); ERRO == nil {
      NUMERO = ACERTO
      break
    } else {
      fmt.Println("Entrada invalida. Por favor, tente novamente.")
    }
  }
  fmt.Printf("Voce informou o numero: %d\n", NUMERO)
}
