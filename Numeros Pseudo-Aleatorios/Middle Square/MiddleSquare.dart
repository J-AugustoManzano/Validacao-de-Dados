/*
 PRNG .......: Middle Square
 Ano ........: 1946
 Autor ......: John von Neumann
*/

import 'dart:io';
import 'dart:math';

int meanSquare(int seed) {
  seed = (seed * seed ~/ 100) % 10000;
  return seed;
}

void main() {

  var Xn1 = 1234;
  var Xn2 = DateTime.now().millisecondsSinceEpoch;

  print("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
  print("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
  print("PADRAO: Middle Square");
  print("==========================================\n");
  print("    Semente: 1234        Semente: TIME");
  print("    -------------        -------------\n");

  for (int i = 1; i <= 10; i++) {
    Xn1 = meanSquare(Xn1);
    Xn2 = meanSquare(Xn2);
    print('${Xn1.toString().padLeft(17)}        ${Xn2.toString().padLeft(13)}');
  }

}
