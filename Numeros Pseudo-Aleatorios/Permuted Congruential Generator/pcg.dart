/*
 * PRNG .......: Permuted Congruential Generator (PCG)
 * Ano ........: 2014
 * Autor ......: Dr. M.E. O'Neill
 */

import 'dart:core';
import 'dart:io';
import 'dart:typed_data';

int rotr32(int x, int r) {
  return (x >> r) | (x << (32 - r));
}

int pcg32(Int64List seed) {
  int x = seed[0].toInt();
  int rotation = (x >> 59) & 31; // So 5 bits mais significativos sao usados
  seed[0] = (x * 6364136223846793005 + 1442695040888963407) & 0xFFFFFFFFFFFFFFFF;
  x ^= x >> 18;
  seed[0] += x;
  return (rotr32(((x >> 27) + rotation) ^ (seed[0] >> 32).toInt(), rotation) & 0xFFFFFFFF);
}

int getTimer() {
  DateTime now = DateTime.now();
  int millis = now.millisecondsSinceEpoch;
  return millis;
}

void main() {
  print("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
  print("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
  print("PADRAO: Permuted Congruential Generator (PCG)");
  print("=============================================");
  print("");

  Int64List Xn1 = Int64List(1);
  Int64List Xn2 = Int64List(1);
 
  Xn1[0] = 1234;
  Xn2[0] = getTimer();

  print("      Semente: 1234       Semente: TIME");
  print("      -------------       -------------");

  for (int i = 1; i <= 10; i++) {
    stdout.write('${pcg32(Xn1).toString().padLeft(19)}');
    stdout.write('${pcg32(Xn2).toString().padLeft(20)}\n');
  }
}
