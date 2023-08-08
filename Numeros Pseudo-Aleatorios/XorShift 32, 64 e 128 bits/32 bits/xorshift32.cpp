/*
 PRNG .......: XorShift (32 bits)
 Ano ........: 2003
 Autor ......: George Marsaglia
*/

#include <iostream>
#include <iomanip>
#include <ctime>

struct xorShift32State {
    uint32_t seed;
};

uint32_t xorshift32(xorShift32State* state) {
    uint32_t random = state->seed;
    random ^= random << 13;
    random ^= random >> 17;
    random ^= random << 5;
    state->seed = random;
    return state->seed;
}

int main() {
	
    xorShift32State Xn1;
    xorShift32State Xn2;

    Xn1.seed = 1234;
    Xn2.seed = static_cast<uint32_t>(std::time(nullptr));

    std::cout << "GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)\n";
    std::cout << "PSEUDORANDOM NUMBER GENERATOR (PRNG)\n";
    std::cout << "PADRAO: XorShift (32 bits)\n";
    std::cout << "=============================================\n";
    std::cout << "\n";
    std::cout << "      Semente: 1234       Semente: TIME\n";
    std::cout << "      -------------       -------------\n";

    for (int i = 1; i <= 10; i++) {
        std::cout << std::setw(19) << std::setfill(' ') << xorshift32(&Xn1);
        std::cout << std::setw(20) << std::setfill(' ') << xorshift32(&Xn2);
        std::cout << "\n";
    }

    return 0;
}
