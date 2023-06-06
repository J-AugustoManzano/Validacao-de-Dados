BEGIN {
  printf("Entre uma cadeia alfabetica: ")
  getline TEXTO
  VALIDACAO = 1
  while (1) {
    for (I = 1; I <= length(TEXTO); I++) {
      CARACTERE = substr(TEXTO, I, 1)
      if (!((CARACTERE >= "A" && CARACTERE <= "Z") || 
            (CARACTERE >= "a" && CARACTERE <= "z") || 
            CARACTERE == " ")) {
        VALIDACAO = 0
        break
      }
    }
    if (VALIDACAO == 0) {
      printf("Entrada invalida. Por favor, tente novamente.\n")
      printf("Entre uma cadeia alfabetica: ")
      getline TEXTO
      VALIDACAO = 1
    } else {
      break
    }
  }
  printf("Voce informou a cadeia: %s\n", TEXTO)
}
