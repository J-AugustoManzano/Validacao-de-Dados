"""
 PRNG .......: XorShift (128 bits)
 Ano ........: 2003
 Autor ......: George Marsaglia
"""

import time

class XorShift128State:
    def __init__(self):
        self.seed = 0

def xorshift128(state):
    random = state.seed
    random ^= random << 13
    random ^= random >> 7
    random ^= random << 17
    state.seed = random
    return random & 0x7FFFFFFFFFFFFFFF

def main():
    Xn1 = XorShift128State()
    Xn2 = XorShift128State()

    Xn1.seed = 1234
    Xn2.seed = int(time.time() * 1000)

    print("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
    print("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
    print("PADRAO: XorShift (128 bits)")
    print("=================================================")
    print("")
    print("   Semente: 1234          Semente: TIME")
    print("   --------------------   --------------------")

    for i in range(1, 11):
        number1 = xorshift128(Xn1)
        number2 = xorshift128(Xn2)

        print(f"{number1:23d}{number2:23d}")

if __name__ == "__main__":
    main()


