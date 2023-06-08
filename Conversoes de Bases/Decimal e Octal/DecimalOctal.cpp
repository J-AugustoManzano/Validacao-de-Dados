#include <iostream>
#include <cmath>

using namespace std;

const unsigned int LimiteMaximoDecimal = 2147483647;
const unsigned int LimiteMaximoOctal = 17777777777;

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
        decimal += digito * static_cast<unsigned int>(pow(8, potencia));
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
        cout << "=========================" << endl;
        cout << " CONVERSOR DECIMAL-OCTAL " << endl;
        cout << "=========================" << endl << endl;
        cout << "1 - Converter decimal para octal" << endl;
        cout << "2 - Converter octal para decimal" << endl;
        cout << "0 - Sair" << endl << endl;
        cout << "Digite a opcao desejada: ";
        cin >> opcao;
        switch (opcao)
        {
        case 1:
            cout << endl;
            cout << "Digite um numero decimal (ate " << LimiteMaximoDecimal << "): ";
            cin >> decimal;
            if (decimal > LimiteMaximoDecimal)
                cout << "Valor decimal fora do limite permitido." << endl;
            else
                cout << "Valor em octal: " << DecimalParaOctal(decimal) << endl;
            break;
        case 2:
            cout << endl;
            cout << "Digite um numero octal (ate " << LimiteMaximoOctal << "): ";
            cin >> octal;
            if (!IsValidOctal(octal))
                cout << "Valor octal invalido." << endl;
            else if (octal > LimiteMaximoOctal)
                cout << "Valor octal fora do limite permitido." << endl;
            else
                cout << "Valor em decimal: " << OctalParaDecimal(octal) << endl;
            break;
        }
        cout << endl;
    } while (opcao != 0);
    return 0;
}
