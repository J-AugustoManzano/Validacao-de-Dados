"""
   * PRNG .......: Tiny Mersenne Twister (TMT)
   * Ano ........: 2015 (version 1.1)
   * Autor ......: Mutsuo Saito & Makoto Matsumoto
"""

import time

class Tinymt32PRNG:
    def __init__(self):
        self.status = [0] * 4
        self.matrixAlpha = 0x8f7011ee
        self.matrixBeta = 0xfc78ff1f
        self.tempCoeff = 0x3793fdff

    def tinymt32NextState(self):
        stateX = (self.status[0] & 0x7fffffff) ^ self.status[1] ^ self.status[2]
        stateX ^= stateX << 1
        stateY = self.status[3]
        stateY ^= (stateY >> 1) ^ stateX
        self.status[0] = self.status[1]
        self.status[1] = self.status[2]
        self.status[2] = stateX ^ (stateY << 10)
        self.status[3] = stateY
        if stateY & 1:
            self.status[1] ^= self.matrixAlpha
            self.status[2] ^= self.matrixBeta

    def tinymt32Temp(self):
        finalValue = self.status[3]
        tempCalc = self.status[0] + (self.status[2] >> 8)
        finalValue ^= tempCalc
        finalValue ^= -((tempCalc & 1) != 0) & self.tempCoeff
        return finalValue

    def tinymt32Init(self, seed):
        self.status[0] = seed
        self.status[1] = self.matrixAlpha
        self.status[2] = self.matrixBeta
        self.status[3] = self.tempCoeff
        for i in range(1, 8):
            self.status[i & 3] ^= i + 1812433253 * (self.status[(i - 1) & 3] ^ (self.status[(i - 1) & 3] >> 30))
        for i in range(8):
            self.tinymt32NextState()

    def tinymt32Gen(self):
        self.tinymt32NextState()
        return self.tinymt32Temp() & 0xFFFFFFFF

def main():
    Xn1, Xn2 = 0, 0

    seed1 = Tinymt32PRNG()
    seed2 = Tinymt32PRNG()

    seed1.tinymt32Init(1234)
    seed2.tinymt32Init(int(time.time()))

    print("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
    print("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
    print("PADRAO: Tiny Mersenne Twister (TMT)")
    print("=============================================")
    print()
    print("      Semente: 1234       Semente: TIME")
    print("      -------------       -------------")

    for i in range(10):
        Xn1 = seed1.tinymt32Gen()
        Xn2 = seed2.tinymt32Gen()
        print(f"{Xn1:19d}{Xn2:20d}")

if __name__ == "__main__":
    main()
