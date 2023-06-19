/**
 * PRNG .......: Park-Miller
 * Ano ........: 1988
 * Autor ......: S. K. Park & K. W. Miller
 */

import 'dart:io';
import 'dart:math';

int parkMiller(int x) {
  x = (16807 * x) % 2147483647;
  return x;
}

void main() {

  int x1 = 1234;
  int x2 = DateTime.now().millisecondsSinceEpoch;

  print('GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)');
  print('PSEUDORANDOM NUMBER GENERATOR (PRNG)');
  print('PADRAO: Park-Miller');
  print('==========================================');
  print('');
  print('    Semente: 1234        Semente: TIME');
  print('    -------------        -------------');

  for (int i = 1; i <= 10; i++) {
    x1 = parkMiller(x1);
    x2 = parkMiller(x2);
    print('${x1.toString().padLeft(17)}        ${x2.toString().padLeft(13)}');
  }

}
