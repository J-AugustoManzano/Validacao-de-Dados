def validarMatricula(MATRICULA):
    if len(MATRICULA) != 7:
        return False
    if not MATRICULA[0].isdigit() or not MATRICULA[6].isdigit():
        return False
    if MATRICULA[3] != '.':
        return False
    for i in range(1, 3):
        if not MATRICULA[i].isdigit() or not MATRICULA[i + 4].isdigit():
            return False
    return True

def removerCaractere(CADEIA, CARACTERE):
    return CADEIA.replace(CARACTERE, "")

def mod11(MATRIC_CPT):
    MATRIC_SPT = removerCaractere(MATRIC_CPT, ".")
    MATRIC_INT = [int(char) for char in MATRIC_SPT]
    SOMA = sum(MATRIC_INT[i] * (7 - i) for i in range(6))
    if SOMA % 11 == 0:
        DV = "0"
    elif SOMA % 11 == 1:
        DV = "X"
    elif SOMA % 11 == 10:
        DV = "1"
    else:
        DV = str(11 - (SOMA % 11))
    return DV

def main():
    while True:
        MATRICULA = input("Informe matricula no formato 999.999: ")
        if not validarMatricula(MATRICULA):
            print()
            print("Matricula invalida. Tente novamente.")
            print()
        else:
            break

    DV = mod11(MATRICULA)
    print()
    print(f"Matricula com DV = {MATRICULA}-{DV}")
    print()
    input("Tecle <Enter> para encerrar...")

if __name__ == "__main__":
    main()
