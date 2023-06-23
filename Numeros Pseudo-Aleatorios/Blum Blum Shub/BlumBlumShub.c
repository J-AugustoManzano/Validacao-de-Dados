/* 
 PRNG .......: Blum-Blum-Shub
 Ano ........: 1986
 Autor ......: L. Blum, M. Blum & M. Shub
*/

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

unsigned int BlumBlumShub(unsigned int *X) {
  *X = (*X * *X) % 2467246241;
  return *X;
}

unsigned int Xn1[10];
unsigned int Xn2[10];
unsigned int X1, X2;

int main(void) {
	
  printf("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)\n");
  printf("PSEUDORANDOM NUMBER GENERATOR (PRNG)\n");
  printf("PADRAO: Blum-Blum-Shub\n");
  printf("==========================================\n\n");
  printf("    Semente: 1234        Semente: TIME\n");
  printf("    -------------        -------------\n");

  X1 = 1234;
  X2 = (unsigned int)time(NULL);

  for (int i = 0; i <= 9; i++) {
    Xn1[i] = BlumBlumShub(&X1);
    Xn2[i] = BlumBlumShub(&X2);
    printf("%17u        %13u\n", Xn1[i], Xn2[i]);
  }

  return 0;
}
