/*
 PRNG .......: SplitMix64
 Ano ........: 2015
 Autor ......: Sebastiano Vigna
*/

// Fundamentado: rosettacode.org/wiki/Pseudo-random_numbers/Splitmix64

#include <iostream>
#include <cstdint>
#include <iomanip>
#include <ctime>

class SplitMix64 {
private:
    uint64_t state;

public:
    SplitMix64(uint64_t seed) {
        state = seed;
    }

    uint64_t nextInt() {
        state += 0x9e3779b97f4a7c15;
        uint64_t z = state;
        z = (z ^ (z >> 30)) * 0xbf58476d1ce4e5b9;
        z = (z ^ (z >> 27)) * 0x94d049bb133111eb;
        return z ^ (z >> 31);
    }

    double nextFloat() {
        return static_cast<double>(nextInt() >> 11) / (1LL << 53);
    }
};

int main(void) {
	
    SplitMix64 Xn1(1234);
    SplitMix64 Xn2(static_cast<uint64_t>(std::time(nullptr)));

    std::cout << "GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)" << std::endl;
    std::cout << "PSEUDORANDOM NUMBER GENERATOR (PRNG)" << std::endl;
    std::cout << "PADRAO: SplitMix64" << std::endl;
    std::cout << "===================================================" << std::endl;
    std::cout << std::endl;

    std::cout << "  Semente: 1234 (int)        Semente: TIME (int)" << std::endl;
    std::cout << "  --------------------       --------------------" << std::endl;
    for (int i = 1; i <= 5; i++) {
        std::cout << std::setw(22) << Xn1.nextInt();
        std::cout << std::setw(27) << Xn2.nextInt() << std::endl;
    }
    std::cout << std::endl;

    std::cout << "  Semente: 1234 (real)       Semente: TIME (real)" << std::endl;
    std::cout << "  --------------------       --------------------" << std::endl;
    for (int i = 1; i <= 5; i++) {
        std::cout << std::setw(22) << std::fixed << std::setprecision(18) << Xn1.nextFloat();
        std::cout << std::setw(27) << std::fixed << std::setprecision(18) << Xn2.nextFloat() << std::endl;
    }

    return 0;
}
