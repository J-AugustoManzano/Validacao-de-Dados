// ValidarMatricula
#include <iostream>
#include <string>
#include <algorithm>

using namespace std;

bool validarMatricula(const string& MATRICULA) {
    if (MATRICULA.length() != 9)
        return false;
    if (!(MATRICULA[0] >= '0' && MATRICULA[0] <= '9') || !(MATRICULA[1] >= '0' && MATRICULA[1] <= '9') || !(MATRICULA[2] >= '0' && MATRICULA[2] <= '9'))
        return false;
    if (MATRICULA[3] != '.')
        return false;
    if (!(MATRICULA[4] >= '0' && MATRICULA[4] <= '9') || !(MATRICULA[5] >= '0' && MATRICULA[5] <= '9') || !(MATRICULA[6] >= '0' && MATRICULA[6] <= '9'))
        return false;
    if (MATRICULA[7] != '-')
        return false;
    if (!(MATRICULA[8] >= '0' && MATRICULA[8] <= '9'))
        return false;
    return true;
}

void removerCaractere(string& CADEIA, char CARACTERE) {
    CADEIA.erase(remove(CADEIA.begin(), CADEIA.end(), CARACTERE), CADEIA.end());
}

int mod10Check(const string& MATRICULA) {
    int MATRIC_INT[6];
    int SOMA = 0;
    int DV;
    for (int i = 0; i < 6; ++i)
        MATRIC_INT[i] = atoi(MATRICULA.substr(i, 1).c_str());

    for (int i = 0; i < 6; ++i) {
        if ((i + 1) % 2 == 0) {
            if (MATRIC_INT[i] * 2 > 9)
                SOMA += MATRIC_INT[i] * 2 - 9;
            else
                SOMA += MATRIC_INT[i] * 2;
        } else {
            SOMA += MATRIC_INT[i];
        }
    }
    DV = (10 - (SOMA % 10)) % 10;
    return DV;
}

int main() {
    string MATRIC_CPT, MATRIC_SPT;
    int MATRIC_INT[7];
    int DVC, DVE;

    do {
        cout << "Informe a matricula no formato 999.999-9: ";
        getline(cin, MATRIC_CPT);
        if (!validarMatricula(MATRIC_CPT)) {
            cout << endl;
            cout << "Entrada invalida, tente novamente." << endl;
            cout << endl << endl;
        }
    } while (!validarMatricula(MATRIC_CPT));

    MATRIC_SPT = MATRIC_CPT;
    removerCaractere(MATRIC_SPT, '.');
    removerCaractere(MATRIC_SPT, '-');
    DVC = mod10Check(MATRIC_SPT);

    for (int i = 0; i < 7; ++i)
        MATRIC_INT[i] = atoi(MATRIC_SPT.substr(i, 1).c_str());
    DVE = MATRIC_INT[6];

    cout << endl;
    if (DVC == DVE)
        cout << "Matricula valida." << endl;
    else
        cout << "Matricula invalida." << endl;
    cout << endl;

    cout << "Pressione <Enter> para encerrar... ";
    cin.ignore();
    return 0;
}
