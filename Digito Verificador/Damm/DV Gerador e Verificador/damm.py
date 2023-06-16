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

def validarDamm(NUMERO):
    DV = 0
    for I in NUMERO:
        DV = dammTab[DV][int(I)]
    return DV == 0

def remover_mascara(NUMERO):
    NUMERO_SEM_MASCARA_DV = ''
    encontrou_primeiro_digito = False

    for char in NUMERO:
        if char == '.':
            encontrou_primeiro_digito = True
        elif char.isdigit():
            if not encontrou_primeiro_digito and char == '0':
                continue
            NUMERO_SEM_MASCARA_DV += char

    return NUMERO_SEM_MASCARA_DV

entradaValida = False

while not entradaValida:
    NUMERO = input('Entre matricula no formato 999.999: ')
    print()
    if (len(NUMERO) != 7) or (NUMERO[3] != '.'):
        print()
        print('Matricula invalida. Tente novamente.')
        print()
    else:
        entradaValida = True

NUMERO_SEM_MASCARA_DV = remover_mascara(NUMERO)
dv = gerarDamm(NUMERO_SEM_MASCARA_DV)
print(f'Digito verificador: {dv}')
print()

entradaValida = False
while not entradaValida:
    NUMERO_COM_DV = input('Entre matricula e digito verificador no formato 999.999-9: ')
    print()
    if (len(NUMERO_COM_DV) != 9) or (NUMERO_COM_DV[3] != '.') or (NUMERO_COM_DV[7] != '-'):
        print()
        print('Matricula invalida. Tente novamente.')
        print()
    else:
        entradaValida = True

NUMERO_SEM_MASCARA_DV = remover_mascara(NUMERO_COM_DV)
if validarDamm(NUMERO_SEM_MASCARA_DV):
    print('Matricula valida.')
else:
    print('Matricula invalida.')
