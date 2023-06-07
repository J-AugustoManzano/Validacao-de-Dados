#include <iostream>
#include <limits>
using namespace std;

int NUMERO;

int main(void) {
  do {
    cout << "Entre um numero: ";
    if (!(cin >> NUMERO)) {
      cout << "Entrada invalida. Por favor, tente novamente." << endl;
      cin.clear();
      cin.ignore(numeric_limits<streamsize>::max(), '\n');
    }
    else {
      cin.ignore(numeric_limits<streamsize>::max(), '\n');
      break;
    }
  } while (true);
  cout << "Voce informou o numero: " << NUMERO << endl;
  return 0;
}
