"""
PRNG .......: Linear-Feedback Shift Register (LFSR)
Ano ........: 1965
Autor ......: R. C. Tausworthe
"""

import time

def lfsr(state):
    state[0] = (state[0] >> 1) ^ (0xB4BCD35C * (state[0] & 1))
    return state[0] / 4294967296.0

Xn1 = [0x1234]
Xn2 = [int(time.time()) & 0xFFFFFFFF]

print("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
print("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
print("PADRAO: Linear-Feedback Shift Register")
print("==========================================\n")
print("    Semente: 1234        Semente: TIME")
print("    -------------        -------------\n")

for i in range(1, 11):
    print("{:17.11f}        {:13.11f}".format(lfsr(Xn1), lfsr(Xn2)))
