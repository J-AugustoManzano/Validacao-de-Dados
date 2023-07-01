#include <iostream>
#include <cstdlib>
#include <iomanip>
#include <ctime>

/* 
   PRNG .......: Linear-Feedback Shift Register (LFSR)
   Ano ........: 1965
   Autor ......: R. C. Tausworthe
*/

double lfsr(unsigned int& state) {
    state = (state >> 1) ^ (0xB4BCD35C * (state & 1));
    return static_cast<double>(state) / 4294967296.0;
}

int main() {
    unsigned int Xn1, Xn2;
    int i;

    Xn1 = 0x1234;
    Xn2 = static_cast<unsigned int>(std::time(NULL));

    std::cout << "GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)\n";
    std::cout << "PSEUDORANDOM NUMBER GENERATOR (PRNG)\n";
    std::cout << "PADRAO: Linear-Feedback Shift Register\n";
    std::cout << "==========================================\n\n";
    std::cout << "    Semente: 1234        Semente: TIME\n";
    std::cout << "    -------------        -------------\n";

    for (i = 1; i <= 10; i++) {
        std::cout << std::fixed;
        std::cout.precision(11);
        std::cout << std::setw(17) << lfsr(Xn1) << "        " << std::setw(13) << lfsr(Xn2) << "\n";
    }

    return 0;
}
