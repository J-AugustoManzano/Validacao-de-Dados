/*
 PRNG .......: Mersenne Twister (MT)
 Ano ........: 1998
 Autor ......: Makoto Matsumoto & Takuji Nishimura
*/

#include <stdio.h>
#include <stdint.h>
#include <time.h>

#define w 32u
#define n 624u
#define f 1812433253u
#define m 397u
#define r 31u
#define a 0x9908B0DFu
#define d 0xFFFFFFFFu
#define b 0x9D2C5680u
#define c 0xEFC60000u
#define u 11u
#define s 7u
#define t 15u
#define l 18u

typedef struct {
  uint32_t X[n];
  uint32_t cnt;
} MT19937;

void twist(MT19937 *rng) {
  for (uint32_t i = 0; i < n; i++) {
    uint32_t lower_mask = (1u << r) - 1u;
    uint32_t upper_mask = ~lower_mask;
    uint32_t tmp = (rng->X[i] & upper_mask) + (rng->X[(i + 1u) % n] & lower_mask);
    uint32_t tmpA = tmp >> 1u;
    if (tmp & 1u) {
      tmpA ^= a;
    }
    rng->X[i] = rng->X[(i + m) % n] ^ tmpA;
  }
  rng->cnt = 0u;
}

void initialize(MT19937 *rng, uint32_t seed) {
  rng->X[0] = seed;
  for (uint32_t i = 1; i < n; i++) {
    rng->X[i] = (f * (rng->X[i - 1] ^ (rng->X[i - 1] >> (w - 2u))) + i) & 0xFFFFFFFFu;
  }
  twist(rng);
}

uint32_t temper(MT19937 *rng) {
  if (rng->cnt == n) {
      twist(rng);
  }
  uint32_t y = rng->X[rng->cnt];
  y ^= (y >> u) & d;
  y ^= (y << s) & b;
  y ^= (y << t) & c;
  y ^= y >> l;
  rng->cnt += 1u;
  return y;
}

int main(void) {
	
  MT19937 Xn1, Xn2;
  
  initialize(&Xn1, 1234);
  initialize(&Xn2, (uint32_t)time(NULL));

  printf("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)\n");
  printf("PSEUDORANDOM NUMBER GENERATOR (PRNG)\n");
  printf("PADRAO: Mersenne Twister (MT)\n");
  printf("==========================================\n\n");
  printf("    Semente: 1234        Semente: TIME\n");
  printf("    -------------        -------------\n\n");

  for (int i = 0; i <= 9; i++) {
    printf("       %10u           %10u\n", temper(&Xn1), temper(&Xn2));
  }

  return 0;
}
