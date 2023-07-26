/*
 PRNG .......: Multiply With Carry (MWC)
 Ano ........: Desconhecido
 Autor ......: George Marsaglia
*/

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int log2ibase(int n, int acc) {
  if (n == 1)
    return acc;
  else
    return log2ibase(n >> 1, acc + 1);
}

int log2i(int n) {
  return log2ibase(n, 0);
}

struct CmwcRnd {
  uint32_t randomValues[4096];
  uint32_t carry;
  unsigned currentIndex;
};

uint32_t rand32(void) {
  static uint32_t seed = 0;
  uint32_t result = 0;
  int bits = log2i(RAND_MAX) + 1;
  int remaining_bits = 32 - bits;
  do {
    result = result << bits | ((seed = (seed * 1103515245 + 12345) & 0xFFFFFFFF) >> (32 - bits));
    remaining_bits -= bits;
  } while (! (remaining_bits <= 0));
  return result;
}

void initCMWC(struct CmwcRnd *state, unsigned int seed) {
  int i;
  for (i = 0; i <= 4095; i++) {
    seed = (seed * 1103515245 + 12345) & 0xFFFFFFFF;
    state->randomValues[i] = seed;
  }
  do {
    seed = (seed * 1103515245 + 12345) & 0xFFFFFFFF;
    state->carry = seed;
  } while (! (state->carry < 809430660));
  state->currentIndex = 4095;
}

uint32_t randCMWC(struct CmwcRnd *state) {
  uint64_t t;
  uint32_t x;
  state->currentIndex = (state->currentIndex + 1) & 4095;
  t = 18782ULL * state->randomValues[state->currentIndex] + state->carry;
  state->carry = t >> 32;
  x = t + state->carry;
  if (x < state->carry) {
    x++;
    state->carry++;
  }
  return state->randomValues[state->currentIndex] = 0xfffffffe - x;
}

struct CmwcRnd cmwc1, cmwc2;
unsigned int Xn1, Xn2;
int i;
  
int main(void) {

  Xn1 = 1234;
  Xn2 = time(NULL);
    
  initCMWC(&cmwc1, Xn1);
  initCMWC(&cmwc2, Xn2);

  printf("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)\n");
  printf("PSEUDORANDOM NUMBER GENERATOR (PRNG)\n");
  printf("PADRAO: Multiply With Carry (MWC)\n");
  printf("==========================================\n\n");
  printf("    Semente: 1234        Semente: TIME\n");
  printf("    -------------        -------------\n");

  for (i = 1; i <= 10; i++)
    printf("%17u        %13u\n", randCMWC(&cmwc1), randCMWC(&cmwc2));
 
  return 0;
}
