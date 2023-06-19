/*
 * PRNG .......: Wichmann Hill
 * Ano ........: 1982
 * Autor ......: Brian A. Wichmann & David H. Hill
 */
 
#include <iostream>
#include <iomanip>
#include <cmath>
#include <ctime>

double WichmannHill(int& X) {
  X = (171 * X) % 30269;
  return std::abs(X / 30269.0);
}

int main() {
  std::cout << "GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)" << std::endl;
  std::cout << "PSEUDORANDOM NUMBER GENERATOR (PRNG)" << std::endl;
  std::cout << "PADRAO: Wichmann Hill" << std::endl;
  std::cout << "==========================================" << std::endl << std::endl;
  std::cout << "    Semente: 1234        Semente: TIME" << std::endl;
  std::cout << "    -------------        -------------" << std::endl;

  int i;
  double Xn1[10];
  double Xn2[10];
  int X1, X2;

  X1 = 1234;
  for (i = 0; i <= 9; i++) {
    Xn1[i] = WichmannHill(X1);
  }

  X2 = static_cast<int>(std::time(NULL));
  for (i = 0; i <= 9; i++) {
    Xn2[i] = WichmannHill(X2);
  }

  for (i = 0; i <= 9; i++) {
    std::cout.precision(11);
    std::cout << std::fixed << std::setw(17) << Xn1[i] << "        ";
    std::cout.precision(11);
    std::cout << std::fixed << std::setw(13) << Xn2[i] << std::endl;
  }

  return 0;
}
