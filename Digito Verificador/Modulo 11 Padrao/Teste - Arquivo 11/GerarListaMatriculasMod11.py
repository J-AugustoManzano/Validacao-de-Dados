import sys

def removerCaractere(CADEIA, CARACTERE):
    POS1 = 0
    POS2 = 0
    while CADEIA[POS1] != '\0':
        CADEIA[POS2] = CADEIA[POS1]
        if CADEIA[POS2] != CARACTERE:
            POS2 += 1
        POS1 += 1
    CADEIA[POS2] = '\0'

def mod11(MATRIC_CPT):
    MATRIC_SPT = ['\0'] * 8
    MATRIC_INT = [0] * 6
    SOMA = 0
    DV = ' '
    for i in range(8):
        MATRIC_SPT[i] = MATRIC_CPT[i]
    removerCaractere(MATRIC_SPT, '.')
    for i in range(6):
        MATRIC_INT[i] = ord(MATRIC_SPT[i]) - 48
    for i in range(6):
        SOMA += MATRIC_INT[i] * (7 - i)
    if SOMA % 11 == 0:
        DV = '0'
    elif SOMA % 11 == 1:
        DV = 'X'
    elif SOMA % 11 == 10:
        DV = '1'
    else:
        DV = chr(11 - (SOMA % 11) + 48)
    return DV

def main():
    MATRICULA = ['\0'] * 12

    try:
        ARQUIVO = open("numeros.txt", "w")
    except IOError:
        sys.stderr.write("Erro ao abrir o arquivo.\n")
        print("Programa encerrado.")
        print()
        return

    print("GERADOR DE NUMEROS DE MATRICULA DE 000.000 ATE 999.999 COM \"DV\"")
    print("Padrao: Modulo 11")
    print("---------------------------------------------------------------")
    print()

    print("Aguarde arquivo sendo gerado... ", end="")
    sys.stdout.flush()

    for I in range(1000000):
        MATRICULA_STR = "{:06d}".format(I)
        for i in range(len(MATRICULA_STR)):
            MATRICULA[i] = MATRICULA_STR[i]
        DV = mod11(MATRICULA)
        MATRICULA_FORMATADA = "{}.{}-{}".format(MATRICULA_STR[:3], MATRICULA_STR[3:], DV)
        ARQUIVO.write(MATRICULA_FORMATADA + "\n")

    ARQUIVO.close()

    print("\n\nSUCESSO: Arquivo gerado.\n")

if __name__ == "__main__":
    main()
