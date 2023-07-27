/*
 * PRNG .......: Permuted Congruential Generator (PCG)
 * Ano ........: 2014
 * Autor ......: Dr. M.E. O'Neill
 */

#include <stdio.h>
#include <stdint.h>
#include <time.h>

static uint32_t rotr32(uint32_t x, unsigned r)
{
  return x >> r | x << (-r & 31);
}

uint32_t pcg32(uint64_t* seed)
{
  uint64_t x = *seed;
  unsigned rotation = (unsigned)(x >> 59);
  *seed = x * 6364136223846793005u + 1442695040888963407u;
  x ^= x >> 18;
  *seed = *seed + x;
  return rotr32((uint32_t)(((x >> 27) + rotation) ^ (*seed >> 32)), rotation);
}

uint32_t getTimer()
{
  time_t current_time = time(NULL);
  return (uint32_t)current_time;
}

uint64_t Xn1, Xn2;

int main(void)
{

  Xn1 = 1234;
  Xn2 = getTimer();
  
  printf("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)\n");
  printf("PSEUDORANDOM NUMBER GENERATOR (PRNG)\n");
  printf("PADRAO: Permuted Congruential Generator (PCG)\n");
  printf("=============================================\n");
  printf("\n");
  printf("      Semente: 1234       Semente: TIME\n");
  printf("      -------------       -------------\n");

  for (int i = 1; i <= 10; i++)
    printf("%19u%20u\n", pcg32(&Xn1), pcg32(&Xn2));

  return 0;
}
