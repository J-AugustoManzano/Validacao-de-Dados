/*
PRNG .......: Linear Congruential
Ano ........: 1965
Autor ......: W. E. Thomson
*/

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

double LinearCongruential(long long *seed) {
    const long long M = 2147483647;
    *seed = (1664525 * (*seed) + 1013904223) % M;
    return (double)(*seed) / M;
}

int main(void) {
  
    long long Xn1, Xn2;
    int i;

    Xn1 = 1234;
    Xn2 = (long long)time(NULL);

    printf("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)\n");
    printf("PSEUDORANDOM NUMBER GENERATOR (PRNG)\n");
    printf("PADRAO: Linear Congruential\n");
    printf("==========================================\n\n");
    printf("    Semente: 1234        Semente: TIME\n");
    printf("    -------------        -------------\n");

    for (i = 1; i <= 10; i++) {
        printf("%17.11f        %13.11f\n", LinearCongruential(&Xn1), LinearCongruential(&Xn2));
    }

    return 0;
}
