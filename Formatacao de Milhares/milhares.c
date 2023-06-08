#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void FormataValor(const char *valor, char *valorFormatado) {
    char inteiro[100];
    char decimal[3];
    int i;
    // Verifica se o valor possui parte decimal
    const char *decimalSeparator = strchr(valor, '.');
    if (decimalSeparator != NULL) {
        strncpy(inteiro, valor, decimalSeparator - valor);
        inteiro[decimalSeparator - valor] = '\0';
        strcpy(decimal, decimalSeparator + 1);
    } else {
        strcpy(inteiro, valor);
        strcpy(decimal, "00");
    }
    // Formata a parte inteira
    int len = strlen(inteiro);
    int j = 0;
    for (i = len - 1; i >= 0; i--) {
        valorFormatado[j] = inteiro[i];
        j++;
        if ((i > 0) && ((len - i) % 3 == 0)) {
            valorFormatado[j] = '.';
            j++;
        }
    }
    valorFormatado[j] = '\0';
    // Inverte a cadeia do valor formatado
    len = strlen(valorFormatado);
    for (i = 0; i < len / 2; i++) {
        char temp = valorFormatado[i];
        valorFormatado[i] = valorFormatado[len - i - 1];
        valorFormatado[len - i - 1] = temp;
    }
    // Concatena a parte decimal
    strcat(valorFormatado, ",");
    strcat(valorFormatado, decimal);
}

int main(void) {
    char valor[100];
    char valorFormatado[100];
    printf("Digite um valor real: ");
    fgets(valor, sizeof(valor), stdin);
    valor[strcspn(valor, "\n")] = '\0';
    FormataValor(valor, valorFormatado);
    printf("Valor formatado: %s\n", valorFormatado);
    return 0;
}
