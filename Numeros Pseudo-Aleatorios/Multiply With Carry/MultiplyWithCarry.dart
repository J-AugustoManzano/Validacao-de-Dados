/*
 PRNG .......: Multiply With Carry (MWC)
 Ano ........: Desconhecido
 Autor ......: George Marsaglia
*/

import 'dart:io';

class CmwcRnd {
	
  List<int> _randomValues = List<int>.filled(4096, 0);
  int _carry = 0;
  int _currentIndex = 0;

  int _log2ibase(int n, int acc) {
    if (n == 1)
      return acc;
    else
      return _log2ibase(n >> 1, acc + 1);
  }

  int _log2i(int n) {
    return _log2ibase(n, 0);
  }

  int _rand32() {
    int t;
    int x;
    _currentIndex = (_currentIndex + 1) & 4095;
    t = 18782 * _randomValues[_currentIndex] + _carry;
    _carry = (t >> 32);
    x = t + _carry;
    if (x < _carry) {
      x++;
      _carry++;
    }
    return _randomValues[_currentIndex] = 0xFFFFFFFF - x;
  }

  void initCMWC(int seed) {
    int i;
    for (i = 0; i <= 4095; i++) {
      seed = (seed * 1103515245 + 12345) & 0xFFFFFFFF;
      _randomValues[i] = seed;
    }
    do {
      seed = (seed * 1103515245 + 12345) & 0xFFFFFFFF;
      _carry = seed;
    } while (!(_carry < 809430660));
    _currentIndex = 4095;
  }

  int randCMWC() {
    return _rand32() & 0x7FFFFFFF; // Máscara de bits para descartar o bit de sinal
  }
  
}

void main() {
	
  CmwcRnd cmwc1 = CmwcRnd();
  CmwcRnd cmwc2 = CmwcRnd();
  
  int Xn1 = 1234;
  int Xn2 = DateTime.now().millisecondsSinceEpoch;

  cmwc1.initCMWC(Xn1);
  cmwc2.initCMWC(Xn2);

  print('GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)');
  print('PSEUDORANDOM NUMBER GENERATOR (PRNG)');
  print('PADRAO: Multiply With Carry (MWC)');
  print('==========================================\n');
  print('    Semente: 1234        Semente: TIME');
  print('    -------------        -------------');

  for (int i = 1; i <= 10; i++) {
    print('${cmwc1.randCMWC().toString().padLeft(17)}${cmwc2.randCMWC().toString().padLeft(21)}');
  }
  
}
