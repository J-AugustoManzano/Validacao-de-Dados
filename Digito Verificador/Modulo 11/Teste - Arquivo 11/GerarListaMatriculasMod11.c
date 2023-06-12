#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void removerCaractere(char CADEIA[], char CARACTERE)
{
    char* POS1 = CADEIA;
    char* POS2 = CADEIA;
    while (*POS1)
    {
        *POS2 = *POS1++;
        POS2 += (*POS2 != CARACTERE);
    }
    *POS2 = '\0';
}

char mod11(char MATRIC_CPT[])
{
    char MATRIC_SPT[8];
    int  MATRIC_INT[6];
    int  I, SOMA = 0;
    char DV;
    strcpy(MATRIC_SPT, MATRIC_CPT);
    removerCaractere(MATRIC_SPT, '.');
    for (I = 0; I <= 5; I++)
        MATRIC_INT[I] = MATRIC_SPT[I] - 48;
    for (I = 0; I <= 5; I++)
        SOMA += MATRIC_INT[I] * (7 - I);
    if ((SOMA % 11) == 0)
        DV = 48; // DV = 0
    else if ((SOMA % 11) == 1)
        DV = 88; // DV = X
    else if ((SOMA % 11) == 10)
        DV = 49; // DV = 1
    else
        DV = (11 - (SOMA % 11)) + 48;
    return DV;
}

int main(void) {
	
    char MATRICULA[12];
    char MATRICULA_TEMP[12];
    int I;
    FILE* ARQUIVO = fopen("numeros.txt", "w");
  
    printf("GERADOR DE NUMEROS DE MATRICULA DE 000.000 ATE 999.999 COM \"DV\"\n");
    printf("Padrao: Modulo 11\n");
    printf("---------------------------------------------------------------\n\n");

    if (ARQUIVO == NULL) {
        fprintf(stderr, "Erro ao abrir o arquivo.\n");
        printf("Programa encerrado.\n\n");
        return 1;
    }

    printf("Aguarde arquivo sendo gerado... ");

    for (I = 0; I <= 999999; I++) {
        sprintf(MATRICULA, "%06d", I);
        strcpy(MATRICULA_TEMP, MATRICULA);
        snprintf(MATRICULA, sizeof(MATRICULA), "%.3s.%.3s-%c", MATRICULA_TEMP, MATRICULA_TEMP + 3, mod11(MATRICULA_TEMP));
        fprintf(ARQUIVO, "%s\n", MATRICULA);
    }

    fclose(ARQUIVO);

    printf("\n\nSUCESSO: Arquivo gerado.\n\n");

    return 0;
}
