import 'dart:io';

final List<List<int>> dammTab = [
  [0, 3, 1, 7, 5, 9, 8, 6, 4, 2],
  [7, 0, 9, 2, 1, 5, 4, 8, 6, 3],
  [4, 2, 0, 6, 8, 7, 1, 3, 5, 9],
  [1, 7, 5, 0, 9, 8, 3, 4, 2, 6],
  [6, 1, 2, 3, 0, 4, 5, 9, 7, 8],
  [3, 6, 7, 4, 2, 0, 9, 5, 8, 1],
  [5, 8, 6, 9, 7, 2, 0, 1, 3, 4],
  [8, 9, 4, 5, 3, 6, 2, 0, 1, 7],
  [9, 4, 3, 8, 6, 1, 7, 2, 0, 5],
  [2, 5, 8, 1, 4, 3, 6, 7, 9, 0]
];

int gerarDamm(String NUMERO) {
  int DV = 0;
  for (int I = 0; I < NUMERO.length; I++) {
    DV = dammTab[DV][int.parse(NUMERO[I])];
  }
  return DV;
}

String formataMatricula(int MATRICULA) {
  return MATRICULA.toString().padLeft(6, '0');
}

void main() async {
  var ARQUIVO = File('numeros.txt').openWrite();

  stdout.writeln("GERADOR DE NUMEROS DE MATRICULA DE 000.000 ATE 999.999 COM \"DV\"");
  stdout.writeln("Padrao: Damm");
  stdout.writeln("---------------------------------------------------------------");
  stdout.writeln();

  stdout.write("Aguarde ARQUIVO sendo gerado... ");

  for (int I = 0; I <= 999999; I++) {
    String MATRICULA = formataMatricula(I);
    int DV = gerarDamm(MATRICULA);
    ARQUIVO.writeln('${MATRICULA.substring(0, 3)}.${MATRICULA.substring(3)}-$DV');
  }

  await ARQUIVO.close();

  stdout.writeln("\n\nSUCESSO: Arquivo gerado.\n");
}
