/*
 PRNG .......: Tiny Mersenne Twister (TMT)
 Ano ........: 2015 (version 1.1)
 Autor ......: Mutsuo Saito & Makoto Matsumoto
*/

#include <stdio.h>
#include <stdint.h>
#include <time.h>

struct Tinymt32PRNG {
  uint32_t status[4];
  uint32_t matrixAlpha;
  uint32_t matrixBeta;
  uint32_t tempCoeff;
};

void tinymt32NextState(struct Tinymt32PRNG *prng)
{
  uint32_t stateX, stateY;
  stateY = prng->status[3];
  stateX = (prng->status[0] & 0x7fffffff) ^ prng->status[1] ^ prng->status[2];
  stateX ^= (stateX << 1);
  stateY ^= (stateY >> 1) ^ stateX;
  prng->status[0] = prng->status[1];
  prng->status[1] = prng->status[2];
  prng->status[2] = stateX ^ (stateY << 10);
  prng->status[3] = stateY;
  if (stateY & 1) {
    prng->status[1] ^= prng->matrixAlpha;
    prng->status[2] ^= prng->matrixBeta;
  }
}

uint32_t tinymt32Temp(const struct Tinymt32PRNG *prng)
{
  uint32_t finalValue , tempCalc;
  finalValue  = prng->status[3];
  tempCalc = prng->status[0] + (prng->status[2] >> 8);
  finalValue  ^= tempCalc;
  finalValue  ^= -((int32_t)(tempCalc & 1)) & prng->tempCoeff;
  return finalValue ;
}

void tinymt32Init(struct Tinymt32PRNG *prng, uint32_t seed)
{
  prng->status[0] = seed;
  prng->status[1] = prng->matrixAlpha = 0x8f7011ee;
  prng->status[2] = prng->matrixBeta = 0xfc78ff1f;
  prng->status[3] = prng->tempCoeff = 0x3793fdff;
  for (uint32_t i = 1; i <= 7; i++) {
    prng->status[i & 3] ^= i + 1812433253 * (prng->status[(i - 1) & 3] ^ (prng->status[(i - 1) & 3] >> 30));
  }
  for (uint32_t i = 0; i <= 7; i++) {
    tinymt32NextState(prng);
  }
}

uint32_t tinymt32Gen(struct Tinymt32PRNG *prng)
{
  tinymt32NextState(prng);
  return tinymt32Temp(prng);
}

int main(void) {

  uint32_t Xn1, Xn2; 
	
  struct Tinymt32PRNG seed1;
  struct Tinymt32PRNG seed2;
  
  tinymt32Init(&seed1, 1234);
  tinymt32Init(&seed2, time(NULL));

  printf("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)\n");
  printf("PSEUDORANDOM NUMBER GENERATOR (PRNG)\n");
  printf("PADRAO: Tiny Mersenne Twister (TMT)\n");
  printf("=============================================\n");
  printf("\n");
  printf("      Semente: 1234       Semente: TIME\n");
  printf("      -------------       -------------\n");

  for (int i = 1; i <= 10; i++)
  {
    Xn1 = tinymt32Gen(&seed1);
    Xn2 = tinymt32Gen(&seed2);
    printf("%19u%20u\n", Xn1, Xn2);
  }
  
  return 0;
}
