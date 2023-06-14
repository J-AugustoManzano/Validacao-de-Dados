#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

// Tabela de multiplicacao >>> d(j, k)
// k = 10 colunas
// j = 10 linhas
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

// Tabela de permutacao >>> p(pos, num)
// num = 10 colunas
// pos =  8 linhas (mod 8)
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

// Tabela de inversao >>> inv(j)
// j = 8 colunas
//     1 linha
int verhoeffInv[] = {0, 4, 3, 2, 1, 5, 6, 7, 8, 9};

// Gerar digito verificador no padrao Verhoeff
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

// Validar digito verificador no padrao Verhoeff
// Ultimo digito do numero fornecido
int validarVerhoeff(const char* NUMERO) {
  int DIGITO = 0, POS, NUM;
  int TAMANHO = strlen(NUMERO);
  for (int I = 0; I < TAMANHO; I++) {
    POS = I % 8;
    NUM = NUMERO[TAMANHO - I - 1] - 48;
    DIGITO = verhoeffD[DIGITO][verhoeffP[POS][NUM]];
  }
  return DIGITO == 0;
}

// Remove a mascara do numero
void removerMascara(const char *NUMERO, char *NUMERO_SMASC)
{
  int index = 0;
  int NUMERO_LEN = strlen(NUMERO);
  int ENCONTROU_PRIMEIRO_DIGITO = 0;
  for (int i = 0; i < NUMERO_LEN; i++)
  {
    char CARACTERE = NUMERO[i];
    if (CARACTERE == '.')
      ENCONTROU_PRIMEIRO_DIGITO = 1;
    else if (isdigit(CARACTERE))
    {
      if (!ENCONTROU_PRIMEIRO_DIGITO && CARACTERE == 48)
        continue;
      NUMERO_SMASC[index++] = CARACTERE;
    }
  }
  NUMERO_SMASC[index] = '\0';
}

int main(void)
{
  int DV;
  int entradaValida;
  char NUMERO[10];
  char NUMERO_COM_DV[12];
  char NUMERO_SEM_MASCARA_DV[10];
  char NUMERO_SMASC[10];
  
  entradaValida = 0;
  do
  {
    printf("Entre matricula no formato 999.999: ");
    scanf("%s", NUMERO);
    printf("\n");
    if (strlen(NUMERO) != 7 || NUMERO[3] != '.')
    {
      printf("\n");
      printf("Matricula invalida. Tente novamente.\n");
      printf("\n");
    }
    else
      entradaValida = 1;
  } while (!entradaValida);

  removerMascara(NUMERO, NUMERO_SMASC);
  DV = gerarVerhoeff(NUMERO_SMASC);
  printf("Digito verificador: %d\n", DV);
  printf("\n");

  entradaValida = 0;
  do
  {
    printf("Entre matricula e digito verificador no formato 999.999-9: ");
    scanf("%s", NUMERO_COM_DV);
    printf("\n");
    if (strlen(NUMERO_COM_DV) != 9 || NUMERO_COM_DV[3] != '.' || NUMERO_COM_DV[7] != '-')
    {
      printf("\n");
      printf("Matricula invalida. Tente novamente.\n");
      printf("\n");
    }
    else
      entradaValida = 1;
  } while (!entradaValida);

  removerMascara(NUMERO_COM_DV, NUMERO_SEM_MASCARA_DV);
  if (validarVerhoeff(NUMERO_SEM_MASCARA_DV))
    printf("Matricula valida.\n");
  else
    printf("Matricula invalida.\n");

  return 0;
}
