"""
  PRNG .......: XorShift (64 bits)
  Ano ........: 2003
  Autor ......: George Marsaglia
"""

import time

class xorShift32State:
    def __init__(self):
        self.seed = 0

def xorshift32(state):
    random = state.seed & 0xFFFFFFFF # Máscara 32 bits
    random ^= random << 13
    random ^= random >> 17
    random ^= random << 5
    state.seed = random & 0xFFFFFFFF  

def main():
	
    Xn1 = xorShift32State()
    Xn2 = xorShift32State()

    Xn1.seed = 1234
    Xn2.seed = int(time.time())

    print("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
    print("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
    print("PADRAO: XorShift (32 bits)")
    print("=============================================")
    print()
    print("      Semente: 1234       Semente: TIME")
    print("      -------------       -------------")

    for i in range(1, 11):
        print("{:19d}{:20d}".format(xorshift32(Xn1), xorshift32(Xn2) & 0xFFFFFFFF))  # Máscara para garantir 32 bits

if __name__ == "__main__":
    main()
