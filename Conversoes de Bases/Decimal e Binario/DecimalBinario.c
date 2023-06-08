#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define LIMITE_MAXIMO_DECIMAL 2147483647
#define LIMITE_MAXIMO_BINARIO "1111111111111111111111111111111"

char* decimalParaBinario(unsigned int decimal) {
    char* binario = (char*)malloc(33 * sizeof(char));
    int i = 0;
    for (i = 0; i < 32; i++) {
        binario[i] = '0';
    }
    binario[32] = '\0';
    i = 31;
    while (decimal > 0) {
        binario[i] = (decimal % 2) + '0';
        decimal /= 2;
        i--;
    }
    return binario;
}

unsigned int binarioParaDecimal(const char* binario) {
    int i = 0;
    unsigned int valor = 0;
    for (i = strlen(binario) - 1; i >= 0; i--) {
        if (binario[i] == '1') {
            int potencia = strlen(binario) - 1 - i;
            valor += (1 << potencia);
        }
    }
    return valor;
}

int isValidBinario(const char* binario) {
    int i = 0;
    int tamanho = strlen(binario);
    for (i = 0; i < tamanho; i++) {
        if (binario[i] != '0' && binario[i] != '1') {
            return 0;
        }
    }
    return 1;
}

int main(void) {
    int opcao = 0;
    unsigned int decimal = 0;
    char binario[33];
    do {
        printf("===========================\n");
        printf(" CONVERSOR DECIMAL-BINARIO \n");
        printf("===========================\n\n");
        printf("1 - Converter decimal para binario\n");
        printf("2 - Converter binario para decimal\n");
        printf("0 - Sair\n\n");
        printf("Digite a opcao desejada: ");
        scanf("%d", &opcao);
        switch (opcao) {
            case 1:
                printf("\nDigite um numero decimal (ate %u): ", LIMITE_MAXIMO_DECIMAL);
                scanf("%u", &decimal);
                if (decimal > LIMITE_MAXIMO_DECIMAL) {
                    printf("Valor decimal fora do limite permitido.\n");
                } else {
                    char* bin = decimalParaBinario(decimal);
                    printf("Valor em binario: %s\n", bin);
                    free(bin);
                }
                break;
            case 2:
                printf("\nDigite um numero binario (ate %s): ", LIMITE_MAXIMO_BINARIO);
                scanf("%s", binario);
                if (!isValidBinario(binario)) {
                    printf("Valor binario invalido.\n");
                } else if (strlen(binario) > strlen(LIMITE_MAXIMO_BINARIO)) {
                    printf("Valor binario fora do limite permitido.\n");
                } else {
                    unsigned int dec = binarioParaDecimal(binario);
                    printf("Valor em decimal: %u\n", dec);
                }
                break;
            case 0:
                break;
            default:
                printf("Opcao invalida. Tente novamente.\n");
                break;
        }
        printf("\n");
    } while (opcao != 0);
    return 0;
}
