#include <stdio.h>
#include <math.h>
#include <stdbool.h>

#define LimiteMaximoDecimal 2147483647
#define LimiteMaximoOctal 17777777777

unsigned int DecimalParaOctal(unsigned int decimal)
{
    unsigned int octal = 0;
    unsigned int resto, potencia = 1;
    while (decimal > 0)
    {
        resto = decimal % 8;
        octal += resto * potencia;
        decimal /= 8;
        potencia *= 10;
    }
    return octal;
}

unsigned int OctalParaDecimal(unsigned int octal)
{
    unsigned int decimal = 0;
    unsigned int potencia = 0;
    unsigned int digito;
    while (octal > 0)
    {
        digito = octal % 10;
        decimal += digito * (unsigned int)pow(8, potencia);
        octal /= 10;
        potencia++;
    }
    return decimal;
}

bool IsValidOctal(unsigned int octal)
{
    while (octal > 0)
    {
        if (octal % 10 > 7)
            return false;
        octal /= 10;
    }
    return true;
}

int main(void)
{
    int opcao;
    unsigned int decimal, octal;
    do
    {
        printf("=========================\n");
        printf(" CONVERSOR DECIMAL-OCTAL \n");
        printf("=========================\n\n");
        printf("1 - Converter decimal para octal\n");
        printf("2 - Converter octal para decimal\n");
        printf("0 - Sair\n\n");
        printf("Digite a opcao desejada: ");
        scanf("%d", &opcao);
        switch (opcao)
        {
        case 1:
            printf("\nDigite um numero decimal (ate %u): ", LimiteMaximoDecimal);
            scanf("%u", &decimal);
            if (decimal > LimiteMaximoDecimal)
                printf("Valor decimal fora do limite permitido.\n");
            else
                printf("Valor em octal: %u\n", DecimalParaOctal(decimal));
            break;
        case 2:
            printf("\nDigite um numero octal (ate %u): ", LimiteMaximoOctal);
            scanf("%u", &octal);
            if (!IsValidOctal(octal))
                printf("Valor octal invalido.\n");
            else if (octal > LimiteMaximoOctal)
                printf("Valor octal fora do limite permitido.\n");
            else
                printf("Valor em decimal: %u\n", OctalParaDecimal(octal));
            break;
        }
        printf("\n");
    } while (opcao != 0);
    return 0;
}
