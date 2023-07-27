"""
   * PRNG .......: Permuted Congruential Generator (PCG)
   * Ano ........: 2014
   * Autor ......: Dr. M.E. O'Neill
"""

import time

def rotr32(x, r):
    return ((x >> r) | (x << (32 - r))) & 0xFFFFFFFF

def pcg32(seed):
    x = seed
    rotation = x >> 59
    seed = x * 6364136223846793005 + 1442695040888963407
    x ^= x >> 18
    seed += x
    return rotr32(((x >> 27) + rotation) ^ (seed >> 32), rotation)

def getTimer():
    current_time = int(time.time())
    return current_time

Xn1 = 1234
Xn2 = getTimer()

print("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
print("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
print("PADRAO: Permuted Congruential Generator (PCG)")
print("=============================================")
print()

print("      Semente: 1234       Semente: TIME")
print("      -------------       -------------")

for i in range(1, 11):
    print(f"{pcg32(Xn1):19}{pcg32(Xn2):20}")
    Xn1 = pcg32(Xn1)
    Xn2 = pcg32(Xn2)
