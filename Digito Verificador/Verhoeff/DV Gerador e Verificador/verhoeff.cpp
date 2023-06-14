#include <iostream>
#include <string>
#include <cstring>

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
int gerarVerhoeff(const std::string& NUMERO) {
  int DIGITO = 0, POS, NUM;
  int TAMANHO = NUMERO.length();
  for (int I = 0; I < TAMANHO; I++) {
    POS = (I + 1) % 8;
    NUM = NUMERO[TAMANHO - I - 1] - 48;
    DIGITO = verhoeffD[DIGITO][verhoeffP[POS][NUM]];
  }
  return verhoeffInv[DIGITO];
}

// Validar digito verificador no padrao Verhoeff
// Ultimo digito do numero fornecido
bool validarVerhoeff(const std::string& NUMERO) {
  int DIGITO = 0, POS, NUM;
  int TAMANHO = NUMERO.length();
  for (int I = 0; I < TAMANHO; I++) {
    POS = I % 8;
    NUM = NUMERO[TAMANHO - I - 1] - 48; // ASCII 48 = '0'
    DIGITO = verhoeffD[DIGITO][verhoeffP[POS][NUM]];
  }
  return DIGITO == 0;
}

// Remove a mascara do numero
std::string removerMascara(const std::string &NUMERO)
{
  std::string NUMERO_SMASC;
  bool ENCONTROU_PRIMEIRO_DIGITO = false;
  for (char CARACTERE : NUMERO)
  {
    if (CARACTERE == '.')
      ENCONTROU_PRIMEIRO_DIGITO = true;
    else if (std::isdigit(CARACTERE))
    {
      if (not ENCONTROU_PRIMEIRO_DIGITO and CARACTERE == 48)
        continue;
      NUMERO_SMASC += CARACTERE;
    }
  }
  return NUMERO_SMASC;
}

int main(void)
{
  int DV;
  bool entradaValida;
  std::string NUMERO;
  std::string NUMERO_COM_DV;
  std::string NUMERO_SEM_MASCARA_DV;
  std::string NUMERO_SMASC;

  entradaValida = false;
  do
  {
    std::cout << "Entre matricula no formato 999.999: ";
    std::cin >> NUMERO;
    std::cout << std::endl;
    if (NUMERO.length() != 7 || NUMERO[3] != '.')
    {
      std::cout << std::endl;		
      std::cout << "Matricula invalida. Tente novamente." << std::endl;
      std::cout << std::endl;
    }
    else
      entradaValida = true;
  } while (!entradaValida);

  NUMERO_SMASC = removerMascara(NUMERO);
  DV = gerarVerhoeff(NUMERO_SMASC);
  std::cout << "Digito verificador: " << DV << std::endl;
  std::cout << std::endl;

  entradaValida = false;
  do
  {
    std::cout << "Entre matricula e digito verificador no formato 999.999-9: ";
    std::cin >> NUMERO_COM_DV;
    std::cout << std::endl;
    if (NUMERO_COM_DV.length() != 9 || NUMERO_COM_DV[3] != '.' || NUMERO_COM_DV[7] != '-')
    {
      std::cout << std::endl;		
      std::cout << "Matricula invalida. Tente novamente." << std::endl;
      std::cout << std::endl;
    }
    else
      entradaValida = true;
  } while (!entradaValida);

  NUMERO_SEM_MASCARA_DV = removerMascara(NUMERO_COM_DV);
  if (validarVerhoeff(NUMERO_SEM_MASCARA_DV))
    std::cout << "Matricula valida." << std::endl;
  else
    std::cout << "Matricula invalida." << std::endl;

  return 0;
}
