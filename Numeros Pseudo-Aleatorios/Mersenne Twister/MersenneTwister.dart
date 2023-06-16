import 'dart:io';

/**
 * PRNG .......: Mersenne Twister (MT)
 * Ano ........: 1998
 * Autor ......: Makoto Matsumoto & Takuji Nishimura
 */

class MT19937 {
  int w = 32;
  int n = 624;
  int f = 1812433253;
  int m = 397;
  int r = 31;
  int a = 0x9908B0DF;
  int d = 0xFFFFFFFF;
  int b = 0x9D2C5680;
  int c = 0xEFC60000;
  int u = 11;
  int s = 7;
  int t = 15;
  int l = 18;

  List<int> X = List<int>.filled(624, 0);
  int cnt = 0;

  void twist() {
    for (int i = 0; i < n; i++) {
      int lower_mask = (1 << r) - 1;
      int upper_mask = ~lower_mask;
      int tmp = (X[i] & upper_mask) + (X[(i + 1) % n] & lower_mask);
      int tmpA = tmp >> 1;
      if ((tmp & 1) != 0) {
        tmpA ^= a;
      }
      X[i] = X[(i + m) % n] ^ tmpA;
    }
    cnt = 0;
  }

  void initialize(int seed) {
    X[0] = seed;
    for (int i = 1; i < n; i++) {
      int value = (f * (X[i - 1] ^ (X[i - 1] >> (w - 2))) + i) & 0xFFFFFFFF;
      X[i] = value;
    }
    twist();
  }

  int generateRandomNumber() {
    if (cnt == n) {
      twist();
    }
    int y = X[cnt];
    y ^= (y >> u) & d;
    y ^= (y << s) & b;
    y ^= (y << t) & c;
    y ^= y >> l;
    cnt++;
    return y;
  }
}

void main() {
	
  MT19937 rng1 = MT19937();
  MT19937 rng2 = MT19937();

  rng1.initialize(1234);

  print("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
  print("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
  print("PADRAO: Mersenne Twister (MT)");
  print("==========================================\n");
  print("    Semente: 1234        Semente: TIME");
  print("    -------------        -------------\n");

  for (int i = 0; i < 10; i++) {
    rng2.initialize(DateTime.now().millisecondsSinceEpoch);
    stdout.write('${rng1.generateRandomNumber().toString().padLeft(17)}');
    print('${rng2.generateRandomNumber().toString().padLeft(21)}');
  }
  
}
