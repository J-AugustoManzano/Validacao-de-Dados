#include <stdio.h>
#include <stdbool.h>
#include <string.h>

char TEXTO[100];
size_t I;
bool VALIDACAO;
  
int main(void) {
  do {
    printf("Entre uma cadeia alfabetica: ");
    fgets(TEXTO, sizeof(TEXTO), stdin);
    TEXTO[strcspn(TEXTO, "\n")] = '\0';
    VALIDACAO = true;
    for (I = 0; I < strlen(TEXTO); I++) {
      char CARACTERE = TEXTO[I];
      if (!((CARACTERE >= 'A' && CARACTERE <= 'Z') || 
            (CARACTERE >= 'a' && CARACTERE <= 'z') || 
             CARACTERE == ' ')) {
        VALIDACAO = false;
        break;
      }
    }
    if (VALIDACAO == false) {
      printf("Entrada invalida. Por favor, tente novamente.\n");
    } else {
      break;
    }
  } while (true);
  printf("Voce informou a cadeia: %s\n", TEXTO);
  return 0;
}
