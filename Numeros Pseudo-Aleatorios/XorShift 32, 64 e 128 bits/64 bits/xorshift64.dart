/*
 PRNG .......: XorShift (64 bits)
 Ano ........: 2003
 Autor ......: George Marsaglia
*/

import 'dart:core';

class XorShift64State {
  late int seed;

  XorShift64State(int seed) {
    this.seed = seed;
  }
}

int xorShift64(XorShift64State state) {
  int random = state.seed;
  random ^= random << 13;
  random ^= random >> 7;
  random ^= random << 17;
  state.seed = random;
  return random & 0x7FFFFFFFFFFFFFFF;
}

void main() {
  var Xn1 = XorShift64State(1234);
  var Xn2 = XorShift64State(DateTime.now().millisecondsSinceEpoch);

  print('GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)');
  print('PSEUDORANDOM NUMBER GENERATOR (PRNG)');
  print('PADRAO: XorShift (64 bits)');
  print('=================================================');
  print('');
  print('   Semente: 1234          Semente: TIME');
  print('   --------------------   --------------------');

  for (var i = 1; i <= 10; i++) {
    print('${xorShift64(Xn1).toString().padLeft(23)}${xorShift64(Xn2).toString().padLeft(23)}');
  }
}
