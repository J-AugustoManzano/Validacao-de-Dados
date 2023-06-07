#include <stdio.h>
#include <ctype.h>
#include <string.h>

void toUpperCase(char *str) {
    while (*str) {
        *str = toupper((unsigned char)*str);
        str++;
    }
}

void toLowerCase(char *str) {
    while (*str) {
        *str = tolower((unsigned char)*str);
        str++;
    }
}

int main() {
    char texto[256];

    printf("Digite um texto .....: ");
    fgets(texto, sizeof(texto), stdin);
    texto[strcspn(texto, "\n")] = '\0'; // Remove o caractere de nova linha

    char textoMaiusculo[256];
    char textoMinusculo[256];

    strcpy(textoMaiusculo, texto);
    toUpperCase(textoMaiusculo);

    strcpy(textoMinusculo, texto);
    toLowerCase(textoMinusculo);

    printf("Texto em maiusculo ..: %s\n", textoMaiusculo);
    printf("Texto em minusculo ..: %s\n", textoMinusculo);

    return 0;
}
