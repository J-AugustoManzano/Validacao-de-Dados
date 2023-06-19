/*
 PRNG .......: Park-Miller
 Ano ........: 1988
 Autor ......: S. K. Park & K. W. Miller
*/

#include <stdio.h>
#include <time.h>

unsigned int ParkMiller(unsigned int* X) {
  *X = (16807 * (*X)) % 2147483647;
  return *X;
}

int main(void) {

  unsigned int Xn1, Xn2;
  int i;

  Xn1 = 1234;
  Xn2 = (unsigned int)time(NULL);

  printf("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)\n");
  printf("PSEUDORANDOM NUMBER GENERATOR (PRNG)\n");
  printf("PADRAO: Park-Miller\n");
  printf("==========================================\n\n");
  printf("    Semente: 1234        Semente: TIME\n");
  printf("    -------------        -------------\n");

  for (i = 1; i <= 10; i++) {
    printf("%17u        %13u\n", ParkMiller(&Xn1), ParkMiller(&Xn2));
  }

  return 0;
}
