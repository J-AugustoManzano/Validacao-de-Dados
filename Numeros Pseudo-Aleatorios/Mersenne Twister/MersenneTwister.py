"""
 PRNG .......: Mersenne Twister (MT 19937)
 Ano ........: 2007
 Autor ......: Makoto Matsumoto & Takuji Nishimura
"""

import time

class MT19937:
    def __init__(self):
        self._w = 32
        self._n = 624
        self._m = 397
        self._r = 31
        self._a = 0x9908B0DF
        self._u = 11
        self._s = 7
        self._b = 0x9D2C5680
        self._t = 15
        self._c = 0xEFC60000
        self._l = 18
        self.X = [0] * self._n
        self.cnt = 0

    def _twist(self):
        for i in range(self._n):
            tmp = (self.X[i] & 0x80000000) + (self.X[(i + self._m) % self._n] & 0x7FFFFFFF)
            self.X[i] = self.X[(i + self._m) % self._n] ^ (tmp >> 1)
            if tmp % 2 != 0:
                self.X[i] ^= self._a
        self.cnt = 0

    def initialize(self, seed):
        self.X[0] = seed
        for i in range(1, self._n):
            self.X[i] = (0x6C078965 * (self.X[i - 1] ^ (self.X[i - 1] >> 30)) + i) & 0xFFFFFFFF
        self._twist()

    def generate_random_number(self):
        if self.cnt == self._n:
            self._twist()
        y = self.X[self.cnt]
        y ^= (y >> self._u) & 0xDFFFFFFF
        y ^= (y << self._s) & self._b
        y ^= (y << self._t) & self._c
        y ^= y >> self._l
        self.cnt += 1
        return y

Xn1 = MT19937()
Xn2 = MT19937()

Xn1.initialize(1234)
Xn2.initialize(int(time.time()))

print("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
print("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
print("PADRAO: Mersenne Twister (MT)")
print("==========================================\n")

print("{:>17} {:>21}".format("Semente: 1234", "Semente: TIME"))
print("    -------------        -------------\n")

for _ in range(10):
    print("{:>17} {:>21}".format(Xn1.generate_random_number(), Xn2.generate_random_number()))
