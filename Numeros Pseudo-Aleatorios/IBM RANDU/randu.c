/* 
   PRNG .......: RANDU
   Ano ........: Decada de 1960
   Autor ......: IBM
*/

#include <stdio.h>
#include <time.h>

long long int RANDU(long long int *seed) {
    *seed = (65539 * (*seed)) % 2147483648;
    return *seed;
}

int main(void) {

    long long int Xn1, Xn2;
    int i;
    
    Xn1 = 1234;
    Xn2 = (long long int)time(NULL);
    
    printf("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)\n");
    printf("PSEUDORANDOM NUMBER GENERATOR (PRNG)\n");
    printf("PADRAO: RANDU\n");
    printf("==========================================\n\n");
    printf("    Semente: 1234        Semente: TIME\n");
    printf("    -------------        -------------\n");
    
    for (i = 1; i <= 10; i++) {
        printf("%17lld        %13lld\n", RANDU(&Xn1), RANDU(&Xn2));
    }
    
    return 0;
}
