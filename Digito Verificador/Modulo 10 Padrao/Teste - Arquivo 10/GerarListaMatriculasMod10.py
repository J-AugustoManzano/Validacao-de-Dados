def formata_MATRICULA(MATRICULA):
    return f"{MATRICULA:06d}"

def mod10(MATRICULA):
    SOMA = 0
    for i in range(6):
        DIGITO = int(MATRICULA[i])
        if i % 2 != 0 and DIGITO * 2 > 9:
            SOMA += DIGITO * 2 - 9
        elif i % 2 != 0 and DIGITO * 2 <= 9:
            SOMA += DIGITO * 2
        else:
            SOMA += DIGITO
    DV = SOMA % 10
    if DV != 0:
        DV = 10 - DV
    return DV

def main():
    try:
        ARQUIVO = open("numeros.txt", "w")

        print("GERADOR DE NUMEROS DE MATRICULA DE 000.000 ATE 999.999 COM \"DV\"")
        print("Padrao: Modulo 10")
        print("---------------------------------------------------------------")
        print()
        print("Aguarde ARQUIVO sendo gerado... ", end="", flush=True)

        for I in range(1000000):
            MATRICULA = formata_MATRICULA(I)
            DV = mod10(MATRICULA)
            ARQUIVO.write(f"{MATRICULA[:3]}.{MATRICULA[3:]}-{DV}\n")

        ARQUIVO.close()

        print("\n\nSUCESSO: Arquivo gerado.\n")

    except IOError:
        print("Erro ao abrir o ARQUIVO.")
        print("Programa encerrado.")

if __name__ == "__main__":
    main()
