#include <stdio.h>
#include <limits.h>
#include <stdbool.h>

int NUMERO;

int main(void) {
  do {
    printf("Entre um numero: ");
    if (scanf("%d", &NUMERO) != true) {
      printf("Entrada invalida. Por favor, tente novamente.\n");
      scanf("%*[^\n]");  // Limpa o buffer de entrada
      scanf("%*c");  // Limpa o caractere '\n' restante
    }
    else {
      scanf("%*[^\n]");  // Limpa o buffer de entrada
      scanf("%*c");  // Limpa o caractere '\n' restante
      break;
    }
  } while (true);
  printf("Voce informou o numero: %d\n", NUMERO);
  return 0;
}
