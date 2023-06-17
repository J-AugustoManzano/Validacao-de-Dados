#include <iostream>
#include <fstream>
#include <iomanip>
using namespace std;

string formataMatricula(int MATRICULA) {
  stringstream SS;
  SS << setfill('0') << setw(6) << MATRICULA;
  return SS.str();
}

int mod10(const string& MATRICULA) {
  int SOMA = 0;
  for (int I = 0; I < 6; I++) {
    int DIGITO = MATRICULA[I] - '0';
    if (I % 2 != 0 && DIGITO * 2 > 9)
      SOMA += DIGITO * 2 - 9;
    else if (I % 2 != 0 && DIGITO * 2 <= 9)
      SOMA += DIGITO * 2;
    else
      SOMA += DIGITO;
  }
  int DV = (SOMA % 10 == 0) ? 0 : 10 - SOMA % 10;
  return DV;
}

int main(void) {
	
  string MATRICULA;
  int I, DV;	
  ofstream ARQUIVO("numeros.txt");

  cout << "GERADOR DE NUMEROS DE MATRICULA DE 000.000 ATE 999.999 COM \"DV\"" << endl;
  cout << "Padrao: Modulo 10" << endl;
  cout << "---------------------------------------------------------------" << endl;
  cout << endl;
  
  if (not ARQUIVO) {
    cerr << "Erro ao abrir o arquivo." << endl;
    cout << "Programa encerrado." << endl;
    return 1;
  }
  
  cout << "Aguarde arquivo sendo gerado... ";
  
  for (I = 0; I <= 999999; I++) {
    MATRICULA = formataMatricula(I);
    DV = mod10(MATRICULA);
    ARQUIVO << MATRICULA.substr(0, 3) << "." << MATRICULA.substr(3) << "-" << DV << endl;
  }
  
  ARQUIVO.close();
  
  cout << endl << endl;
  cout << "SUCESSO: Arquivo gerado." << endl;
  
  cout << endl;
  return 0;
}
