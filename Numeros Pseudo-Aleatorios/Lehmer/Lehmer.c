/* 
 PRNG .......: Lehmer (Metodo Congruencial Linear Multiplicativo)
 Ano ........: 1951
 Autor ......: Derrick Henry "Dick" Lehmer
*/

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

long Lehmer(long *seed) {
    *seed = (16807 * (*seed)) % 2147483647;
    return *seed;
}

int main(void) {

    long Xn1, Xn2;
    int i;

    Xn1 = 1234;
    Xn2 = (long)time(NULL);

    printf("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)\n");
    printf("PSEUDORANDOM NUMBER GENERATOR (PRNG)\n");
    printf("PADRAO: Lehmer\n");
    printf("==========================================\n\n");
    printf("    Semente: 1234        Semente: TIME\n");
    printf("    -------------        -------------\n");

    for (i = 1; i <= 10; i++) {
        printf("%17ld        %13ld\n", Lehmer(&Xn1), Lehmer(&Xn2));
    }

    return 0;
}
