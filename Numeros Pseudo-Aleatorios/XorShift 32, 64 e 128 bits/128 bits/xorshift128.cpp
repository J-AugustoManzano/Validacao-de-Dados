/*
 PRNG .......: XorShift (128 bits)
 Ano ........: 2003
 Autor ......: George Marsaglia
*/

#include <iostream>
#include <cstdint>
#include <iomanip>
#include <ctime>

struct xorShift128State {
    uint64_t seed;
};

uint64_t xorshift128(struct xorShift128State *state) {
    uint64_t random = state->seed;
    random ^= random << 11;
    random ^= random >> 8;
    random ^= random << 19;
    return state->seed = random;
}

int main() {
    struct xorShift128State Xn1;
    struct xorShift128State Xn2;

    Xn1.seed = 1234;
    Xn2.seed = time(NULL);

    std::cout << "GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)" << std::endl;
    std::cout << "PSEUDORANDOM NUMBER GENERATOR (PRNG)" << std::endl;
    std::cout << "PADRAO: XorShift (128 bits)" << std::endl;
    std::cout << "=================================================" << std::endl;
    std::cout << std::endl;
    std::cout << "   Semente: 1234          Semente: TIME" << std::endl;
    std::cout << "   --------------------   --------------------" << std::endl;

    for (int i = 1; i <= 10; i++) {
        std::cout << std::setw(23) << xorshift128(&Xn1) << std::setw(23) << xorshift128(&Xn2) << std::endl;
    }

    return 0;
}
