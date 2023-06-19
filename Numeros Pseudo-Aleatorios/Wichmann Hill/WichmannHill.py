"""
 PRNG .......: Wichmann Hill
 Ano ........: 1982
 Autor ......: Brian A. Wichmann & David H. Hill
"""

import time

def WichmannHill(X):
    X = (171 * X) % 30269
    return abs(X / 30269.0)

print("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
print("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
print("PADRAO: Wichmann Hill")
print("==========================================")
print()
print("    Semente: 1234        Semente: TIME")
print("    -------------        -------------")

Xn1 = [0.0] * 10
Xn2 = [0.0] * 10

X1 = 1234
X2 = int(time.time())

for i in range(10):
    Xn1[i] = WichmannHill(X1)
    X1 = (171 * X1) % 30269

for i in range(10):
    Xn2[i] = WichmannHill(X2)
    X2 = (171 * X2) % 30269

for i in range(10):
    print(f"{Xn1[i]:17.11f}        {Xn2[i]:13.11f}")
