#include <iostream>
#include <algorithm>
#include <cctype>

std::string toUpperCase(const std::string &str) {
    std::string result = str;
    std::transform(result.begin(), result.end(), result.begin(), ::toupper);
    return result;
}

std::string toLowerCase(const std::string &str) {
    std::string result = str;
    std::transform(result.begin(), result.end(), result.begin(), ::tolower);
    return result;
}

int main() {
    std::cout << "Digite um texto .....: ";
    std::string texto;
    std::getline(std::cin, texto);

    std::string textoMaiusculo = toUpperCase(texto);
    std::string textoMinusculo = toLowerCase(texto);

    std::cout << "Texto em maiusculo ..: " << textoMaiusculo << std::endl;
    std::cout << "Texto em minusculo ..: " << textoMinusculo << std::endl;

    return 0;
}
