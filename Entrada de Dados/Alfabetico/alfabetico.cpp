#include <iostream>
#include <string>

using namespace std;

int main() {
  
  string TEXTO;
  bool VALIDACAO = false;

  do {
    cout << "Entre uma cadeia alfabetica: ";
    getline(cin, TEXTO);
    VALIDACAO = TEXTO.find_first_not_of("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ") == string::npos;
    if (VALIDACAO == false) {
      cout << "Entrada invalida. Por favor, tente novamente." << endl;
    } else {
      break;
    }
  } while (true);
  cout << "Voce informou a cadeia: " << TEXTO << endl;
  return 0;
}
