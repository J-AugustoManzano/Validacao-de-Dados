"""
    PRNG .......: Multiply With Carry (MWC)
    Ano ........: Desconhecido
    Autor ......: George Marsaglia
"""


import datetime

def log2ibase(n, acc):
    if n == 1:
        return acc
    else:
        return log2ibase(n >> 1, acc + 1)

def log2i(n):
    return log2ibase(n, 0)

def rand32():
    seed = 0
    result_ = 0
    bits = log2i(sys.maxsize) + 1
    remainingBits = 32 - bits
    while remainingBits > 0:
        result_ = (result_ << bits) | ((seed * 1103515245 + 12345) >> (32 - bits))
        remainingBits -= bits
    return result_

class CmwcRnd:
    def __init__(self):
        self.randomValues = [0] * 4096
        self.carry = 0
        self.currentIndex = 0

    def initCMWC(self, seed):
        for i in range(4096):
            seed = (seed * 1103515245 + 12345) & 0xFFFFFFFF
            self.randomValues[i] = seed
        while True:
            seed = (seed * 1103515245 + 12345) & 0xFFFFFFFF
            self.carry = seed
            if self.carry < 809430660:
                break
        self.currentIndex = 4095

    def randCMWC(self):
        self.currentIndex = (self.currentIndex + 1) & 4095
        t = 18782 * self.randomValues[self.currentIndex] + self.carry
        self.carry = t >> 32
        x = t + self.carry
        if x < self.carry:
            x += 1
            self.carry += 1
        self.randomValues[self.currentIndex] = x & 0xFFFFFFFF
        return self.randomValues[self.currentIndex]

cmwc1 = CmwcRnd()
cmwc2 = CmwcRnd()
Xn1 = 1234
Xn2 = int(datetime.datetime.now().timestamp())

cmwc1.initCMWC(Xn1)
cmwc2.initCMWC(Xn2)

print('GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)')
print('PSEUDORANDOM NUMBER GENERATOR (PRNG)')
print('PADRAO: Multiply With Carry (MWC)')
print('==========================================')
print()
print('    Semente: 1234        Semente: TIME')
print('    -------------        -------------')

for _ in range(10):
    print(f'{cmwc1.randCMWC():17}        {cmwc2.randCMWC():13}')
