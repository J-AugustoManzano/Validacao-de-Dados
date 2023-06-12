#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char* formataMatricula(int MATRICULA) {
  char* str = (char*)malloc(7 * sizeof(char));
  snprintf(str, 7, "%06d", MATRICULA);
  return str;
}

int mod10(const char* MATRICULA) {
  int SOMA = 0;
  for (int I = 0; I < 6; I++) {
    int DIGITO = MATRICULA[I] - '0';
    if (I % 2 != 0 && DIGITO * 2 > 9)
      SOMA += DIGITO * 2 - 9;
    else if (I % 2 != 0 && DIGITO * 2 <= 9)
      SOMA += DIGITO * 2;
    else
      SOMA += DIGITO;
  }
  int DV = (SOMA % 10 == 0) ? 0 : 10 - SOMA % 10;
  return DV;
}

int main(void) {
	
  char MATRICULA_TEMP[10];
  int I;	
  FILE* ARQUIVO = fopen("numeros.txt", "w");

  printf("GERADOR DE NUMEROS DE MATRICULA DE 000.000 ATE 999.999 COM \"DV\"\n");
  printf("Padrao: Modulo 10\n");
  printf("---------------------------------------------------------------\n\n");
  
  if (ARQUIVO == NULL) {
    fprintf(stderr, "Erro ao abrir o arquivo.\n");
    printf("Programa encerrado.\n");
    return 1;
  }
  
  printf("Aguarde arquivo sendo gerado... ");
  
  for (I = 0; I <= 999999; I++) {
    snprintf(MATRICULA_TEMP, sizeof(MATRICULA_TEMP), "%s", formataMatricula(I));
    fprintf(ARQUIVO, "%.3s.%.3s-%d\n", MATRICULA_TEMP, MATRICULA_TEMP + 3, mod10(MATRICULA_TEMP));
  }
  
  fclose(ARQUIVO);
  
  printf("\n\nSUCESSO: Arquivo gerado.\n");
  
  return 0;
}
