/*
 PRNG .......: XorShift (128 bits)
 Ano ........: 2003
 Autor ......: George Marsaglia
*/

class XorShift128State {
  int seed = 0;
}

int xorShift128(XorShift128State state) {
	
  int random = state.seed;
  random ^= random << 13;
  random ^= random >> 7;
  random ^= random << 17;
  state.seed = random;
  return random & 0x7FFFFFFFFFFFFFFF;
}

void main() {
  var Xn1 = XorShift128State();
  var Xn2 = XorShift128State();

  Xn1.seed = 1234;
  Xn2.seed = DateTime.now().millisecondsSinceEpoch;

  print('GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)');
  print('PSEUDORANDOM NUMBER GENERATOR (PRNG)');
  print('PADRAO: XorShift (128 bits)');
  print('=================================================');
  print('');
  print('   Semente: 1234          Semente: TIME');
  print('   --------------------   --------------------');

  for (int i = 1; i <= 10; i++) {
    print('${xorShift128(Xn1).toString().padLeft(23)}${xorShift128(Xn2).toString().padLeft(23)}');
  }
  
}
