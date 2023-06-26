#include <stdio.h>
#include <ctype.h>
#include <string.h>

char alphaCD(char *valor) {
    int i, soma = 0, proximo;
    char caractere;
    int digitos[strlen(valor)];
    
    for (i = 0; i < (int)strlen(valor); i++) {
        caractere = toupper(valor[i]);
        
        if (caractere == ' ' || caractere == '.' || caractere == '-')
            continue;
            
        if (caractere >= '0' && caractere <= '9')
            digitos[strlen(valor) - i - 1] = caractere - '0';
        else if (caractere >= 'A' && caractere <= 'Z')
            digitos[strlen(valor) - i - 1] = (caractere - 'A' + 1) % 9;
            
        if ((i + 1) % 2 == 0) {
            digitos[strlen(valor) - i - 1] *= 2;
            
            if (digitos[strlen(valor) - i - 1] >= 10)
                digitos[strlen(valor) - i - 1] = digitos[strlen(valor) - i - 1] / 10 + digitos[strlen(valor) - i - 1] % 10;
        }
        
        soma += digitos[strlen(valor) - i - 1];
    }
    
    if (soma % 10 == 0)
        proximo = soma;
    else
        proximo = (soma / 10 + 1) * 10;
        
    return proximo - soma + '0';
}

char* trimString(char *str) {
    int i = 0;
    
    while (str[i] == ' ')
        i++;
        
    if (i < (int)strlen(str)) {
        while (str[strlen(str) - 1] == ' ')
            str[strlen(str) - 1] = '\0';
        
        return &str[i];
    } else {
        static char empty[] = "";
        return empty;
    }
}

int main(void) {
    char entrada[100], matricula[100], digitoVerificador;
    
    printf("ALPHABETIC CHECK DIGIT\n");
    printf("======================\n\n");
    
    printf("Entre matricula alfanumerica (tamanho livre): ");
    fgets(entrada, sizeof(entrada), stdin);
    entrada[strcspn(entrada, "\n")] = '\0';
    
    printf("Dígito verificador para %s = %c\n\n", entrada, alphaCD(entrada));
    
    printf("Entre matricula e dígito verificador (juntos): ");
    fgets(matricula, sizeof(matricula), stdin);
    matricula[strcspn(matricula, "\n")] = '\0';
    digitoVerificador = matricula[strlen(matricula) - 1];
    matricula[strlen(matricula) - 1] = '\0';
    
    if (alphaCD(matricula) == digitoVerificador)
        printf("Numero valido.\n");
    else
        printf("Numero invalido.\n");
        
    return 0;
}
