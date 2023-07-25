/*
 PRNG .......: Middle Square
 Ano ........: 1946
 Autor ......: John von Neumann
*/

#include <iostream>
#include <cstdlib>
#include <iomanip>
#include <ctime>

long int MeanSquare(long int& seed) {
    seed = (seed * seed / 100) % 10000;
    return seed >= 0 ? seed : -seed;
}

int main(void) {
  
    long int Xn1, Xn2;
    int i;

    Xn1 = 1234;
    Xn2 = time(NULL);

    std::cout << "GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)" << std::endl;
    std::cout << "PSEUDORANDOM NUMBER GENERATOR (PRNG)" << std::endl;
    std::cout << "PADRAO: Middle Square" << std::endl;
    std::cout << "==========================================" << std::endl << std::endl;
    std::cout << "    Semente: 1234        Semente: TIME" << std::endl;
    std::cout << "    -------------        -------------" << std::endl;

    for (i = 1; i <= 10; i++) {
        std::cout << std::setw(17) << MeanSquare(Xn1) << std::setw(21) << MeanSquare(Xn2) << std::endl;
    }

    return 0;
}
