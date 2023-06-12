#include <stdio.h>
#include <string.h>
#include <ctype.h>

int validarMatricula(char MATRICULA[]) {
  int TAMANHO = strlen(MATRICULA);
  if (TAMANHO != 9)
    return 0;
  if (MATRICULA[3] != '.' || MATRICULA[7] != '-')
    return 0;
  for (int I = 0; I < TAMANHO; I++)
    if (I != 3 && I != 7 && !isdigit(MATRICULA[I]))
      return 0;
  return 1;
}

void removerCaractere(char CADEIA[], char CARACTERE) {
  char *POS1 = CADEIA;
  char *POS2 = CADEIA;
  while (*POS1) {
    *POS2 = *POS1++;
    POS2 += (*POS2 != CARACTERE);
  }
  *POS2 = '\0';
}

char mod11Check(char MATRIC_CPT[]) {
  char MATRIC_SPT[10];
  int  MATRIC_INT[6];
  int  I, SOMA = 0;
  char DV;
  strcpy(MATRIC_SPT, MATRIC_CPT);
  removerCaractere(MATRIC_SPT, '.');
  for (I = 0; I <= 5; I++)
    MATRIC_INT[I] = MATRIC_SPT[I] - 48; // ASCII 48 = "0"
  for (I = 0; I <= 5; I++)
    SOMA += MATRIC_INT[I] * (7 - I);
  if ((SOMA % 11) == 0)
    DV = 48; // DV = 0
  if ((SOMA % 11) == 1)
    DV = 88; // DV = X
  if ((SOMA % 11) == 10)
    DV = 49; // DV = 1
  if ((11 - SOMA % 11) >= 2 && (11 - SOMA % 11) <= 9)
    DV = (11 - (SOMA % 11)) + 48;
  return DV;
}

int main(void) {
	
  char MATRICULA[10], DVC, DVE;

  do {
    printf("Informe matricula no formato 999.999-9: ");
    scanf("%s", MATRICULA);
    getchar();
    if (!validarMatricula(MATRICULA)) {
      printf("\n");
      printf("Matricula invalida. Tente novamente.\n");
      printf("\n\n");
    }
  } while (!validarMatricula(MATRICULA));

  DVC = mod11Check(MATRICULA);
  DVE = MATRICULA[8];
  printf("\n");
  if (DVC == toupper(DVE))
    printf("Numero de matricula valido\n");
  else
    printf("Numero de matricula invalido\n");
  printf("\n");
  printf("Tecle <Enter> para encerrar... ");
  getchar();
  return 0;
}
