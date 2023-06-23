/* 
   PRNG .......: RANDU
   Ano ........: Decada de 1960
   Autor ......: IBM
*/

#include <iostream>
#include <iomanip>
#include <ctime>

long long int RANDU(long long int& seed) {
    /* Gera o próximo número pseudoaleatório */
    seed = (65539 * seed) % 2147483648;
    return seed;
}

int main(void) {

    long long int Xn1, Xn2;
    int i;
    
    Xn1 = 1234;
    Xn2 = static_cast<long long int>(std::time(nullptr));
    
    std::cout << "GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)" << std::endl;
    std::cout << "PSEUDORANDOM NUMBER GENERATOR (PRNG)" << std::endl;
    std::cout << "PADRAO: RANDU" << std::endl;
    std::cout << "==========================================" << std::endl << std::endl;
    std::cout << "    Semente: 1234        Semente: TIME" << std::endl;
    std::cout << "    -------------        -------------" << std::endl;
    
    for (i = 1; i <= 10; i++) {
        std::cout << std::setw(17) << RANDU(Xn1) << "        " << std::setw(13) << RANDU(Xn2) << std::endl;
    }
    
    return 0;
}
