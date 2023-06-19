/*
 PRNG .......: Mersenne Twister (MT)
 Ano ........: 1998
 Autor ......: Makoto Matsumoto & Takuji Nishimura
*/

#include <iostream>
#include <cstdint>
#include <ctime>
#include <iomanip>

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

class MT19937 {
private:
  uint32_t X[n];
  uint32_t cnt;

  void twist() {
    for (uint32_t i = 0; i < n; i++) {
      uint32_t lower_mask = (1u << r) - 1u;
      uint32_t upper_mask = ~lower_mask;
      uint32_t tmp = (X[i] & upper_mask) + (X[(i + 1u) % n] & lower_mask);
      uint32_t tmpA = tmp >> 1u;
      if (tmp & 1u) {
        tmpA ^= a;
      }
      X[i] = X[(i + m) % n] ^ tmpA;
    }
    cnt = 0u;
  }

public:
  MT19937() : cnt(0u) {}

  void initialize(uint32_t seed) {
    X[0] = seed;
    for (uint32_t i = 1; i < n; i++) {
      X[i] = (f * (X[i - 1] ^ (X[i - 1] >> (w - 2u))) + i) & 0xFFFFFFFFu;
    }
    twist();
  }

  uint32_t generateRandomNumber() {
    if (cnt == n) {
      twist();
    }
    uint32_t y = X[cnt];
    y ^= (y >> u) & d;
    y ^= (y << s) & b;
    y ^= (y << t) & c;
    y ^= y >> l;
    cnt += 1u;
    return y;
  }
};

int main() {
	
  MT19937 Xn1, Xn2;
  
  Xn1.initialize(1234);
  Xn2.initialize(static_cast<uint32_t>(time(NULL)));

  std::cout << "GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)" << std::endl;
  std::cout << "PSEUDORANDOM NUMBER GENERATOR (PRNG)" << std::endl;
  std::cout << "PADRAO: Mersenne Twister (MT)" << std::endl;
  std::cout << "==========================================" << std::endl << std::endl;
  std::cout << "    Semente: 1234        Semente: TIME" << std::endl;
  std::cout << "    -------------        -------------" << std::endl << std::endl;

  for (int i = 0; i <= 9; i++) {
    std::cout << std::setw(17) << Xn1.generateRandomNumber();
    std::cout << std::setw(21) << Xn2.generateRandomNumber();
    std::cout << std::endl;
  }

  return 0;
}
