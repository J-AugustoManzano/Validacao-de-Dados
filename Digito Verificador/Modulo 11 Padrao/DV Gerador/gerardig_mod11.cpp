#include <iostream>
#include <cstring>
using namespace std;

bool validarMatricula(const char* matricula)
{
  if (strlen(matricula) != 7)
    return false;
  if (!isdigit(matricula[0]) || !isdigit(matricula[6]))
    return false;
  if (matricula[3] != '.')
    return false;
  for (int I = 1; I <= 2; I++)
    if (!isdigit(matricula[I]) || !isdigit(matricula[I + 4]))
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

char mod11(char MATRIC_CPT[])
{
  char MATRIC_SPT[8];
  int  MATRIC_INT[6];
  int  I, SOMA = 0;
  char DV;
  strcpy(MATRIC_SPT, MATRIC_CPT);
  removerCaractere(MATRIC_SPT, '.');
  for (I = 0; I <= 5; I++)
    MATRIC_INT[I] = MATRIC_SPT[I] - 48;
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
	
  char MATRICULA[8], DV;

  do
  {
    cout << "Informe matricula no formato 999.999: ";
    cin >> MATRICULA;
    cin.ignore(80, '\n'); 
    if (!validarMatricula(MATRICULA))
    {
      cout << endl;
      cout << "Matricula invalida. Tente novamente." << endl;
      cout << endl << endl;
    }
  } while (!validarMatricula(MATRICULA));

  DV = mod11(MATRICULA);
  cout << endl;
  cout << "Matricula com DV = " << MATRICULA << "-" << DV << endl;
  cout << endl;
  cout << "Tecle <Enter> para encerrar... ";
  cin.get();
  return 0;
}
