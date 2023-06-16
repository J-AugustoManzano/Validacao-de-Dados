#include <stdio.h>
#include <stdlib.h>
#include <string.h>

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

char* formataMatricula(int MATRICULA) {
  char* str = (char*)malloc(7 * sizeof(char));
  snprintf(str, 7, "%06d", MATRICULA);
  return str;
}

int main(void) {
	
  char MATRICULA_TEMP[10];
  int I;	
  FILE* ARQUIVO = fopen("numeros.txt", "w");

  printf("GERADOR DE NUMEROS DE MATRICULA DE 000.000 ATE 999.999 COM \"DV\"\n");
  printf("Padrao: Damm\n");
  printf("---------------------------------------------------------------\n\n");
  
  if (ARQUIVO == NULL) {
    fprintf(stderr, "Erro ao abrir o arquivo.\n");
    printf("Programa encerrado.\n");
    return 1;
  }
  
  printf("Aguarde arquivo sendo gerado... ");
  
  for (I = 0; I <= 999999; I++) {
    snprintf(MATRICULA_TEMP, sizeof(MATRICULA_TEMP), "%s", formataMatricula(I));
    fprintf(ARQUIVO, "%.3s.%.3s-%d\n", MATRICULA_TEMP, MATRICULA_TEMP + 3, gerarDamm(MATRICULA_TEMP));
  }
  
  fclose(ARQUIVO);
  
  printf("\n\nSUCESSO: Arquivo gerado.\n");
  
  return 0;
}
