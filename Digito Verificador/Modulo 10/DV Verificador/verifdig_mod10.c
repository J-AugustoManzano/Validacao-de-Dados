// ValidarMatricula
#include <stdio.h>
#include <string.h>

int validarMatricula(const char* MATRICULA) {
    if (strlen(MATRICULA) != 9)
        return 0;
    if (!(MATRICULA[0] >= '0' && MATRICULA[0] <= '9') || !(MATRICULA[1] >= '0' && MATRICULA[1] <= '9') || !(MATRICULA[2] >= '0' && MATRICULA[2] <= '9'))
        return 0;
    if (MATRICULA[3] != '.')
        return 0;
    if (!(MATRICULA[4] >= '0' && MATRICULA[4] <= '9') || !(MATRICULA[5] >= '0' && MATRICULA[5] <= '9') || !(MATRICULA[6] >= '0' && MATRICULA[6] <= '9'))
        return 0;
    if (MATRICULA[7] != '-')
        return 0;
    if (!(MATRICULA[8] >= '0' && MATRICULA[8] <= '9'))
        return 0;
    return 1;
}

void removerCaractere(char* CADEIA, char CARACTERE) {
    int POS1 = 0;
    int POS2 = 0;
    while (CADEIA[POS1] != '\0') {
        if (CADEIA[POS1] != CARACTERE) {
            CADEIA[POS2] = CADEIA[POS1];
            POS2++;
        }
        POS1++;
    }
    CADEIA[POS2] = '\0';
}

int mod10Check(const char* MATRICULA) {
    int MATRIC_INT[6];
    int SOMA = 0;
    int DV;
    for (int i = 0; i < 6; ++i)
        MATRIC_INT[i] = MATRICULA[i] - '0';
    for (int i = 0; i < 6; ++i) {
        if ((i + 1) % 2 == 0) {
            if (MATRIC_INT[i] * 2 > 9)
                SOMA += MATRIC_INT[i] * 2 - 9;
            else
                SOMA += MATRIC_INT[i] * 2;
        } else {
            SOMA += MATRIC_INT[i];
        }
    }
    DV = (10 - (SOMA % 10)) % 10;
    return DV;
}

int main() {
    char MATRIC_CPT[11];
    char MATRIC_SPT[10];
    int MATRIC_INT[7];
    int DVC, DVE;

    do {
        printf("Informe a matricula no formato 999.999-9: ");
        fgets(MATRIC_CPT, sizeof(MATRIC_CPT), stdin);
        MATRIC_CPT[strcspn(MATRIC_CPT, "\n")] = '\0';
        if (!validarMatricula(MATRIC_CPT)) {
            printf("\n");
            printf("Entrada invalida, tente novamente.\n");
            printf("\n\n");
        }
    } while (!validarMatricula(MATRIC_CPT));

    strcpy(MATRIC_SPT, MATRIC_CPT);
    removerCaractere(MATRIC_SPT, '.');
    removerCaractere(MATRIC_SPT, '-');
    DVC = mod10Check(MATRIC_SPT);

    for (int i = 0; i < 7; ++i)
        MATRIC_INT[i] = MATRIC_SPT[i] - '0';
    DVE = MATRIC_INT[6];

    printf("\n");
    if (DVC == DVE)
        printf("Matricula valida.\n");
    else
        printf("Matricula invalida.\n");
    printf("\n");

    printf("Pressione <Enter> para encerrar... ");
    getchar();
    return 0;
}
