/*
 PRNG .......: Tiny Mersenne Twister (TMT)
 Ano ........: 2015 (version 1.1)
 Autor ......: Mutsuo Saito & Makoto Matsumoto
*/

#include <iostream>
#include <iomanip>
#include <cstdint>
#include <ctime>

class Tinymt32PRNG {
private:
    uint32_t status[4];
    uint32_t matrixAlpha;
    uint32_t matrixBeta;
    uint32_t tempCoeff;

    void tinymt32NextState() {
        uint32_t stateX, stateY;
        stateY = status[3];
        stateX = (status[0] & 0x7fffffff) ^ status[1] ^ status[2];
        stateX ^= (stateX << 1);
        stateY ^= (stateY >> 1) ^ stateX;
        status[0] = status[1];
        status[1] = status[2];
        status[2] = stateX ^ (stateY << 10);
        status[3] = stateY;
        if (stateY & 1) {
            status[1] ^= matrixAlpha;
            status[2] ^= matrixBeta;
        }
    }

    uint32_t tinymt32Temp() const {
        uint32_t finalValue, tempCalc;
        finalValue = status[3];
        tempCalc = status[0] + (status[2] >> 8);
        finalValue ^= tempCalc;
        finalValue ^= -((int32_t)(tempCalc & 1)) & tempCoeff;
        return finalValue;
    }

public:
    Tinymt32PRNG() {
        tinymt32Init(0);
    }

    Tinymt32PRNG(uint32_t seed) {
        tinymt32Init(seed);
    }

    void tinymt32Init(uint32_t seed) {
        status[0] = seed;
        status[1] = matrixAlpha = 0x8f7011ee;
        status[2] = matrixBeta = 0xfc78ff1f;
        status[3] = tempCoeff = 0x3793fdff;
        for (uint32_t i = 1; i <= 7; i++) {
            status[i & 3] ^= i + 1812433253 * (status[(i - 1) & 3] ^ (status[(i - 1) & 3] >> 30));
        }
        for (uint32_t i = 0; i <= 7; i++) {
            tinymt32NextState();
        }
    }

    uint32_t tinymt32Gen() {
        tinymt32NextState();
        return tinymt32Temp();
    }
};

int main() {
    uint32_t Xn1, Xn2;

    Tinymt32PRNG seed1;
    Tinymt32PRNG seed2;

    seed1.tinymt32Init(1234);
    seed2.tinymt32Init(time(NULL));

    std::cout << "GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)" << std::endl;
    std::cout << "PSEUDORANDOM NUMBER GENERATOR (PRNG)" << std::endl;
    std::cout << "PADRAO: Tiny Mersenne Twister (TMT)" << std::endl;
    std::cout << "==========================================" << std::endl << std::endl;
    std::cout << "    Semente: 1234        Semente: TIME" << std::endl;
    std::cout << "    -------------        -------------" << std::endl;

    for (int i = 1; i <= 10; i++) {
        Xn1 = seed1.tinymt32Gen();
        Xn2 = seed2.tinymt32Gen();
        std::cout << std::setw(17) << Xn1 << std::setw(21) << Xn2 << std::endl;
    }

    return 0;
}
