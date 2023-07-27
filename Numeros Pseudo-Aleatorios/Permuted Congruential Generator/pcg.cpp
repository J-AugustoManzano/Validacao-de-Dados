/*
 * PRNG .......: Permuted Congruential Generator (PCG)
 * Ano ........: 2014
 * Autor ......: Dr. M.E. O'Neill
 */

#include <iostream>
#include <cstdint>
#include <chrono>
#include <iomanip>

static uint32_t rotr32(uint32_t x, unsigned r)
{
  return x >> r | x << (-r & 31);
}

uint32_t pcg32(uint64_t& seed)
{
  uint64_t x = seed;
  unsigned rotation = (unsigned)(x >> 59);
  seed = x * 6364136223846793005u + 1442695040888963407u;
  x ^= x >> 18;
  seed = seed + x;
  return rotr32((uint32_t)(((x >> 27) + rotation) ^ (seed >> 32)), rotation);
}

uint32_t getTimer()
{
  auto current_time = std::chrono::system_clock::now();
  auto millis = std::chrono::duration_cast<std::chrono::milliseconds>(current_time.time_since_epoch()).count();
  return static_cast<uint32_t>(millis);
}

uint64_t Xn1, Xn2;

int main(void)
{
  
  std::cout << "GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)" << std::endl;
  std::cout << "PSEUDORANDOM NUMBER GENERATOR (PRNG)" << std::endl;
  std::cout << "PADRAO: Permuted Congruential Generator (PCG)" << std::endl;
  std::cout << "=============================================" << std::endl;
  std::cout << std::endl;

  Xn1 = 1234;
  Xn2 = getTimer() ;

  std::cout << "      Semente: 1234       Semente: TIME" << std::endl;
  std::cout << "      -------------       -------------" << std::endl;

  for (int i = 1; i <= 10; i++)
  {
    std::cout << std::setw(19) << pcg32(Xn1);
    std::cout << std::setw(20) << pcg32(Xn2) << std::endl;
  }

  return 0;
}
