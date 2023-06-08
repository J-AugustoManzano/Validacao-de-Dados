#include <iostream>
#include <string>
using namespace std;

const unsigned int LimiteMaximoDecimal = 2147483647;
const string LimiteMaximoBinario = "1111111111111111111111111111111";

string DecimalParaBinario(unsigned int decimal) {
    string binario = "";
    while (decimal > 0) {
        unsigned int resto = decimal % 2;
        binario = to_string(resto) + binario;
        decimal /= 2;
    }
    while (binario.length() < 32) {
        binario = "0" + binario;
    }
    return binario;
}

unsigned int BinarioParaDecimal(const string& binario) {
    unsigned int valor = 0;
    for (int i = binario.length() - 1; i >= 0; i--) {
        if (binario[i] == '1') {
            int potencia = binario.length() - 1 - i;
            valor += (1 << potencia);
        }
    }
    return valor;
}

bool IsValidBinario(const string& binario) {
    for (char c : binario) {
        if (c != '0' && c != '1') {
            return false;
        }
    }
    return true;
}

int main(void) {
    int opcao = 0;
    unsigned int decimal = 0;
    string binario;
    do {
        cout << "===========================" << endl;
        cout << " CONVERSOR DECIMAL-BINARIO " << endl;
        cout << "===========================" << endl << endl;
        cout << "1 - Converter decimal para binario" << endl;
        cout << "2 - Converter binario para decimal" << endl;
        cout << "0 - Sair" << endl << endl;
        cout << "Digite a opcao desejada: ";
        cin >> opcao;
        switch (opcao) {
            case 1:
                cout << endl;
                cout << "Digite um numero decimal (ate " << LimiteMaximoDecimal << "): ";
                cin >> decimal;
                if (decimal > LimiteMaximoDecimal) {
                    cout << "Valor decimal fora do limite permitido." << endl;
                } else {
                    string bin = DecimalParaBinario(decimal);
                    cout << "Valor em binario: " << bin << endl;
                }
                break;
            case 2:
                cout << endl;
                cout << "Digite um numero binario (ate " << LimiteMaximoBinario << "): ";
                cin >> binario;
                if (!IsValidBinario(binario)) {
                    cout << "Valor binario invalido." << endl;
                } else if (binario.length() > LimiteMaximoBinario.length()) {
                    cout << "Valor binario fora do limite permitido." << endl;
                } else {
                    unsigned int dec = BinarioParaDecimal(binario);
                    cout << "Valor em decimal: " << dec << endl;
                }
                break;
            case 0:
                break;
            default:
                cout << "Opcao invalida. Tente novamente." << endl;
                break;
        }
        cout << endl;
    } while (opcao != 0);
    return 0;
}
