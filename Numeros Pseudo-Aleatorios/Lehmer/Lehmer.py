"""
   PRNG .......: Lehmer (Metodo Congruencial Linear Multiplicativo)
   Ano ........: 1951
   Autor ......: Derrick Henry "Dick" Lehmer
"""

import time

def Lehmer(seed):
    seed = (16807 * seed) % 2147483647
    return seed

print("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
print("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
print("PADRAO: Lehmer")
print("==========================================\n")
print("    Semente: 1234        Semente: TIME")
print("    -------------        -------------")

Xn1 = 1234
Xn2 = int(time.time())

for i in range(1, 11):
    Xn1 = Lehmer(Xn1)
    Xn2 = Lehmer(Xn2)
    print(f"{Xn1:17}        {Xn2:13}")
