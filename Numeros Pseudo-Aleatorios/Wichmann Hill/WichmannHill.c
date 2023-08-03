/*
 * PRNG .......: Wichmann Hill
 * Ano ........: 1982
 * Autor ......: Brian A. Wichmann & David H. Hill
 */
 
#include <stdio.h>
#include <math.h>
#include <time.h>

double WichmannHill(int *X) {
  *X = (171 * (*X)) % 30269;
  double result = *X / 30269.0;
  return result >= 0 ? result : -result;
}

int main(void) {
	
  double Xn1[10];
  double Xn2[10];
  int i, X1, X2;
	
  printf("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)\n");
  printf("PSEUDORANDOM NUMBER GENERATOR (PRNG)\n");
  printf("PADRAO: Wichmann Hill\n");
  printf("==========================================\n\n");
  printf("    Semente: 1234        Semente: TIME\n");
  printf("    -------------        -------------\n");

  X1 = 1234;
  X2 = (int)time(NULL);
    
  for (i = 0; i <= 9; i++) {
    Xn1[i] = WichmannHill(&X1);
    Xn2[i] = WichmannHill(&X2);
    printf("%17.11lf        %13.11lf\n", Xn1[i], Xn2[i]);
  }

  return 0;
}
