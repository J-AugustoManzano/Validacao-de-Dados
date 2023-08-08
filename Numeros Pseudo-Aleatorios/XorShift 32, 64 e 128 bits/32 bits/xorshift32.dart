/*
 PRNG .......: XorShift (32 bits)
 Ano ........: 2003
 Autor ......: George Marsaglia
*/

import 'dart:math';

class XorShift32State {
  int seed;
  XorShift32State(this.seed);
}

int xorshift32(XorShift32State state) {
  int random = state.seed;
  random ^= random << 13;
  random ^= random >> 17;
  random ^= random << 5;
  state.seed = random;
  return random & 0x7FFFFFFF; // Apenas os 31 bits mais significativos
}

void main() {
	
  XorShift32State Xn1 = XorShift32State(1234);
  XorShift32State Xn2 = XorShift32State(DateTime.now().millisecondsSinceEpoch);

  print("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
  print("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
  print("PADRAO: XorShift (32 bits)");
  print("=============================================");
  print("");
  print("      Semente: 1234       Semente: TIME");
  print("      -------------       -------------");

  for (int i = 1; i <= 10; i++) {
    print("${xorshift32(Xn1).toString().padLeft(19)}${xorshift32(Xn2).toString().padLeft(20)}");
  }
  
}
