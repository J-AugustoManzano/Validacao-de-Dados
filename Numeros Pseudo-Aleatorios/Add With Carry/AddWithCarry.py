"""
 PRNG .......: Add With Carry (AWC)
 Ano ........: 1991
 Autor ......: George Marsaglia
"""

import time

def AWCNextRandom(Xn):
    Xn = (Xn + 12345) % 4294967296
    return Xn

def AWCInitialize(seed):
    Xn = seed
    return Xn

if __name__ == '__main__':
    print("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
    print("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
    print("PADRAO: Add With Carry")
    print("==========================================")
    print()
    print("    Semente: 1234        Semente: TIME")
    print("    -------------        -------------")

    i = 0
    seed1, seed2 = 1234, int(time.time())

    Xn1 = AWCInitialize(seed1)
    Xn2 = AWCInitialize(seed2)

    for i in range(1, 11):
        Xn1 = AWCNextRandom(Xn1)
        Xn2 = AWCNextRandom(Xn2)
        print(f"{Xn1:>17}        {Xn2:>13}")
