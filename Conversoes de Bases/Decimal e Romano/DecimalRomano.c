#include <stdio.h>
#include <string.h>
#include <ctype.h>

#define ALGARISMOS_ROMANOS_COUNT 13
#define LIMITE_MAXIMO_DECIMAL 3999
#define LIMITE_MAXIMO_ROMANO "MMMCMXCIX"

const char* algarismosRomanos[ALGARISMOS_ROMANOS_COUNT] = {"I", "IV", "V", "IX", "X", "XL", "L", "XC", "C", "CD", "D", "CM", "M"};
const int valoresDecimais[ALGARISMOS_ROMANOS_COUNT] = {1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000};

char* DecimalParaRomano(int decimal) {
    char romano[20] = "";
    int i = ALGARISMOS_ROMANOS_COUNT - 1;
    while (decimal > 0) {
        if (decimal >= valoresDecimais[i]) {
            strcat(romano, algarismosRomanos[i]);
            decimal -= valoresDecimais[i];
        }
        else {
            i--;
        }
    }
    return romano;
}

int RomanoParaDecimal(const char* romano) {
    int resultado = 0;
    int valorAnterior = 0;
    int tamanhoRomano = strlen(romano);
    for (int i = tamanhoRomano - 1; i >= 0; i--) {
        int valorAtual = 0;
        int valorEncontrado = 0;
        for (int j = 0; j < ALGARISMOS_ROMANOS_COUNT; j++) {
            if (toupper(romano[i]) == *algarismosRomanos[j]) {
                valorAtual = valoresDecimais[j];
                valorEncontrado = 1;
                break;
            }
        }
        if (!valorEncontrado) {
            resultado = 0;
            break;
        }
        if (valorAtual < valorAnterior) {
            resultado -= valorAtual;
        }
        else {
            resultado += valorAtual;
            valorAnterior = valorAtual;
        }
    }
    return resultado;
}

int main(void) {
    int opcao;
    int decimal;
    char romano[20];
    do {
        printf("==========================\n");
        printf(" CONVERSOR DECIMAL-ROMANO \n");
        printf("==========================\n\n");
        printf("1 - Converter decimal para romano\n");
        printf("2 - Converter romano para decimal\n");
        printf("0 - Sair\n\n");
        printf("Digite a opcao desejada: ");
        scanf("%d", &opcao);
        switch (opcao) {
            case 1:
                printf("\nDigite um numero decimal (ate %d): ", LIMITE_MAXIMO_DECIMAL);
                scanf("%d", &decimal);
                if (decimal < 1 || decimal > LIMITE_MAXIMO_DECIMAL) {
                    printf("Valor decimal fora do limite permitido.\n");
                }
                else {
                    printf("Valor em algarismo romano: %s\n", DecimalParaRomano(decimal));
                }
                break;
            case 2:
                printf("\nDigite um numero romano (ate %s): ", LIMITE_MAXIMO_ROMANO);
                scanf("%s", romano);
                if (strlen(romano) == 0 || RomanoParaDecimal(romano) == 0) {
                    printf("Valor romano fora do limite permitido.\n");
                }
                else {
                    printf("Valor em decimal: %d\n", RomanoParaDecimal(romano));
                }
                break;
        }
        printf("\n");
    } while (opcao != 0);
    return 0;
}
