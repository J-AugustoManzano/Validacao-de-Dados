# Tabela de multiplicacao: d(j, k)
# k = 10 colunas
# j = 10 linhas
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

# Tabela de permutacao: p(pos, num)
# num = 10 colunas
# pos =  8 linhas (mod 8)
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

# Tabela de inversao: inv(j)
# j = 8 colunas
#     1 linha
verhoeffInv = [
    0, 4, 3, 2, 1, 5, 6, 7, 8, 9
]

# Gerar digito verificador no padrao Verhoeff
def gerarVerhoeff(NUMERO):
    DIGITO = 0
    TAMANHO = len(NUMERO)
    for I in range(TAMANHO):
        POS = (I + 1) % 8
        NUM = int(NUMERO[TAMANHO - I - 1])
        DIGITO = verhoeffD[DIGITO][verhoeffP[POS][NUM]]
    return verhoeffInv[DIGITO]

# Validar digito verificador no padrao Verhoeff
# Ultimo digito do numero fornecido
def validarVerhoeff(NUMERO):
    DIGITO = 0
    TAMANHO = len(NUMERO)
    for I in range(TAMANHO):
        POS = I % 8
        NUM = int(NUMERO[TAMANHO - I - 1])
        DIGITO = verhoeffD[DIGITO][verhoeffP[POS][NUM]]
    return DIGITO == 0

# Remove a mascara do numero
def removerMascara(NUMERO):
    NUMERO_SMASC = ""
    ENCONTROU_PRIMEIRO_DIGITO = False
    for CARACTERE in NUMERO:
        if CARACTERE == '.':
            ENCONTROU_PRIMEIRO_DIGITO = True
        elif CARACTERE.isdigit():
            if not ENCONTROU_PRIMEIRO_DIGITO and CARACTERE == '0':
                continue
            NUMERO_SMASC += CARACTERE
    return NUMERO_SMASC

while True:
    NUMERO = input("Entre a matricula no formato 999.999: ")
    print()
    if len(NUMERO) != 7 or NUMERO[3] != '.':
        print()
        print("Matricula invalida. Tente novamente.")
        print()
    else:
        break

NUMERO_SMASC = removerMascara(NUMERO)
DV = gerarVerhoeff(NUMERO_SMASC)
print("Digito verificador:", DV)
print()

while True:
    NUMERO_COM_DV = input("Entre matricula e digito verificador no formato 999.999-9: ")
    print()
    if len(NUMERO_COM_DV) != 9 or NUMERO_COM_DV[3] != '.' or NUMERO_COM_DV[7] != '-':
        print()
        print("Matricula invalida. Tente novamente.")
        print()
    else:
        break

NUMERO_SEM_MASCARA_DV = removerMascara(NUMERO_COM_DV)
if validarVerhoeff(NUMERO_SEM_MASCARA_DV):
    print("Matricula valida.")
else:
    print("Matricula invalida.")
