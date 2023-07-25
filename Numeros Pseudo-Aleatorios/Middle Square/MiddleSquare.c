/*
 PRNG .......: Middle Square
 Ano ........: 1946
 Autor ......: John von Neumann
*/

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

long int MeanSquare(long int *seed) {
    *seed = (*seed * *seed / 100) % 10000;
    return *seed >= 0 ? *seed : -*seed;
}

int main(void) {

    long int Xn1, Xn2;
    int i;

    Xn1 = 1234;
    Xn2 = time(NULL);

    printf("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)\n");
    printf("PSEUDORANDOM NUMBER GENERATOR (PRNG)\n");
    printf("PADRAO: Middle Square\n");
    printf("==========================================\n\n");
    printf("    Semente: 1234        Semente: TIME\n");
    printf("    -------------        -------------\n");

    for (i = 1; i <= 10; i++) {
        printf("%17ld        %13ld\n", MeanSquare(&Xn1), MeanSquare(&Xn2));
    }

    return 0;
}
