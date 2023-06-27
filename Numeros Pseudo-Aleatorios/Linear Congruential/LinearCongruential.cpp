/* 
 PRNG .......: Linear Congruential
 Ano ........: 1965
 Autor ......: W. E. Thomson
*/

#include <iostream>
#include <iomanip>
#include <ctime>

double LinearCongruential(long long& seed) {
    const long long M = 2147483647;
    seed = (1664525 * seed + 1013904223) % M;
    return static_cast<double>(seed) / M;
}

int main(void) {
  
    long long Xn1 = 1234;
    long long Xn2 = static_cast<long long>(std::time(nullptr));

    std::cout << "GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)\n";
    std::cout << "PSEUDORANDOM NUMBER GENERATOR (PRNG)\n";
    std::cout << "PADRAO: Linear Congruential\n";
    std::cout << "==========================================\n\n";
    std::cout << "    Semente: 1234        Semente: TIME\n";
    std::cout << "    -------------        -------------\n";

    for (int i = 1; i <= 10; i++) {
        std::cout.precision(11);
        std::cout << std::fixed << std::setw(17);
        std::cout << LinearCongruential(Xn1) << "        ";
        std::cout << std::setw(13);
        std::cout << LinearCongruential(Xn2) << std::endl;
    }

    return 0;
}
