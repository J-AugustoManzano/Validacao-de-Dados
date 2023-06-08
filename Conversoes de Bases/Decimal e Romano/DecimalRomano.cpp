#include <iostream>
#include <string>
#include <algorithm>

const std::string AlgarismosRomanos[13] = {"I", "IV", "V", "IX", "X", "XL", "L", "XC", "C", "CD", "D", "CM", "M"};
const int ValoresDecimais[13] = {1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000};
const int LimiteMaximoDecimal = 3999;
const std::string LimiteMaximoRomano = "MMMCMXCIX";

std::string DecimalParaRomano(int decimal) {
    std::string romano = "";
    int i = 12;
    while (decimal > 0) {
        if (decimal >= ValoresDecimais[i]) {
            romano += AlgarismosRomanos[i];
            decimal -= ValoresDecimais[i];
        } else {
            i--;
        }
    }
    return romano;
}

int RomanoParaDecimal(const std::string& romano) {
    int resultado = 0;
    int valorAnterior = 0;
    std::string romanoMaiusculo = romano;
    std::transform(romanoMaiusculo.begin(), romanoMaiusculo.end(), romanoMaiusculo.begin(), ::toupper);
    for (int i = romanoMaiusculo.length() - 1; i >= 0; i--) {
        int valorAtual = 0;
        bool valorEncontrado = false;
        for (int j = 0; j < 13; j++) {
            if (romanoMaiusculo[i] == AlgarismosRomanos[j][0]) {
                valorAtual = ValoresDecimais[j];
                valorEncontrado = true;
                break;
            }
        }
        if (!valorEncontrado) {
            resultado = 0;
            break;
        }
        if (valorAtual < valorAnterior) {
            resultado -= valorAtual;
        } else {
            resultado += valorAtual;
            valorAnterior = valorAtual;
        }
    }
    return resultado;
}

int main(void) {
    int opcao;
    int decimal;
    std::string romano;
    do {
        std::cout << "==========================" << std::endl;
        std::cout << " CONVERSOR DECIMAL-ROMANO " << std::endl;
        std::cout << "==========================" << std::endl;
        std::cout << std::endl;
        std::cout << "1 - Converter decimal para romano" << std::endl;
        std::cout << "2 - Converter romano para decimal" << std::endl;
        std::cout << "0 - Sair" << std::endl;
        std::cout << std::endl;
        std::cout << "Digite a opcao desejada: ";
        std::cin >> opcao;
        switch (opcao) {
            case 1:
                std::cout << std::endl;
                std::cout << "Digite um numero decimal (ate " << LimiteMaximoDecimal << "): ";
                std::cin >> decimal;
                if (decimal < 1 || decimal > LimiteMaximoDecimal) {
                    std::cout << "Valor decimal fora do limite permitido." << std::endl;
                } else {
                    std::cout << "Valor em algarismo romano: " << DecimalParaRomano(decimal) << std::endl;
                }
                break;
            case 2:
                std::cout << std::endl;
                std::cout << "Digite um numero romano (ate " << LimiteMaximoRomano << "): ";
                std::cin >> romano;
                if (romano.empty() || RomanoParaDecimal(romano) == 0) {
                    std::cout << "Valor romano fora do limite permitido." << std::endl;
                } else {
                    std::cout << "Valor em decimal: " << RomanoParaDecimal(romano) << std::endl;
                }
                break;
        }
        std::cout << std::endl;
    } while (opcao != 0);
    return 0;
}
