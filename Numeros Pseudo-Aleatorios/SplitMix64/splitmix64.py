"""
   PRNG .......: SplitMix64
   Ano ........: 2015
   Autor ......: Sebastiano Vigna
"""

# Fundamentado: rosettacode.org/wiki/Pseudo-random_numbers/Splitmix64

import time


class SplitMix64:
    def __init__(self, state):
        self.state = state

    def next_int(self):
        self.state += 0x9e3779b97f4a7c15
        z = self.state
        z = (z ^ (z >> 30)) * 0xbf58476d1ce4e5b9
        z = (z ^ (z >> 27)) * 0x94d049bb133111eb
        return z & 0xFFFFFFFFFFFFFFFF  # Limita a 64 bits

    def next_float(self):
        return float(self.next_int() >> 11) / (1 << 53)


Xn1 = SplitMix64(1234)
Xn2 = SplitMix64(int(time.time() * 1e9))

print("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
print("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
print("PADRAO: SplitMix64")
print("===================================================")
print("")

print("  Semente: 1234 (int)        Semente: TIME (int)")
print("  --------------------       --------------------")
for i in range(1, 6):
    print(f"{Xn1.next_int():22}{Xn2.next_int():27}")

print("\n  Semente: 1234 (real)       Semente: TIME (real)")
print("  --------------------       --------------------")
for i in range(1, 6):
    print(f"{Xn1.next_float():22.18f}{Xn2.next_float():27.18f}")
