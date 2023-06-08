#include <iostream>
#include <cmath>
#include <string>

const unsigned int LimiteMaximoDecimal = 2147483647;
const std::string LimiteMaximoHexadecimal = "7FFFFFFF";

std::string DecimalParaHexadecimal(unsigned int decimal) {
    unsigned int resto;
    std::string hexadecimal = "";
    while (decimal > 0) {
        resto = decimal % 16;
        if (resto >= 0 && resto <= 9)
            hexadecimal = char(resto + '0') + hexadecimal;
        else
            hexadecimal = char(resto - 10 + 'A') + hexadecimal;
        decimal = decimal / 16;
    }
    return hexadecimal;
}

unsigned int HexadecimalParaDecimal(const std::string& hexadecimal) {
    unsigned int potencia = 0;
    char digito;
    unsigned int decimal = 0;
    for (int i = hexadecimal.length() - 1; i >= 0; i--) {
        digito = toupper(hexadecimal[i]);
        if (digito >= '0' && digito <= '9')
            decimal += (digito - '0') * pow(16, potencia);
        else if (digito >= 'A' && digito <= 'F')
            decimal += (digito - 'A' + 10) * pow(16, potencia);
        potencia++;
    }
    return decimal;
}

bool IsValidHexadecimal(const std::string& hexadecimal) {
    for (char digito : hexadecimal) {
        if (!isxdigit(digito))
            return false;
    }
    return true;
}

int main(void) {
    int opcao;
    unsigned int decimal;
    std::string hexadecimal;
    do {
        std::cout << "===============================\n";
        std::cout << " CONVERSOR DECIMAL-HEXADECIMAL \n";
        std::cout << "===============================\n\n";
        std::cout << "1 - Converter decimal para hexadecimal\n";
        std::cout << "2 - Converter hexadecimal para decimal\n";
        std::cout << "0 - Sair\n\n";
        std::cout << "Digite a opcao desejada: ";
        std::cin >> opcao;
        switch (opcao) {
            case 1: {
                std::cout << "\nDigite um numero decimal (ate " << LimiteMaximoDecimal << "): ";
                std::cin >> decimal;
                if (decimal > LimiteMaximoDecimal) {
                    std::cout << "Valor decimal fora do limite permitido.\n";
                } else {
                    std::cout << "Valor em hexadecimal: " << DecimalParaHexadecimal(decimal) << std::endl;
                }
                break;
            }
            case 2: {
                std::cout << "\nDigite um numero hexadecimal (ate " << LimiteMaximoHexadecimal << "): ";
                std::cin >> hexadecimal;
                if (!IsValidHexadecimal(hexadecimal)) {
                    std::cout << "Valor hexadecimal invalido.\n";
                } else if (HexadecimalParaDecimal(hexadecimal) > LimiteMaximoDecimal) {
                    std::cout << "Valor hexadecimal fora do limite permitido.\n";
                } else {
                    std::cout << "Valor em decimal: " << HexadecimalParaDecimal(hexadecimal) << std::endl;
                }
                break;
            }
        }
        std::cout << std::endl;
    } while (opcao != 0);
    return 0;
}
