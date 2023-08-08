"""
  PRNG .......: XorShift (64 bits)
  Ano ........: 2003
  Autor ......: George Marsaglia
"""

import time

class xorShift64State:
    def __init__(self, seed):
        self.seed = seed
    
    def xorshift64(self):
        random = self.seed
        random ^= random << 13
        random ^= random >> 7
        random ^= random << 17
        self.seed = random
        return self.seed & 0x7FFFFFFFFFFFFFFF

def main():
    Xn1 = xorShift64State(1234)
    Xn2 = xorShift64State(int(time.time()))

    print("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
    print("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
    print("PADRAO: XorShift (64 bits)")
    print("=================================================")
    print()
    print("   Semente: 1234          Semente: TIME")
    print("   --------------------   --------------------")

    for i in range(1, 11):
        print("{:23d}{:23d}".format(Xn1.xorshift64(), Xn2.xorshift64()))

if __name__ == "__main__":
    main()
