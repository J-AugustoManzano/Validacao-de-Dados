/*
 PRNG .......: XorShift (64 bits)
 Ano ........: 2003
 Autor ......: George Marsaglia
*/

#include <stdio.h>
#include <stdint.h>
#include <time.h>

struct xorShift64State {
  uint64_t seed;
};

uint64_t xorshift64(struct xorShift64State *state)
{
  uint64_t random = state->seed;
  random ^= random << 13;
  random ^= random >> 7;
  random ^= random << 17;
  return state->seed = random;
}

int main(void)
{
	
  struct xorShift64State Xn1;
  struct xorShift64State Xn2;

  Xn1.seed = 1234;
  Xn2.seed = time(NULL);

  printf("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)\n");
  printf("PSEUDORANDOM NUMBER GENERATOR (PRNG)\n");
  printf("PADRAO: XorShift (64 bits)\n");
  printf("=================================================\n");
  printf("\n");
  printf("   Semente: 1234          Semente: TIME\n");
  printf("   --------------------   --------------------\n");

  for (int i = 1; i <= 10; i++)
    printf("%23llu%23llu\n", xorshift64(&Xn1), xorshift64(&Xn2));
    
  return 0;
}
