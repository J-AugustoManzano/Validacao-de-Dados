/*
 PRNG .......: Multiply With Carry (MWC)
 Ano ........: Desconhecido
 Autor ......: George Marsaglia
*/

#include <iostream>
#include <cstdint>
#include <ctime>
#include <iomanip>

class CmwcRnd {
private:
    uint32_t randomValues[4096];
    uint32_t carry;
    unsigned currentIndex;

    int log2ibase(int n, int acc) {
        if (n == 1)
            return acc;
        else
            return log2ibase(n >> 1, acc + 1);
    }

    int log2i(int n) {
        return log2ibase(n, 0);
    }

    uint32_t rand32(void) {
        static uint32_t seed = 0;
        uint32_t result = 0;
        int bits = log2i(RAND_MAX) + 1;
        int remaining_bits = 32 - bits;
        do {
            result = result << bits | ((seed = (seed * 1103515245 + 12345) & 0xFFFFFFFF) >> (32 - bits));
            remaining_bits -= bits;
        } while (not (remaining_bits <= 0));
        return result;
    }

public:
    CmwcRnd(void) {
        currentIndex = 0;
    }

    void initCMWC(unsigned int seed) {
        int i;
        for (i = 0; i <= 4095; i++) {
            seed = (seed * 1103515245 + 12345) & 0xFFFFFFFF;
            randomValues[i] = seed;
        }
        do {
            seed = (seed * 1103515245 + 12345) & 0xFFFFFFFF;
            carry = seed;
        } while (not (carry < 809430660));
        currentIndex = 4095;
    }

    uint32_t randCMWC(void) {
        uint64_t t;
        uint32_t x;
        currentIndex = (currentIndex + 1) & 4095;
        t = 18782ULL * randomValues[currentIndex] + carry;
        carry = t >> 32;
        x = t + carry;
        if (x < carry) {
            x++;
            carry++;
        }
        return randomValues[currentIndex] = 0xfffffffe - x;
    }
};

CmwcRnd cmwc1, cmwc2;
unsigned int Xn1, Xn2;
int i;

int main(void) {
	
    Xn1 = 1234;
    Xn2 = time(nullptr);

    cmwc1.initCMWC(Xn1);
    cmwc2.initCMWC(Xn2);

    std::cout << "GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)" << std::endl;
    std::cout << "PSEUDORANDOM NUMBER GENERATOR (PRNG)" << std::endl;
    std::cout << "PADRAO: Multiply With Carry (MWC)" << std::endl;
    std::cout << "==========================================" << std::endl << std::endl;
    std::cout << "    Semente: 1234        Semente: TIME" << std::endl;
    std::cout << "    -------------        -------------" << std::endl;

    for (i = 1; i <= 10; i++)
        std::cout << std::setw(17) << cmwc1.randCMWC() << std::setw(21) << cmwc2.randCMWC() << std::endl;

    return 0;
}
