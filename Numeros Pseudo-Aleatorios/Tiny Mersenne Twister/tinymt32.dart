/*
 PRNG .......: Tiny Mersenne Twister (TMT)
 Ano ........: 2015 (version 1.1)
 Autor ......: Mutsuo Saito & Makoto Matsumoto
*/

import 'dart:io';

class Tinymt32PRNG {
  late List<int> _status;
  late int _matrixAlpha;
  late int _matrixBeta;
  late int _tempCoeff;

  Tinymt32PRNG() {
    _status = List<int>.filled(4, 0);
    _matrixAlpha = 0x8f7011ee;
    _matrixBeta = 0xfc78ff1f;
    _tempCoeff = 0x3793fdff;
  }

  void _tinymt32NextState() {
    int stateX = (_status[0] & 0x7fffffff) ^ _status[1] ^ _status[2];
    stateX ^= stateX << 1;
    int stateY = _status[3];
    stateY ^= (stateY >> 1) ^ stateX;
    _status[0] = _status[1];
    _status[1] = _status[2];
    _status[2] = stateX ^ (stateY << 10);
    _status[3] = stateY;
    if ((stateY & 1) == 1) {
      _status[1] ^= _matrixAlpha;
      _status[2] ^= _matrixBeta;
    }
  }

  int _tinymt32Temp() {
    int finalValue = _status[3];
    int tempCalc = _status[0] + (_status[2] >> 8);
    finalValue ^= tempCalc;
    finalValue ^= ((tempCalc & 1) != 0) ? _tempCoeff : 0;
    return finalValue;
  }

  void tinymt32Init(int seed) {
    _status[0] = seed;
    _status[1] = _matrixAlpha;
    _status[2] = _matrixBeta;
    _status[3] = _tempCoeff;
    for (int i = 1; i <= 7; i++) {
      _status[i & 3] ^=
          i + 1812433253 * (_status[(i - 1) & 3] ^ (_status[(i - 1) & 3] >> 30));
    }
    for (int i = 0; i <= 7; i++) {
      _tinymt32NextState();
    }
  }

  int tinymt32Gen() {
    _tinymt32NextState();
    return _tinymt32Temp() & 0xFFFFFFFF;
  }
}

void main() {
  int Xn1, Xn2;

  Tinymt32PRNG seed1 = Tinymt32PRNG();
  Tinymt32PRNG seed2 = Tinymt32PRNG();

  seed1.tinymt32Init(1234);
  seed2.tinymt32Init(DateTime.now().millisecondsSinceEpoch ~/ 1000);

  print("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
  print("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
  print("PADRAO: Tiny Mersenne Twister (TMT)");
  print("=============================================");
  print("");
  print("      Semente: 1234       Semente: TIME");
  print("      -------------       -------------");

  for (int i = 1; i <= 10; i++) {
    Xn1 = seed1.tinymt32Gen();
    Xn2 = seed2.tinymt32Gen();
    stdout.write('${Xn1.toString().padLeft(19)}${Xn2.toString().padLeft(20)}\n');
  }
}
