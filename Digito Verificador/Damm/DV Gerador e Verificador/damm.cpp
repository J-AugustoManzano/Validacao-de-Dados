#include <iostream>
#include <string>

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

int gerarDamm(const std::string& NUMERO) {
  int DV = 0;
  for (size_t I = 0; I < NUMERO.length(); I++) {
    DV = dammTab[DV][NUMERO[I] - '0'];
  }
  return DV;
}

bool validarDamm(const std::string& NUMERO) {
  int DV = 0;
  for (size_t I = 0; I < NUMERO.length(); I++) {
    DV = dammTab[DV][NUMERO[I] - '0'];
  }
  return DV == 0;
}

std::string removerMascara(const std::string& NUMERO) {
  std::string NUMERO_SMASC = "";
  bool ENCONTROU_PRIMEIRO_DIGITO = false;
  for (char CARACTERE : NUMERO) {
    if (CARACTERE == '.') {
      ENCONTROU_PRIMEIRO_DIGITO = true;
    } else if (CARACTERE >= '0' && CARACTERE <= '9') {
      if (not ENCONTROU_PRIMEIRO_DIGITO && CARACTERE == '0') {
        continue;
      }
      NUMERO_SMASC += CARACTERE;
    }
  }

  return NUMERO_SMASC;
}

int main(void) {
  bool entradaValida = false;
  std::string NUMERO, NUMERO_COM_DV, NUMERO_SEM_MASCARA_DV, NUMERO_SMASC;
  int DV;

  do {
    std::cout << "Entre matricula no formato 999.999: ";
    std::cin >> NUMERO;
    std::cout << std::endl;
    if (NUMERO.length() != 7 || NUMERO[3] != '.') {
      std::cout << std::endl;
      std::cout << "Matricula invalida. Tente novamente." << std::endl;
      std::cout << std::endl;
    } else {
      entradaValida = true;
    }
  } while (not entradaValida);

  NUMERO_SMASC = removerMascara(NUMERO);
  DV = gerarDamm(NUMERO_SMASC);
  std::cout << "Digito verificador: " << DV << std::endl;
  std::cout << std::endl;

  entradaValida = false;
  do {
    std::cout << "Entre matricula e digito verificador no formato 999.999-9: ";
    std::cin >> NUMERO_COM_DV;
    std::cout << std::endl;
    if (NUMERO_COM_DV.length() != 9 || NUMERO_COM_DV[3] != '.' || NUMERO_COM_DV[7] != '-') {
      std::cout << std::endl;
      std::cout << "Matricula invalida. Tente novamente." << std::endl;
      std::cout << std::endl;
    } else {
      entradaValida = true;
    }
  } while (not entradaValida);

  NUMERO_SEM_MASCARA_DV = removerMascara(NUMERO_COM_DV);
  if (validarDamm(NUMERO_SEM_MASCARA_DV)) {
    std::cout << "Matricula valida." << std::endl;
  } else {
    std::cout << "Matricula invalida." << std::endl;
  }

  return 0;
}
