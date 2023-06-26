#include <iostream>
#include <string>
#include <algorithm>
using namespace std;

char AlphaCD(string valor) {
    int soma = 0;
    int proximo = 0;
    char caractere;
    int digitos[valor.length()];
    
    for (int i = 0; i < valor.length(); i++) {
        caractere = toupper(valor[i]);
        if (caractere == ' ' || caractere == '.' || caractere == '-') {
            continue;
        }
        if (caractere >= '0' && caractere <= '9') {
            digitos[valor.length() - i - 1] = caractere - '0';
        } else if (caractere >= 'A' && caractere <= 'Z') {
            digitos[valor.length() - i - 1] = (caractere - 'A' + 1) % 9;
        }
        if ((i + 1) % 2 == 0) {
            digitos[valor.length() - i - 1] *= 2;
            if (digitos[valor.length() - i - 1] >= 10) {
                digitos[valor.length() - i - 1] = digitos[valor.length() - i - 1] / 10 + digitos[valor.length() - i - 1] % 10;
            }
        }
        soma += digitos[valor.length() - i - 1];
    }
    if (soma % 10 == 0) {
        proximo = soma;
    } else {
        proximo = (soma / 10 + 1) * 10;
    }
    return (proximo - soma) + '0';
}

string TrimString(string str) {
    int i = 0;
    while (i < str.length() && str[i] == ' ') {
        i++;
    }
    if (i < str.length()) {
        while (str[str.length() - 1] == ' ') {
            str = str.substr(0, str.length() - 1);
        }
        return str.substr(i, str.length());
    } else {
        return "";
    }
}

int main(void) {
    string entrada, matricula, digitoVerificador;

    cout << "ALPHABETIC CHECK DIGIT" << endl;
    cout << "======================" << endl;
    cout << endl;

    cout << "Entre com a matricula alfanumerica (tamanho livre): ";
    getline(cin, entrada);
    cout << "Digito verificador para " << entrada << " = " << AlphaCD(entrada) << endl;
    cout << endl;

    cout << "Entre com a matricula e o digito verificador (juntos): ";
    getline(cin, matricula);
    digitoVerificador = matricula.substr(matricula.length() - 1);
    matricula = TrimString(matricula.substr(0, matricula.length() - 1));

    if (AlphaCD(matricula) == digitoVerificador[0]) {
        cout << "Numero valido." << endl;
    } else {
        cout << "Numero invalido." << endl;
    }

    return 0;
}
