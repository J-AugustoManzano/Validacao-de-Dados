/* 
   PRNG .......: Linear-Feedback Shift Register (LFSR)
   Ano ........: 1965
   Autor ......: R. C. Tausworthe
*/

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

double lfsr(unsigned int *state) {
    *state = (*state >> 1) ^ (0xB4BCD35C * (*state & 1));
    return (double)(*state) / 4294967296.0;
}

int main(void) {

    unsigned int Xn1, Xn2;
    int i;

    Xn1 = 0x1234;
    Xn2 = (unsigned int)time(NULL);

    printf("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)\n");
    printf("PSEUDORANDOM NUMBER GENERATOR (PRNG)\n");
    printf("PADRAO: Linear-Feedback Shift Register\n");
    printf("==========================================\n\n");
    printf("    Semente: 1234        Semente: TIME\n");
    printf("    -------------        -------------\n");

    for (i = 1; i <= 10; i++) {
        printf("%17.11f        %13.11f\n", lfsr(&Xn1), lfsr(&Xn2));
    }

    return 0;
}
