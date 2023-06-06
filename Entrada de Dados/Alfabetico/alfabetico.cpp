#include <iostream>
#include <string>

using namespace std;

string TEXTO;
size_t I;
bool VALIDACAO;

int main() {
  do {
    cout << "Entre uma cadeia alfabetica: ";
    getline(cin, TEXTO);
    VALIDACAO = true;
    for (I = 0; I < TEXTO.length(); I++) {
      char CARACTERE = TEXTO[I];
      if (!((CARACTERE >= 'A' && CARACTERE <= 'Z') ||
            (CARACTERE >= 'a' && CARACTERE <= 'z') ||
             CARACTERE == ' ')) {
        VALIDACAO = false;
        break;
      }
    }
    if (VALIDACAO == false) {
      cout << "Entrada invalida. Por favor, tente novamente." << endl;
    } else {
      break;
    }
  } while (true);
  cout << "Voce informou a cadeia: " << TEXTO << endl;
  return 0;
}
