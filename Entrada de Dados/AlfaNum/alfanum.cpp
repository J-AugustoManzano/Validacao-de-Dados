#include <iostream>
#include <cstring>
#include <cctype>

using namespace std;

bool VALIDA_HEXA(const string& VALOR) {
  for (char CARACTERE : VALOR) {
    char CARACTERE_MAISCULO = toupper(CARACTERE);
    if (!(isdigit(CARACTERE_MAISCULO) || (CARACTERE_MAISCULO >= 'A' && CARACTERE_MAISCULO <= 'F')))
      return false;
  }
  return true;
}

string VALOR_HEX;
  
int main() {
  cout << endl;
  do {
    cout << "Entre valor hexadecimal de 4 caracteres: ";
    getline(cin, VALOR_HEX);
    if (VALOR_HEX.length() != 4) {
      cout << "Valor invalido, deve ter exatamente 4 caracteres." << endl << endl;
      continue;
    }
    if (!VALIDA_HEXA(VALOR_HEX)) {
      cout << "Valor invAlido, apenas caracteres [0-9] e [A-F]." << endl << endl;
      continue;
    }
    break;
  } while (true);
  for (char& c : VALOR_HEX) {
    c = toupper(c);
  }
  cout << "Valor fornecido: " << VALOR_HEX << endl << endl;
  return 0;
}
