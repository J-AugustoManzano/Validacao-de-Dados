# ValidarMatricula
def ValidarMatricula(MATRICULA):
    if len(MATRICULA) != 9:
        return False
    if not (MATRICULA[0].isdigit() and MATRICULA[1].isdigit() and MATRICULA[2].isdigit()):
        return False
    if MATRICULA[3] != '.':
        return False
    if not (MATRICULA[4].isdigit() and MATRICULA[5].isdigit() and MATRICULA[6].isdigit()):
        return False
    if MATRICULA[7] != '-':
        return False
    if not MATRICULA[8].isdigit():
        return False
    return True

def RemoverCaractere(CADEIA, CARACTERE):
    return CADEIA.replace(CARACTERE, "")

def Mod10Check(MATRICULA):
    MATRIC_INT = [int(c) for c in MATRICULA[:6]]
    SOMA = 0
    DV = 0
    for i in range(6):
        if (i + 1) % 2 == 0:
            if MATRIC_INT[i] * 2 > 9:
                SOMA += MATRIC_INT[i] * 2 - 9
            else:
                SOMA += MATRIC_INT[i] * 2
        else:
            SOMA += MATRIC_INT[i]
    DV = (10 - (SOMA % 10)) % 10
    return DV

MATRIC_CPT = ""
MATRIC_SPT = ""
MATRIC_INT = [0] * 7
DVC = 0
DVE = 0

while True:
    MATRIC_CPT = input("Informe a matricula no formato 999.999-9: ")
    if not ValidarMatricula(MATRIC_CPT):
        print("\nEntrada invalida, tente novamente.\n\n")
    else:
        break

MATRIC_SPT = MATRIC_CPT
MATRIC_SPT = RemoverCaractere(MATRIC_SPT, '.')
MATRIC_SPT = RemoverCaractere(MATRIC_SPT, '-')

DVC = Mod10Check(MATRIC_SPT)

for i in range(7):
    MATRIC_INT[i] = int(MATRIC_SPT[i])

DVE = MATRIC_INT[6]

print()
if DVC == DVE:
    print("Matricula valida.")
else:
    print("Matricula invalida.")
print()

input("Pressione <Enter> para encerrar... ")
