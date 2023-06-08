#include <stdio.h>
#include <math.h>
#include <stdbool.h>
#include <string.h>
#include <ctype.h>

#define LimiteMaximoDecimal 2147483647
#define LimiteMaximoHexadecimal "7FFFFFFF"

unsigned int DecimalParaHexadecimal(unsigned int decimal) {
    unsigned int resto;
    char hexadecimal[10];
    int i = 0;
    while (decimal > 0) {
        resto = decimal % 16;
        if (resto >= 0 && resto <= 9)
            hexadecimal[i] = resto + '0';
        else
            hexadecimal[i] = resto - 10 + 'A';
        decimal = decimal / 16;
        i++;
    }
    hexadecimal[i] = '\0';
    int j, k;
    char temp;
    for (j = 0, k = strlen(hexadecimal) - 1; j < k; j++, k--) {
        temp = hexadecimal[j];
        hexadecimal[j] = hexadecimal[k];
        hexadecimal[k] = temp;
    }
    return (unsigned int)strtoul(hexadecimal, NULL, 16);
}

unsigned int HexadecimalParaDecimal(unsigned int hexadecimal) {
    unsigned int potencia = 0;
    unsigned int digito;
    unsigned int decimal = 0;
    char hexadecimalStr[10];
    sprintf(hexadecimalStr, "%X", hexadecimal);
    unsigned int tamanho = strlen(hexadecimalStr);
    for (int i = tamanho - 1; i >= 0; i--) {
        digito = toupper(hexadecimalStr[i]);
        if (digito >= '0' && digito <= '9')
            decimal += (digito - '0') * pow(16, potencia);
        else if (digito >= 'A' && digito <= 'F')
            decimal += (digito - 'A' + 10) * pow(16, potencia);

        potencia++;
    }
    return decimal;
}

bool IsValidHexadecimal(unsigned int hexadecimal) {
    char hexadecimalStr[10];
    sprintf(hexadecimalStr, "%X", hexadecimal);
    for (int i = 0; i < strlen(hexadecimalStr); i++) {
        if (!isxdigit(hexadecimalStr[i]))
            return false;
    }
    return true;
}

int main(void) {
    int opcao;
    unsigned int decimal;
    unsigned int hexadecimal;
    do {
        printf("===============================\n");
        printf(" CONVERSOR DECIMAL-HEXADECIMAL \n");
        printf("===============================\n\n");
        printf("1 - Converter decimal para hexadecimal\n");
        printf("2 - Converter hexadecimal para decimal\n");
        printf("0 - Sair\n\n");
        printf("Digite a opcao desejada: ");
        scanf("%d", &opcao);
        switch (opcao) {
            case 1: {
                printf("\nDigite um numero decimal (ate %u): ", LimiteMaximoDecimal);
                scanf("%u", &decimal);
                if (decimal > LimiteMaximoDecimal) {
                    printf("Valor decimal fora do limite permitido.\n");
                } else {
                    printf("Valor em hexadecimal: %X\n", DecimalParaHexadecimal(decimal));
                }
                break;
            }
            case 2: {
                printf("\nDigite um numero hexadecimal (ate %s): ", LimiteMaximoHexadecimal);
                scanf("%X", &hexadecimal);
                if (!IsValidHexadecimal(hexadecimal)) {
                    printf("Valor hexadecimal invalido.\n");
                } else if (HexadecimalParaDecimal(hexadecimal) > LimiteMaximoDecimal) {
                    printf("Valor hexadecimal fora do limite permitido.\n");
                } else {
                    printf("Valor em decimal: %u\n", HexadecimalParaDecimal(hexadecimal));
                }
                break;
            }
        }
        printf("\n");
    } while (opcao != 0);
    return 0;
}
