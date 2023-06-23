/*
 PRNG .......: Add With Carry (AWC)
 Ano ........: 1991
 Autor ......: George Marsaglia
*/

#include <iostream>
#include <iomanip>
#include <ctime>

using namespace std;

unsigned long AWCNextRandom(unsigned long& Xn) {
    Xn = (Xn + 12345) % 4294967296;
    return Xn;
}

void AWCInitialize(unsigned long seed, unsigned long& Xn) {
    Xn = seed;
}

int main(void) {

    cout << "GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)" << endl;
    cout << "PSEUDORANDOM NUMBER GENERATOR (PRNG)" << endl;
    cout << "PADRAO: Add With Carry" << endl;
    cout << "==========================================" << endl;
    cout << endl;
    cout << "    Semente: 1234        Semente: TIME" << endl;
    cout << "    -------------        -------------" << endl;

    unsigned long Xn1, Xn2;
    int i;
    unsigned long seed1, seed2;

    seed1 = 1234;
    seed2 = static_cast<unsigned long>(time(nullptr));
 
    AWCInitialize(seed1, Xn1);
    AWCInitialize(seed2, Xn2);

    for (i = 1; i <= 10; i++) {
        cout << right << setw(17) << AWCNextRandom(Xn1) << "        " << right << setw(13) << AWCNextRandom(Xn2) << endl;
    }

    return 0;
}
