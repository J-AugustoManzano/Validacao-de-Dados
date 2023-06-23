"""
  PRNG .......: RANDU
  Ano ........: Decada de 1960
  Autor ......: IBM
"""

import time

def RANDU(seed):
    return (65539 * seed) % 2147483648

def main():
    Xn1 = 1234
    Xn2 = int(time.time())

    print("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
    print("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
    print("PADRAO: RANDU")
    print("==========================================")
    print()
    print("    Semente: 1234        Semente: TIME")
    print("    -------------        -------------")

    for i in range(1, 11):
        Xn1 = RANDU(Xn1)
        Xn2 = RANDU(Xn2)
        print(f"{Xn1:17}        {Xn2:13}")

if __name__ == "__main__":
    main()
