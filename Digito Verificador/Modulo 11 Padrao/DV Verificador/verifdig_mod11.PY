def validarMatricula(MATRICULA):
    TAMANHO = len(MATRICULA)
    if TAMANHO != 9:
        return False
    if MATRICULA[3] != '.' or MATRICULA[7] != '-':
        return False
    for I in range(TAMANHO):
        if I != 3 and I != 7 and not MATRICULA[I].isdigit():
            return False
    return True

def removerCaractere(CADEIA, CARACTERE):
    NOVA_CADEIA = ''
    for I in range(len(CADEIA)):
        if CADEIA[I] != CARACTERE:
            NOVA_CADEIA += CADEIA[I]
    return NOVA_CADEIA

def mod11Check(MATRIC_CPT):
    MATRIC_SPT = MATRIC_CPT
    MATRIC_SPT = removerCaractere(MATRIC_SPT, '.')
    MATRIC_INT = [0] * 6
    SOMA = 0
    for I in range(6):
        MATRIC_INT[I] = int(MATRIC_SPT[I])
    for I in range(6):
        SOMA += MATRIC_INT[I] * (7 - I)
    if (SOMA % 11) == 0:
        DV = '0'
    elif (SOMA % 11) == 1:
        DV = 'X'
    elif (SOMA % 11) == 10:
        DV = '1'
    elif (11 - SOMA % 11) >= 2 and (11 - SOMA % 11) <= 9:
        DV = str((11 - (SOMA % 11)))
    return DV

MATRICULA = ''
DVC = ''
DVE = ''

while True:
    MATRICULA = input("Informe matricula no formato 999.999-9: ")
    if not validarMatricula(MATRICULA):
        print("\nMatricula invalida. Tente novamente.\n")
    else:
        break

DVC = mod11Check(MATRICULA)
DVE = MATRICULA[8]
print()
if DVC == DVE:
    print("Numero de matricula valido")
else:
    print("Numero de matricula invalido")
print()
input("Tecle <Enter> para encerrar...")
