verhoeffD = [
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
    [1, 2, 3, 4, 0, 6, 7, 8, 9, 5],
    [2, 3, 4, 0, 1, 7, 8, 9, 5, 6],
    [3, 4, 0, 1, 2, 8, 9, 5, 6, 7],
    [4, 0, 1, 2, 3, 9, 5, 6, 7, 8],
    [5, 9, 8, 7, 6, 0, 4, 3, 2, 1],
    [6, 5, 9, 8, 7, 1, 0, 4, 3, 2],
    [7, 6, 5, 9, 8, 2, 1, 0, 4, 3],
    [8, 7, 6, 5, 9, 3, 2, 1, 0, 4],
    [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
]

verhoeffP = [
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
    [1, 5, 7, 6, 2, 8, 3, 0, 9, 4],
    [5, 8, 0, 3, 7, 9, 6, 1, 4, 2],
    [8, 9, 1, 6, 0, 4, 3, 5, 2, 7],
    [9, 4, 5, 3, 1, 2, 6, 8, 7, 0],
    [4, 2, 8, 6, 5, 7, 3, 9, 0, 1],
    [2, 7, 9, 3, 8, 0, 6, 4, 1, 5],
    [7, 0, 4, 6, 9, 1, 3, 2, 5, 8]
]

verhoeffInv = [
    0, 4, 3, 2, 1, 5, 6, 7, 8, 9
]

def gerarVerhoeff(NUMERO):
    DIGITO = 0
    TAMANHO = len(NUMERO)
    for I in range(TAMANHO):
        POS = (I + 1) % 8
        NUM = int(NUMERO[TAMANHO - I - 1])
        DIGITO = verhoeffD[DIGITO][verhoeffP[POS][NUM]]
    return verhoeffInv[DIGITO]

def formata_MATRICULA(MATRICULA):
    return f"{MATRICULA:06d}"

def main():
    try:
        ARQUIVO = open("numeros.txt", "w")

        print("GERADOR DE NUMEROS DE MATRICULA DE 000.000 ATE 999.999 COM \"DV\"")
        print("Padrao: Verhoeff")
        print("---------------------------------------------------------------")
        print()
        print("Aguarde ARQUIVO sendo gerado... ", end="", flush=True)

        for I in range(1000000):
            MATRICULA = formata_MATRICULA(I)
            DV = gerarVerhoeff(MATRICULA)
            ARQUIVO.write(f"{MATRICULA[:3]}.{MATRICULA[3:]}-{DV}\n")

        ARQUIVO.close()

        print("\n\nSUCESSO: Arquivo gerado.\n")

    except IOError:
        print("Erro ao abrir o ARQUIVO.")
        print("Programa encerrado.")

if __name__ == "__main__":
    main()
