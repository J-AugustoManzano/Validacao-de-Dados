"""
    PRNG .......: Middle Square
    Ano ........: 1946
    Autor ......: John von Neumann
"""

import time

def meanSquare(seed):
    seed = (seed * seed // 100) % 10000
    return seed

Xn1 = 1234
Xn2 = int(time.time())

print("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
print("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
print("PADRAO: Middle Square")
print("==========================================")
print()
print("    Semente: 1234        Semente: TIME")
print("    -------------        -------------")

for i in range(1, 11):
    Xn1 = meanSquare(Xn1)
    Xn2 = meanSquare(Xn2)
    print(f"{Xn1:17d}        {Xn2:13d}")
