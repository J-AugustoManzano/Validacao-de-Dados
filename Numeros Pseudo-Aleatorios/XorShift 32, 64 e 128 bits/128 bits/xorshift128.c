/*
 PRNG .......: XorShift (128 bits)
 Ano ........: 2003
 Autor ......: George Marsaglia
*/

#include <stdio.h>
#include <stdint.h>
#include <time.h>

struct xorShift128State {
  uint64_t seed;
};

uint64_t xorshift128(struct xorShift128State *state)
{
  uint64_t random = state->seed;
  random ^= random << 11;
  random ^= random >> 8;
  random ^= random << 19;
  return state->seed = random;
}

int main(void)
{
	
  struct xorShift128State Xn1;
  struct xorShift128State Xn2;

  Xn1.seed = 1234;
  Xn2.seed = time(NULL);

  printf("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)\n");
  printf("PSEUDORANDOM NUMBER GENERATOR (PRNG)\n");
  printf("PADRAO: XorShift (128 bits)\n");
  printf("=================================================\n");
  printf("\n");
  printf("   Semente: 1234          Semente: TIME\n");
  printf("   --------------------   --------------------\n");

  for (int i = 1; i <= 10; i++)
    printf("%23llu%23llu\n", xorshift128(&Xn1), xorshift128(&Xn2));

  return 0;
}
