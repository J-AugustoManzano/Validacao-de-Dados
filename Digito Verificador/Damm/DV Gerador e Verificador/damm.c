#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#include <stdlib.h> 

const int dammTab[10][10] = {
  {0, 3, 1, 7, 5, 9, 8, 6, 4, 2},
  {7, 0, 9, 2, 1, 5, 4, 8, 6, 3},
  {4, 2, 0, 6, 8, 7, 1, 3, 5, 9},
  {1, 7, 5, 0, 9, 8, 3, 4, 2, 6},
  {6, 1, 2, 3, 0, 4, 5, 9, 7, 8},
  {3, 6, 7, 4, 2, 0, 9, 5, 8, 1},
  {5, 8, 6, 9, 7, 2, 0, 1, 3, 4},
  {8, 9, 4, 5, 3, 6, 2, 0, 1, 7},
  {9, 4, 3, 8, 6, 1, 7, 2, 0, 5},
  {2, 5, 8, 1, 4, 3, 6, 7, 9, 0}
};

int gerarDamm(const char* NUMERO) {
  int DV = 0, I;
  int TAMANHO = strlen(NUMERO);
  for (I = 0; I < TAMANHO; I++)
    DV = dammTab[DV][NUMERO[I] - '0'];
  return DV;
}

bool validarDamm(const char* NUMERO) {
  int DV = 0, I;
  int TAMANHO = strlen(NUMERO);
  for (I = 0; I < TAMANHO; I++)
    DV = dammTab[DV][NUMERO[I] - '0'];
  return DV == 0;
}

char* removerMascara(const char* NUMERO) {
  char* NUMERO_SMASC = (char*) malloc(sizeof(char) * (strlen(NUMERO) + 1));
  bool ENCONTROU_PRIMEIRO_DIGITO = false;
  int I, INDICE = 0;
  for (I = 0; NUMERO[I] != '\0'; I++) {
    char CARACTERE = NUMERO[I];
    if (CARACTERE == '.') {
      ENCONTROU_PRIMEIRO_DIGITO = true;
    } else if (CARACTERE >= '0' && CARACTERE <= '9') {
      if (!ENCONTROU_PRIMEIRO_DIGITO && CARACTERE == '0') {
        continue;
      }
      NUMERO_SMASC[INDICE++] = CARACTERE;
    }
  }
  NUMERO_SMASC[INDICE] = '\0';
  return NUMERO_SMASC;
}

int main(void) {
  bool entradaValida = false;
  char NUMERO[10];
  char NUMERO_COM_DV[12];
  char NUMERO_SEM_MASCARA_DV[10];
  char* NUMERO_SMASC;
  int DV;

  do {
    printf("Entre matricula no formato 999.999: ");
    scanf("%9s", NUMERO);
    printf("\n");
    if (strlen(NUMERO) != 7 || NUMERO[3] != '.') {
      printf("\nMatricula invalida. Tente novamente.\n\n");
    } else {
      entradaValida = true;
    }
  } while (!entradaValida);

  NUMERO_SMASC = removerMascara(NUMERO);
  DV = gerarDamm(NUMERO_SMASC);
  printf("Digito verificador: %d\n\n", DV);

  entradaValida = false;
  do {
    printf("Entre matricula e digito verificador no formato 999.999-9: ");
    scanf("%11s", NUMERO_COM_DV);
    printf("\n");
    if (strlen(NUMERO_COM_DV) != 9 || NUMERO_COM_DV[3] != '.' || NUMERO_COM_DV[7] != '-') {
      printf("\nMatricula invalida. Tente novamente.\n\n");
    } else {
      entradaValida = true;
    }
  } while (!entradaValida);

  strcpy(NUMERO_SEM_MASCARA_DV, removerMascara(NUMERO_COM_DV));
  if (validarDamm(NUMERO_SEM_MASCARA_DV)) {
    printf("Matricula valida.\n");
  } else {
    printf("Matricula invalida.\n");
  }

  return 0;
}
