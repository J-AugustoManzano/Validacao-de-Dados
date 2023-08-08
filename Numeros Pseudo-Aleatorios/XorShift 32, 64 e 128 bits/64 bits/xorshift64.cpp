/*
 PRNG .......: XorShift (64 bits)
 Ano ........: 2003
 Autor ......: George Marsaglia
*/

#include <iostream>
#include <iomanip>
#include <ctime>

struct xorShift64State {
    uint64_t seed;
};

uint64_t xorshift64(struct xorShift64State* state) {
    uint64_t random = state->seed;
    random ^= random << 13;
    random ^= random >> 7;
    random ^= random << 17;
    state->seed = random;
    return state->seed & 0x7FFFFFFFFFFFFFFF;
}

int main() {
    xorShift64State Xn1{ 1234 };
    xorShift64State Xn2{ static_cast<uint64_t>(std::time(nullptr)) };

    std::cout << "GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)" << std::endl;
    std::cout << "PSEUDORANDOM NUMBER GENERATOR (PRNG)" << std::endl;
    std::cout << "PADRAO: XorShift (64 bits)" << std::endl;
    std::cout << "=================================================" << std::endl;
    std::cout << std::endl;
    std::cout << "   Semente: 1234          Semente: TIME" << std::endl;
    std::cout << "   --------------------   --------------------" << std::endl;

    for (int i = 1; i <= 10; i++) {
        std::cout << std::setw(23) << xorshift64(&Xn1) << std::setw(23) << xorshift64(&Xn2) << std::endl;
    }

    return 0;
}
