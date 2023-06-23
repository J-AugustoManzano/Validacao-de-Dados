/*
   PRNG .......: RANDU
   Ano ........: Decada de 1960
   Autor ......: IBM
*/

import 'dart:io';

class PRNG {
  static int RANDU(int seed) {
    return (65539 * seed) % 2147483648;
  }
}

void main() {

  int Xn1 = 1234;
  int Xn2 = DateTime.now().millisecondsSinceEpoch ~/ 1000;

  print("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
  print("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
  print("PADRAO: RANDU");
  print("==========================================");
  print("");
  print("    Semente: 1234        Semente: TIME");
  print("    -------------        -------------");

  for (int i = 1; i <= 10; i++) {
    Xn1 = PRNG.RANDU(Xn1);
    Xn2 = PRNG.RANDU(Xn2);
    print("${Xn1.toString().padLeft(17)}        ${Xn2.toString().padLeft(13)}");
  }

}
