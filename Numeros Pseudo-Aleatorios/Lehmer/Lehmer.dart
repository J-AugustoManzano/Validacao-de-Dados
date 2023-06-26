import 'dart:math';

void main() {
  
  int Lehmer(int seed) {
    seed = (16807 * seed) % 2147483647;
    return seed;
  }

  print("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
  print("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
  print("PADRAO: Lehmer");
  print("==========================================\n");
  print("    Semente: 1234        Semente: TIME");
  print("    -------------        -------------");

  int Xn1 = 1234;
  int Xn2 = DateTime.now().millisecondsSinceEpoch ~/ 1000;

  for (int i = 1; i <= 10; i++) {
    Xn1 = Lehmer(Xn1);
    Xn2 = Lehmer(Xn2);
    print("${Xn1.toString().padLeft(17)}        ${Xn2.toString().padLeft(13)}");
  }

}
