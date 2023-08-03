/**
 * PRNG .......: Wichmann Hill
 * Ano ........: 1982
 * Autor ......: Brian A. Wichmann & David H. Hill
 */

import 'dart:io';

double WichmannHill(List<int> X) {
  X[0] = (171 * X[0]) % 30269;
  return X[0] / 30269.0;
}

void main() {
  
  print("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
  print("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
  print("PADRAO: Wichmann Hill");
  print("==========================================\n");

  print("    Semente: 1234        Semente: TIME");
  print("    -------------        -------------\n");

  List<int> X1 = [1234];
  List<int> X2 = [DateTime.now().millisecondsSinceEpoch];

  List<double> Xn1 = [];
  List<double> Xn2 = [];

  for (int i = 0; i <= 9; i++) {
    Xn1.add(WichmannHill(X1));
    Xn2.add(WichmannHill(X2));
    stdout.write(Xn1[i].toStringAsFixed(11).padLeft(17));
    stdout.write("        ");
    stdout.write(Xn2[i].toStringAsFixed(11).padLeft(13));
    stdout.write('\n');
  }
  
}
