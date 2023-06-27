"""
   PRNG .......: Linear Congruential
   Ano ........: 1965
   Autor ......: W. E. Thomson
"""

import math
import time

def linearCongruential(seed):
    M = 2147483647
    seed[0] = (1664525 * seed[0] + 1013904223) % M
    return seed[0] / M

def main():
    Xn1 = [1234]
    Xn2 = [int(time.time() * 1000)]

    print("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
    print("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
    print("PADRAO: Linear Congruential")
    print("==========================================")
    print()
    print("    Semente: 1234        Semente: TIME")
    print("    -------------        -------------")

    for i in range(1, 11):
        print("{:17.11f}        {:13.11f}".format(linearCongruential(Xn1), linearCongruential(Xn2)))

if __name__ == "__main__":
    main()
