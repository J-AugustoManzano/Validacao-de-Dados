/*
 PRNG .......: Add With Carry (AWC)
 Ano ........: 1991
 Autor ......: George Marsaglia
*/

import 'dart:io';

int AWCNextRandom(int Xn) {
  Xn = (Xn + 12345) % 4294967296;
  return Xn;
}

void AWCInitialize(int seed, List<int> Xn) {
  Xn[0] = seed;
}

void main() {

  stdout.writeln("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
  stdout.writeln("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
  stdout.writeln("PADRAO: Add With Carry");
  stdout.writeln("==========================================");
  stdout.writeln();
  stdout.writeln("    Semente: 1234        Semente: TIME");
  stdout.writeln("    -------------        -------------");

  List<int> Xn1 = List.filled(1, 0);
  List<int> Xn2 = List.filled(1, 0);
  int i;
  int seed1, seed2;

  seed1 = 1234;
  AWCInitialize(seed1, Xn1);

  seed2 = DateTime.now().millisecondsSinceEpoch;
  AWCInitialize(seed2, Xn2);

  for (i = 1; i <= 10; i++) {
    Xn1[0] = AWCNextRandom(Xn1[0]);
    Xn2[0] = AWCNextRandom(Xn2[0]);

    stdout.write(' ' * (17 - Xn1[0].toString().length) + '${Xn1[0]}');
    stdout.write('        ');
    stdout.write(' ' * (13 - Xn2[0].toString().length) + '${Xn2[0]}');
    stdout.writeln();
  }

}
