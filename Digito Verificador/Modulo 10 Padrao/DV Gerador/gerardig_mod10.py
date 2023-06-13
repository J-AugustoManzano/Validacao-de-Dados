# GerarMatricula
def validarMatricula(MATRICULA):
    if len(MATRICULA) != 7:
        return False
    if not MATRICULA[0].isdigit() or not MATRICULA[6].isdigit():
        return False
    if MATRICULA[3] != '.':
        return False
    for I in range(1, 3):
        if not MATRICULA[I].isdigit() or not MATRICULA[I + 4].isdigit():
            return False
    return True

def removerCaractere(CADEIA, CARACTERE):
    NOVO_CADEIA = CADEIA.replace(CARACTERE, "")
    return NOVO_CADEIA

def mod10(MATRICULA):
    MATRIC_INT = [int(DIGITO) for DIGITO in MATRICULA]
    SOMA = 0
    for I in range(6):
        if I % 2 != 0 and MATRIC_INT[I] * 2 > 9:
            SOMA += MATRIC_INT[I] * 2 - 9
        elif I % 2 != 0 and MATRIC_INT[I] * 2 <= 9:
            SOMA += MATRIC_INT[I] * 2
        if I % 2 == 0:
            SOMA += MATRIC_INT[I]
    DV = (SOMA // 10 + 1) * 10 - SOMA
    return DV

MATRIC_CPT = ""
MATRIC_SPT = ""
DV = 0

while True:
    MATRIC_CPT = input("Informe matricula no formato 999.999: ")
    if not validarMatricula(MATRIC_CPT):
        print("\nMatricula invalida. Tente novamente.\n\n")
    else:
        break
        
MATRIC_SPT = removerCaractere(MATRIC_CPT, '.')
DV = mod10(MATRIC_SPT)
print("\nMatricula com DV = {}-{}\n".format(MATRIC_CPT, DV))
input("Pressione <Enter> para encerrar...")
