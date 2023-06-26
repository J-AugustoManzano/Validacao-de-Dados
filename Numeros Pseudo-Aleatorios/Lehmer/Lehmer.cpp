/* 
 PRNG .......: Lehmer (Metodo Congruencial Linear Multiplicativo)
 Ano ........: 1951
 Autor ......: Derrick Henry "Dick" Lehmer
*/

#include <iostream>
#include <iomanip>
#include <cstdlib>
#include <ctime>

long Lehmer(long& seed) {
    seed = (16807 * seed) % 2147483647;
    return seed;
}

int main(void) {

    long Xn1, Xn2;
    int i;

    Xn1 = 1234;
    Xn2 = static_cast<long>(time(nullptr));

    std::cout << "GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)\n";
    std::cout << "PSEUDORANDOM NUMBER GENERATOR (PRNG)\n";
    std::cout << "PADRAO: Lehmer\n";
    std::cout << "==========================================\n\n";
    std::cout << "    Semente: 1234        Semente: TIME\n";
    std::cout << "    -------------        -------------\n";

    for (i = 1; i <= 10; i++) {
        std::cout << std::setw(17) << std::right << Lehmer(Xn1);
        std::cout << std::setw(21) << std::right << Lehmer(Xn2);
        std::cout << '\n';
    }

    return 0;
}
