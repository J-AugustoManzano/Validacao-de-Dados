#include <iostream>
#include <fstream>
#include <iomanip>
using namespace std;

int verhoeffD[10][10] = {
    {0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
    {1, 2, 3, 4, 0, 6, 7, 8, 9, 5},
    {2, 3, 4, 0, 1, 7, 8, 9, 5, 6},
    {3, 4, 0, 1, 2, 8, 9, 5, 6, 7},
    {4, 0, 1, 2, 3, 9, 5, 6, 7, 8},
    {5, 9, 8, 7, 6, 0, 4, 3, 2, 1},
    {6, 5, 9, 8, 7, 1, 0, 4, 3, 2},
    {7, 6, 5, 9, 8, 2, 1, 0, 4, 3},
    {8, 7, 6, 5, 9, 3, 2, 1, 0, 4},
    {9, 8, 7, 6, 5, 4, 3, 2, 1, 0}
};

int verhoeffP[8][10] = {
    {0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
    {1, 5, 7, 6, 2, 8, 3, 0, 9, 4},
    {5, 8, 0, 3, 7, 9, 6, 1, 4, 2},
    {8, 9, 1, 6, 0, 4, 3, 5, 2, 7},
    {9, 4, 5, 3, 1, 2, 6, 8, 7, 0},
    {4, 2, 8, 6, 5, 7, 3, 9, 0, 1},
    {2, 7, 9, 3, 8, 0, 6, 4, 1, 5},
    {7, 0, 4, 6, 9, 1, 3, 2, 5, 8}
};

int verhoeffInv[] = {0, 4, 3, 2, 1, 5, 6, 7, 8, 9};

int gerarVerhoeff(const std::string& NUMERO) {
  int DIGITO = 0, POS, NUM;
  int TAMANHO = NUMERO.length();
  for (int I = 0; I < TAMANHO; I++) {
    POS = (I + 1) % 8;
    NUM = NUMERO[TAMANHO - I - 1] - 48;
    DIGITO = verhoeffD[DIGITO][verhoeffP[POS][NUM]];
  }
  return verhoeffInv[DIGITO];
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
  cout << "Padrao: Verhoeff" << endl;
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
    DV = gerarVerhoeff(MATRICULA);
    ARQUIVO << MATRICULA.substr(0, 3) << "." << MATRICULA.substr(3) << "-" << DV << endl;
  }
  
  ARQUIVO.close();
  
  cout << endl << endl;
  cout << "SUCESSO: Arquivo gerado." << endl;
  
  cout << endl;
  return 0;
}
