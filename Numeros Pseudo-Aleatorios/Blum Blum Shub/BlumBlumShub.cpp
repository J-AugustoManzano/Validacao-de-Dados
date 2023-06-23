/* 
 * PRNG .......: Blum-Blum-Shub
 * Ano ........: 1986
 * Autor ......: L. Blum, M. Blum & M. Shub
*/

#include <iostream>
#include <cmath>
#include <ctime>
#include <iomanip>

unsigned int BlumBlumShub(unsigned int& X) {
  X = (X * X) % 2467246241;
  return std::labs(X);
}

unsigned int Xn1[10];
unsigned int Xn2[10];
unsigned int X1, X2;

int main(void) {
	
  std::cout << "GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)\n";
  std::cout << "PSEUDORANDOM NUMBER GENERATOR (PRNG)\n";
  std::cout << "PADRAO: Blum-Blum-Shub\n";
  std::cout << "==========================================\n\n";
  std::cout << "    Semente: 1234        Semente: TIME\n";
  std::cout << "    -------------        -------------\n";

  X1 = 1234;
  X2 = static_cast<unsigned int>(std::time(nullptr));

  for (int i = 0; i <= 9; i++) {
    Xn1[i] = BlumBlumShub(X1);
    Xn2[i] = BlumBlumShub(X2);    
    std::cout << std::setw(17) << Xn1[i] << "        " << std::setw(13) << Xn2[i] << "\n";
  }

  return 0;
}
