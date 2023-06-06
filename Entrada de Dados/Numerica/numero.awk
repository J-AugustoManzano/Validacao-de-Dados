#!/usr/bin/awk -f

BEGIN {
  NUMERO = 0
}

BEGIN {
  while (1) {
    printf("Entre um numero: ")
    fflush()
    if ((getline NUMERO_AUX < "/dev/tty") > 0) {
      if (NUMERO_AUX ~ /^[0-9]+$/) {
        NUMERO = NUMERO_AUX
        break
      } else {
        printf("Entrada invalida. Por favor, tente novamente.\n")
      }
    } else {
      printf("Erro ao ler a entrada. Por favor, tente novamente.\n")
    }
    fflush()
  }
  printf("Voce informou o numero: %d\n", NUMERO)
}
