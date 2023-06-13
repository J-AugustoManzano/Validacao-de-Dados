#include <iostream>
#include <cstring>
using namespace std;

bool validarMatricula(char MATRICULA[])
{
  int TAMANHO = strlen(MATRICULA);
  if (TAMANHO != 9)
    return false;
  if (MATRICULA[3] != '.' || MATRICULA[7] != '-')
    return false;
  for (int I = 0; I < TAMANHO; I++)
    if (I != 3 && I != 7 && !isdigit(MATRICULA[I]))
      return false;
  return true;
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

char mod11Check(char MATRIC_CPT[])
{
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

int main(void)
{
	
  char MATRICULA[10], DVC, DVE;

  do
  {
    cout << "Informe matricula no formato 999.999-9: ";
    cin >> MATRICULA;
    cin.ignore(80, '\n');
    if (!validarMatricula(MATRICULA))
    {
      cout << endl;
      cout << "Matricula invalida. Tente novamente." << endl;
      cout << endl << endl;
    }
  } while (!validarMatricula(MATRICULA));

  DVC = mod11Check(MATRICULA);
  DVE = MATRICULA[8];
  cout << endl;
  if (DVC == toupper(DVE))
    cout << "Numero de matricula valido" << endl;
  else
    cout << "Numero de matricula invalido" << endl;
  cout << endl;
  cout << "Tecle <Enter> para encerrar... ";
  cin.get();
  return 0;
}
