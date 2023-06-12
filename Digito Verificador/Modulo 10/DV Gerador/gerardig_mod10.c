// GerarMatricula
#include <stdio.h>
#include <string.h>
#include <ctype.h>

int validarMatricula(const char* MATRICULA)
{
  if (strlen(MATRICULA) != 7)
    return 0;
  if (!isdigit(MATRICULA[0]) || !isdigit(MATRICULA[6]))
    return 0;
  if (MATRICULA[3] != '.')
    return 0;
  for (int I = 1; I <= 2; I++)
    if (!isdigit(MATRICULA[I]) || !isdigit(MATRICULA[I + 4]))
      return 0;
  return 1;
}

void removerCaractere(char CADEIA[], char CARACTERE)
{
  char *POS1 = CADEIA;
  char *POS2 = CADEIA;
  while (*POS1)
  {
    *POS2 = *POS1++;
    POS2 += (*POS2 != CARACTERE);
  }
  *POS2 = '\0';
}

int mod10(const char* MATRICULA)
{
  int MATRIC_INT[6];
  int SOMA = 0;
  for (int I = 0; I <= 5; I++)
    MATRIC_INT[I] = MATRICULA[I] - 48;  // ASC 48 = "0"
  for (int I = 0; I <= 5; I++)
  {
    if (I % 2 != 0 && MATRIC_INT[I] * 2 > 9)
      SOMA += MATRIC_INT[I] * 2 - 9;
    else if (I % 2 != 0 && MATRIC_INT[I] * 2 <= 9)
      SOMA += MATRIC_INT[I] * 2;
    if (I % 2 == 0)
      SOMA += MATRIC_INT[I];
  }
  int DV = (SOMA / 10 + 1) * 10 - SOMA;
  return DV;
}

int main(void)
{
  
  char MATRIC_CPT[8];
  char MATRIC_SPT[8];
  int DV;

  do
  {
    printf("Informe matricula no formato 999.999: ");
    scanf("%s", MATRIC_CPT);
    getchar();
    if (!validarMatricula(MATRIC_CPT))
    {
      printf("\n");
      printf("Matricula invalida. Tente novamente.\n");
      printf("\n\n");
    }
  } while (!validarMatricula(MATRIC_CPT));
  
  strcpy(MATRIC_SPT, MATRIC_CPT);
  removerCaractere(MATRIC_SPT, '.');
  DV = mod10(MATRIC_SPT);
  printf("\n");
  printf("Matricula com DV = %s-%d\n", MATRIC_CPT, DV);
  printf("\n");
  printf("Tecle <Enter> para encerrar... ");
  getchar();
  return 0;
}
