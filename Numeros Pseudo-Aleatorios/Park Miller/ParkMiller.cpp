/*
 * PRNG .......: Park-Miller
 * Ano ........: 1988
 * Autor ......: S. K. Park & K. W. Miller
*/

#include <iostream>
#include <iomanip>
#include <ctime>

unsigned int ParkMiller(unsigned int& X) {
    X = (16807 * X) % 2147483647;
    return X;
}

int main(void) {
  
    unsigned int Xn1, Xn2;
    int i;

    Xn1 = 1234;
    Xn2 = static_cast<unsigned int>(std::time(0));

    std::cout << "GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)" << std::endl;
    std::cout << "PSEUDORANDOM NUMBER GENERATOR (PRNG)" << std::endl;
    std::cout << "PADRAO: Park-Miller" << std::endl;
    std::cout << "==========================================" << std::endl;
    std::cout << std::endl;
    std::cout << "    Semente: 1234        Semente: TIME" << std::endl;
    std::cout << "    -------------        -------------" << std::endl;

    for (i = 1; i <= 10; i++) {
        std::cout << std::setw(17) << ParkMiller(Xn1);
        std::cout << std::setw(21) << ParkMiller(Xn2) << std::endl;
    }

    return 0;
}
