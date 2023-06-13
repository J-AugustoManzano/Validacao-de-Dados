// GerarMatricula
#include <iostream>
#include <cstring>
using namespace std;

bool validarMatricula(const char* MATRICULA)
{
  if (strlen(MATRICULA) != 7)
    return false;
  if (!isdigit(MATRICULA[0]) || !isdigit(MATRICULA[6]))
    return false;
  if (MATRICULA[3] != '.')
    return false;
  for (int I = 1; I <= 2; I++)
    if (!isdigit(MATRICULA[I]) || !isdigit(MATRICULA[I + 4]))
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

int mod10(const char* MATRICULA)
{
  int MATRIC_INT[6];
  int SOMA = 0;
  for (int I = 0; I <= 5; I++)
    MATRIC_INT[I] = MATRICULA[I] - 48; // ASC 48 = "0"
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
    cout << "Informe matricula no formato 999.999: ";
    cin >> MATRIC_CPT;
    cin.ignore(80, '\n');
    if (!validarMatricula(MATRIC_CPT))
    {
      cout << endl;
      cout << "Matricula invalida. Tente novamente." << endl;
      cout << endl << endl;
    }
  } while (!validarMatricula(MATRIC_CPT));
  
  strcpy(MATRIC_SPT, MATRIC_CPT);
  removerCaractere(MATRIC_SPT, '.');
  DV = mod10(MATRIC_SPT);
  cout << endl;
  cout << "Matricula com DV = " << MATRIC_CPT << "-" << DV << endl;
  cout << endl;
  cout << "Tecle <Enter> para encerrar... ";
  cin.get();
  return 0;
}
