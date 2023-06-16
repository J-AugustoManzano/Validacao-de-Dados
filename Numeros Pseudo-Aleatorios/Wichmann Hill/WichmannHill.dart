/**
 * PRNG .......: Wichmann Hill
 * Ano ........: 1982
 * Autor ......: Brian A. Wichmann & David H. Hill
 */

import 'dart:io';

double WichmannHill(int X) {
  X = (171 * X) % 30269;
  return X.abs() / 30269.0;
}

void main() {
  print("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
  print("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
  print("PADRAO: Wichmann Hill");
  print("==========================================\n");

  print("    Semente: 1234        Semente: TIME");
  print("    -------------        -------------\n");

  int X1 = 1234;
  int X2 = DateTime.now().millisecondsSinceEpoch;

  List<double> semente1234 = [];
  for (int i = 0; i <= 9; i++) {
    semente1234.add(WichmannHill(X1));
    X1 = (171 * X1) % 30269;
  }

  List<double> sementeTime = [];
  for (int i = 0; i <= 9; i++) {
    sementeTime.add(WichmannHill(X2));
    X2 = (171 * X2) % 30269;
  }

  for (int i = 0; i <= 9; i++) {
    stdout.write(semente1234[i].toStringAsFixed(11).padLeft(17));
    stdout.write("        ");
    stdout.write(sementeTime[i].toStringAsFixed(11).padLeft(13));
    stdout.write('\n');
  }
}
