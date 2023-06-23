""" 
 PRNG .......: Blum-Blum-Shub
 Ano ........: 1986
 Autor ......: L. Blum, M. Blum & M. Shub
"""

import math
import time

def BlumBlumShub(X):
    X = (X * X) % 2467246241
    return int(X)

Xn1 = [0] * 10
Xn2 = [0] * 10
X1, X2 = 0, 0

print("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
print("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
print("PADRAO: Blum-Blum-Shub")
print("==========================================\n")
print("    Semente: 1234        Semente: TIME")
print("    -------------        -------------\n")

X1 = 1234
X2 = int(time.time())

for i in range(10):
    X1 = BlumBlumShub(X1)
    X2 = BlumBlumShub(X2)
    Xn1[i] = X1
    Xn2[i] = X2
    print(f"{Xn1[i]:17d}        {Xn2[i]:13d}")
