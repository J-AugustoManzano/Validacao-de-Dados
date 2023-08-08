/*
 PRNG .......: XorShift (32 bits)
 Ano ........: 2003
 Autor ......: George Marsaglia
*/

#include <stdio.h>
#include <stdint.h>
#include <time.h>

struct xorShift32State {
  uint32_t seed;
};

uint32_t xorshift32(struct xorShift32State *state)
{
  uint32_t random = state->seed;
  random ^= random << 13;
  random ^= random >> 17;
  random ^= random << 5;
  return state->seed = random;
}

int main(void)
{
	
  struct xorShift32State Xn1;
  struct xorShift32State Xn2;

  Xn1.seed = 1234;
  Xn2.seed = time(NULL);

  printf("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)\n");
  printf("PSEUDORANDOM NUMBER GENERATOR (PRNG)\n");
  printf("PADRAO: XorShift (32 bits)\n");
  printf("=============================================\n");
  printf("\n");
  printf("      Semente: 1234       Semente: TIME\n");
  printf("      -------------       -------------\n");


  for (int i = 1; i <= 10; i++)
    printf("%19u%20u\n", xorshift32(&Xn1), xorshift32(&Xn2));

  return 0;
}
