#include <iostream>
#include <iomanip>
#include <fstream>
#include <cstring>

void removerCaractere(char CADEIA[], char CARACTERE)
{
  char* POS1 = CADEIA;
  char* POS2 = CADEIA;
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
  else if ((SOMA % 11) == 1)
    DV = 88; // DV = X
  else if ((SOMA % 11) == 10)
    DV = 49; // DV = 1
  else
    DV = (11 - (SOMA % 11)) + 48;
  return DV;
}

int main(void) {
	
  std::string MATRICULA;
  char DV;
  int I;
  std::ofstream ARQUIVO("numeros.txt");
  
  std::cout << "GERADOR DE NUMEROS DE MATRICULA DE 000.000 ATE 999.999 COM \"DV\"" << std::endl;
  std::cout << "Padrao: Modulo 11" << std::endl;  
  std::cout << "---------------------------------------------------------------" << std::endl;
  std::cout << std::endl;

  if (not ARQUIVO) {
    std::cerr << "Erro ao abrir o arquivo." << std::endl;
    std::cout << "Programa encerrado." << std::endl;
    std::cout << std::endl;
    return 1;
  }

  std::cout << "Aguarde arquivo sendo gerado... ";

  for (I = 0; I <= 999999; I++) {
    MATRICULA = std::to_string(I);
    MATRICULA = std::string(6 - MATRICULA.length(), '0') + MATRICULA;
    MATRICULA = MATRICULA.substr(0, 3) + "." + MATRICULA.substr(3);
    DV = mod11(const_cast<char*>(MATRICULA.c_str()));
    ARQUIVO << MATRICULA << "-" << DV << std::endl;
  }

  ARQUIVO.close();

  std::cout << std::endl << std::endl;
  std::cout << "SUCESSO: Arquivo gerado." << std::endl;

  std::cout << std::endl;
  return 0;
}
