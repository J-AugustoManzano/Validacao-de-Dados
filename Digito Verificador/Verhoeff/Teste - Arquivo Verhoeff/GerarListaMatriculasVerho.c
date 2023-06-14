#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int verhoeffD[10][10] = {
    {0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
    {1, 2, 3, 4, 0, 6, 7, 8, 9, 5},
    {2, 3, 4, 0, 1, 7, 8, 9, 5, 6},
    {3, 4, 0, 1, 2, 8, 9, 5, 6, 7},
    {4, 0, 1, 2, 3, 9, 5, 6, 7, 8},
    {5, 9, 8, 7, 6, 0, 4, 3, 2, 1},
    {6, 5, 9, 8, 7, 1, 0, 4, 3, 2},
    {7, 6, 5, 9, 8, 2, 1, 0, 4, 3},
    {8, 7, 6, 5, 9, 3, 2, 1, 0, 4},
    {9, 8, 7, 6, 5, 4, 3, 2, 1, 0}
};

int verhoeffP[8][10] = {
    {0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
    {1, 5, 7, 6, 2, 8, 3, 0, 9, 4},
    {5, 8, 0, 3, 7, 9, 6, 1, 4, 2},
    {8, 9, 1, 6, 0, 4, 3, 5, 2, 7},
    {9, 4, 5, 3, 1, 2, 6, 8, 7, 0},
    {4, 2, 8, 6, 5, 7, 3, 9, 0, 1},
    {2, 7, 9, 3, 8, 0, 6, 4, 1, 5},
    {7, 0, 4, 6, 9, 1, 3, 2, 5, 8}
};

int verhoeffInv[] = {0, 4, 3, 2, 1, 5, 6, 7, 8, 9};

int gerarVerhoeff(const char* NUMERO) {
  int DIGITO = 0, POS, NUM;
  int TAMANHO = strlen(NUMERO);
  for (int I = 0; I < TAMANHO; I++) {
    POS = (I + 1) % 8;
    NUM = NUMERO[TAMANHO - I - 1] - 48; // ASCII 48 = '0'
    DIGITO = verhoeffD[DIGITO][verhoeffP[POS][NUM]];
  }
  return verhoeffInv[DIGITO];
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
  printf("Padrao: Verhoeff\n");
  printf("---------------------------------------------------------------\n\n");
  
  if (ARQUIVO == NULL) {
    fprintf(stderr, "Erro ao abrir o arquivo.\n");
    printf("Programa encerrado.\n");
    return 1;
  }
  
  printf("Aguarde arquivo sendo gerado... ");
  
  for (I = 0; I <= 999999; I++) {
    snprintf(MATRICULA_TEMP, sizeof(MATRICULA_TEMP), "%s", formataMatricula(I));
    fprintf(ARQUIVO, "%.3s.%.3s-%d\n", MATRICULA_TEMP, MATRICULA_TEMP + 3, gerarVerhoeff(MATRICULA_TEMP));
  }
  
  fclose(ARQUIVO);
  
  printf("\n\nSUCESSO: Arquivo gerado.\n");
  
  return 0;
}
