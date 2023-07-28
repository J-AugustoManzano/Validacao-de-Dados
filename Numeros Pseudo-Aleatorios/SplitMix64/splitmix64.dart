/*
 PRNG .......: SplitMix64
 Ano ........: 2015
 Autor ......: Sebastiano Vigna
*/

// Fundamentado: rosettacode.org/wiki/Pseudo-random_numbers/Splitmix64

import 'dart:core';

class SplitMix64 {
  late int _state;

  SplitMix64(int seed) {
    _state = seed;
  }

  int _nextInt() {
    _state += 0x9e3779b97f4a7c15;
    var z = _state;
    z = (z ^ (z >> 30)) * 0xbf58476d1ce4e5b9;
    z = (z ^ (z >> 27)) * 0x94d049bb133111eb;
    return z ^ (z >> 31);
  }

  double nextFloat() {
    return (_nextInt() >> 11) / (1 << 53);
  }

  int nextInt() {
    return _nextInt();
  }
}

void main() {

  var Xn1 = SplitMix64(1234);
  var Xn2 = SplitMix64(DateTime.now().millisecondsSinceEpoch);

  print('GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)');
  print('PSEUDORANDOM NUMBER GENERATOR (PRNG)');
  print('PADRAO: SplitMix64');
  print('===================================================');
  print('');

  print('  Semente: 1234 (int)        Semente: TIME (int)');
  print('  --------------------       --------------------');
  for (var i = 1; i <= 5; i++) {
    print('${Xn1.nextInt().toString().padLeft(22)}'
        ' ${Xn2.nextInt().toString().padLeft(26)}');
  }
  print('');

  print('  Semente: 1234 (real)       Semente: TIME (real)');
  print('  --------------------       --------------------');
  for (var i = 1; i <= 5; i++) {
    print('${Xn1.nextFloat().toStringAsFixed(18).padLeft(22)}'
        ' ${Xn2.nextFloat().toStringAsFixed(18).padLeft(26)}');
  }
  
}
