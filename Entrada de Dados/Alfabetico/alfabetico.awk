BEGIN {
  while (1) {
    printf("Entre uma cadeia alfabética: ")
    getline TEXTO
    VALIDACAO = 0
    for (I = 1; I <= length(TEXTO); I++) {
      CARACTERE = substr(TEXTO, I, 1)
      if ((CARACTERE >= "A" && CARACTERE <= "Z") || 
          (CARACTERE >= "a" && CARACTERE <= "z") || 
           CARACTERE == " ") {
        VALIDACAO = 1
        break
      }
    }
    if (VALIDACAO == 1) {
      break
    }
    printf("Entrada inválida. Por favor, tente novamente.\n")
  }
  printf("Você informou a cadeia: %s\n", TEXTO)
}
