dammTab = [
    [0, 3, 1, 7, 5, 9, 8, 6, 4, 2],
    [7, 0, 9, 2, 1, 5, 4, 8, 6, 3],
    [4, 2, 0, 6, 8, 7, 1, 3, 5, 9],
    [1, 7, 5, 0, 9, 8, 3, 4, 2, 6],
    [6, 1, 2, 3, 0, 4, 5, 9, 7, 8],
    [3, 6, 7, 4, 2, 0, 9, 5, 8, 1],
    [5, 8, 6, 9, 7, 2, 0, 1, 3, 4],
    [8, 9, 4, 5, 3, 6, 2, 0, 1, 7],
    [9, 4, 3, 8, 6, 1, 7, 2, 0, 5],
    [2, 5, 8, 1, 4, 3, 6, 7, 9, 0]
]

def gerarDamm(NUMERO):
    DV = 0
    for I in NUMERO:
        DV = dammTab[DV][int(I)]
    return DV

def formata_MATRICULA(MATRICULA):
    return f"{MATRICULA:06d}"

def main():
    try:
        ARQUIVO = open("numeros.txt", "w")

        print("GERADOR DE NUMEROS DE MATRICULA DE 000.000 ATE 999.999 COM \"DV\"")
        print("Padrao: Damm")
        print("---------------------------------------------------------------")
        print()
        print("Aguarde ARQUIVO sendo gerado... ", end="", flush=True)

        for I in range(1000000):
            MATRICULA = formata_MATRICULA(I)
            DV = gerarDamm(MATRICULA)
            ARQUIVO.write(f"{MATRICULA[:3]}.{MATRICULA[3:]}-{DV}\n")

        ARQUIVO.close()

        print("\n\nSUCESSO: Arquivo gerado.\n")

    except IOError:
        print("Erro ao abrir o ARQUIVO.")
        print("Programa encerrado.")

if __name__ == "__main__":
    main()
