#include <iostream>
#include <fstream>
#include <iomanip>
using namespace std;

const int dammTab[10][10] = {
  {0, 3, 1, 7, 5, 9, 8, 6, 4, 2},
  {7, 0, 9, 2, 1, 5, 4, 8, 6, 3},
  {4, 2, 0, 6, 8, 7, 1, 3, 5, 9},
  {1, 7, 5, 0, 9, 8, 3, 4, 2, 6},
  {6, 1, 2, 3, 0, 4, 5, 9, 7, 8},
  {3, 6, 7, 4, 2, 0, 9, 5, 8, 1},
  {5, 8, 6, 9, 7, 2, 0, 1, 3, 4},
  {8, 9, 4, 5, 3, 6, 2, 0, 1, 7},
  {9, 4, 3, 8, 6, 1, 7, 2, 0, 5},
  {2, 5, 8, 1, 4, 3, 6, 7, 9, 0}
};

int gerarDamm(const std::string& NUMERO) {
  int DV = 0;
  for (size_t I = 0; I < NUMERO.length(); I++) {
    DV = dammTab[DV][NUMERO[I] - '0'];
  }
  return DV;
}

string formataMatricula(int MATRICULA) {
  stringstream SS;
  SS << setfill('0') << setw(6) << MATRICULA;
  return SS.str();
}

int main(void) {
	
  string MATRICULA;
  int I, DV;	
  ofstream ARQUIVO("numeros.txt");

  cout << "GERADOR DE NUMEROS DE MATRICULA DE 000.000 ATE 999.999 COM \"DV\"" << endl;
  cout << "Padrao: Damm" << endl;
  cout << "---------------------------------------------------------------" << endl;
  cout << endl;
  
  if (not ARQUIVO) {
    cerr << "Erro ao abrir o ARQUIVO." << endl;
    cout << "Programa encerrado." << endl;
    return 1;
  }
  
  cout << "Aguarde ARQUIVO sendo gerado... ";
  
  for (I = 0; I <= 999999; I++) {
    MATRICULA = formataMatricula(I);
    DV = gerarDamm(MATRICULA);
    ARQUIVO << MATRICULA.substr(0, 3) << "." << MATRICULA.substr(3) << "-" << DV << endl;
  }
  
  ARQUIVO.close();
  
  cout << endl << endl;
  cout << "SUCESSO: Arquivo gerado." << endl;
  
  cout << endl;
  return 0;
}
