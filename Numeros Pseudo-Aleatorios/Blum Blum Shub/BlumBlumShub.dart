/*
 PRNG .......: Blum-Blum-Shub
 Ano ........: 1986
 Autor ......: L. Blum, M. Blum & M. Shub
*/

import 'dart:math';

void main() {

  BigInt blumBlumShub(BigInt X) {
    return (X * X) % BigInt.from(2467246241);
  }

  print("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
  print("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
  print("PADRAO: Blum-Blum-Shub");
  print("==========================================\n");
  print("    Semente: 1234        Semente: TIME");
  print("    -------------        -------------");

  BigInt X1 = BigInt.from(1234);
  BigInt X2 = BigInt.from(DateTime.now().millisecondsSinceEpoch);
  
  List<BigInt> Xn1 = List<BigInt>.filled(10, BigInt.zero);
  List<BigInt> Xn2 = List<BigInt>.filled(10, BigInt.zero);

  for (int i = 0; i <= 9; i++) {
    Xn1[i] = blumBlumShub(X1);
    Xn2[i] = blumBlumShub(X2);
    X1 = Xn1[i];
    X2 = Xn2[i];
    print('${Xn1[i].toString().padLeft(17)}        ${Xn2[i].toString().padLeft(13)}');
  }
  
}
