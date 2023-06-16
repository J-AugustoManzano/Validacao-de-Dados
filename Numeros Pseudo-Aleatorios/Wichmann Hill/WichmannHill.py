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

semente1234 = [0.0] * 10
sementeTime = [0.0] * 10

X1 = 1234
X2 = int(time.time())

for i in range(10):
    semente1234[i] = WichmannHill(X1)
    X1 = (171 * X1) % 30269

for i in range(10):
    sementeTime[i] = WichmannHill(X2)
    X2 = (171 * X2) % 30269

for i in range(10):
    print(f"{semente1234[i]:17.11f}        {sementeTime[i]:13.11f}")
