/*
 PRNG .......: Linear Congruential
 Ano ........: 1965
 Autor ......: W. E. Thomson
*/

import 'dart:core';

double linearCongruential(List<int> seed) {
  final int M = 2147483647;
  seed[0] = (1664525 * seed[0] + 1013904223) % M;
  return seed[0].toDouble() / M;
}

void main() {
  List<int> Xn1 = [1234];
  List<int> Xn2 = [DateTime.now().millisecondsSinceEpoch];

  print("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
  print("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
  print("PADRAO: Linear Congruential");
  print("==========================================");
  print("");
  print("    Semente: 1234        Semente: TIME");
  print("    -------------        -------------");

  for (int i = 1; i <= 10; i++) {
    print(
        "${linearCongruential(Xn1).toStringAsFixed(11).padLeft(17)}        ${linearCongruential(Xn2).toStringAsFixed(11).padLeft(13)}");
  }
}
