/*
 PRNG .......: Add With Carry (AWC)
 Ano ........: 1991
 Autor ......: George Marsaglia
*/

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

unsigned int AWCNextRandom(unsigned int* Xn) {
  *Xn = (*Xn + 12345) % 4294967296;
  return *Xn;
}

void AWCInitialize(unsigned int seed, unsigned int* Xn) {
  *Xn = seed;
}

int main(void) {

  printf("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)\n");
  printf("PSEUDORANDOM NUMBER GENERATOR (PRNG)\n");
  printf("PADRAO: Add With Carry\n");
  printf("==========================================\n\n");
  printf("    Semente: 1234        Semente: TIME\n");
  printf("    -------------        -------------\n");

  unsigned int Xn1, Xn2;
  int i;
  unsigned int seed1 = 1234;

  AWCInitialize(seed1, &Xn1);

  unsigned int seed2 = (unsigned int)time(NULL);
  AWCInitialize(seed2, &Xn2);

  for (i = 1; i <= 10; i++) {
    printf("%17u        %13u\n", AWCNextRandom(&Xn1), AWCNextRandom(&Xn2));
  }

  return 0;
}
