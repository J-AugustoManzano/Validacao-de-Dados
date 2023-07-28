/*
 PRNG .......: SplitMix64
 Ano ........: 2015
 Autor ......: Sebastiano Vigna
*/

// Fundamentado: rosettacode.org/wiki/Pseudo-random_numbers/Splitmix64

#include <stdio.h>
#include <stdint.h>
#include <time.h>

struct SplitMix64 {
    uint64_t state;
};

struct SplitMix64 SplitMix64Init(uint64_t state) {
    struct SplitMix64 sm64;
    sm64.state = state;
    return sm64;
}

uint64_t nextInt(struct SplitMix64* sm64) {
    sm64->state += 0x9e3779b97f4a7c15;
    uint64_t z = sm64->state;
    z = (z ^ (z >> 30)) * 0xbf58476d1ce4e5b9;
    z = (z ^ (z >> 27)) * 0x94d049bb133111eb;
    return z ^ (z >> 31);
}

double nextFloat(struct SplitMix64* sm64) {
    return (double)(nextInt(sm64) >> 11) / (1LL << 53);
}

int main(void) {
	
    struct SplitMix64 Xn1 = SplitMix64Init(1234);
    struct SplitMix64 Xn2 = SplitMix64Init((uint64_t)time(NULL));

    printf("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)\n");
    printf("PSEUDORANDOM NUMBER GENERATOR (PRNG)\n");
    printf("PADRAO: SplitMix64\n");
    printf("===================================================\n\n");

    printf("  Semente: 1234 (int)        Semente: TIME (int)\n");
    printf("  --------------------       --------------------\n");
    for (int i = 1; i <= 5; i++) {
        printf("%22llu%27llu\n", (unsigned long long)nextInt(&Xn1), (unsigned long long)nextInt(&Xn2));

    }
    printf("\n");

    printf("  Semente: 1234 (real)       Semente: TIME (real)\n");
    printf("  --------------------       --------------------\n");
    for (int i = 1; i <= 5; i++) {
        printf("%22.18f%27.18f\n", nextFloat(&Xn1), nextFloat(&Xn2));
    }

    return 0;
}
