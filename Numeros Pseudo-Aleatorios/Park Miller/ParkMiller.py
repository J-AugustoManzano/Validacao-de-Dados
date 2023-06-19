"""
   PRNG .......: Park-Miller
   Ano ........: 1988
   Autor ......: S. K. Park & K. W. Miller
"""

import time

def ParkMiller(X):
    X = (16807 * X) % 2147483647
    return X

Xn1 = 1234
Xn2 = int(time.time())

print("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
print("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
print("PADRAO: Park-Miller")
print("==========================================")
print()
print("    Semente: 1234        Semente: TIME")
print("    -------------        -------------")

for i in range(1, 11):
    Xn1 = ParkMiller(Xn1)
    Xn2 = ParkMiller(Xn2)
    print(f"{Xn1:17}        {Xn2:13}")
