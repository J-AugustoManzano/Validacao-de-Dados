#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <stdbool.h>

bool VALIDA_HEXA(const char VALOR[]) {
    size_t I;

    for (I = 0; I < strlen(VALOR); I++) {
        char CARACTERE = toupper(VALOR[I]);
        if (!(isdigit(CARACTERE) || (CARACTERE >= 'A' && CARACTERE <= 'F')))
            return false;
    }
    return true;
}

char VALOR_HEX[5];

int main() {
    printf("\n");
    do {
        printf("Entre valor hexadecimal de 4 caracteres: ");
        scanf("%4s", VALOR_HEX);
        while (getchar() != '\n'); // Limpa o buffer de entrada

        if (strlen(VALOR_HEX) != 4) {
            printf("Valor invalido, deve ter exatamente 4 caracteres.\n\n");
            continue;
        }

        if (!VALIDA_HEXA(VALOR_HEX)) {
            printf("Valor invalido, apenas caracteres [0-9] e [A-F].\n\n");
            continue;
        }

        break;
    } while (true);

    for (size_t I = 0; I < strlen(VALOR_HEX); I++) {
        VALOR_HEX[I] = toupper(VALOR_HEX[I]);
    }

    printf("VALOR fornecido: %s\n\n", VALOR_HEX);

    return 0;
}
