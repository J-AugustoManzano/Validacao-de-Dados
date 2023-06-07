#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#include <ctype.h>

char TEXTO[100];

int main(void) {
  
  bool VALIDACAO = false;

  do {
    printf("Entre uma cadeia alfabetica: ");
    fgets(TEXTO, sizeof(TEXTO), stdin);
    TEXTO[strcspn(TEXTO, "\n")] = '\0';
    VALIDACAO = true;
    for (size_t I = 0; TEXTO[I] != '\0'; I++) {
      if (!isalpha(TEXTO[I]) && TEXTO[I] != ' ') {
        VALIDACAO = false;
        break;
      }
    }
    if (VALIDACAO  == false) {
      printf("Entrada invalida. Por favor, tente novamente.\n");
    } else {
      break;
    }
  } while (true);
  printf("Voce informou a cadeia: %s\n", TEXTO);
  return 0;
}
