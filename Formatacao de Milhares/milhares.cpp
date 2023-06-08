#include <iostream>
#include <string>

void FormataValor(const std::string& valor, std::string& valorFormatado) {
    std::string inteiro, decimal;
    // Verifica se o valor possui parte decimal
    size_t pos = valor.find('.');
    if (pos != std::string::npos) {
        inteiro = valor.substr(0, pos);
        decimal = valor.substr(pos + 1);
    } else {
        inteiro = valor;
        decimal = "00";
    }
    // Formata a parte inteira
    valorFormatado.clear();
    int len = inteiro.length();
    for (int i = len - 1; i >= 0; i--) {
        valorFormatado = inteiro[i] + valorFormatado;
        if ((i > 0) && ((len - i) % 3 == 0)) {
            valorFormatado = '.' + valorFormatado;
        }
    }
    // Concatena a parte decimal
    valorFormatado += ',' + decimal;
}

int main(void) {
    std::string valor;
    std::string valorFormatado;
    std::cout << "Digite um valor real: ";
    std::cin >> valor;
    FormataValor(valor, valorFormatado);
    std::cout << "Valor formatado: " << valorFormatado << std::endl;
    return 0;
}
