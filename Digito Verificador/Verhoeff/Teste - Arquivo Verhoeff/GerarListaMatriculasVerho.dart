import 'dart:io';

List<List<int>> verhoeffD = [
  [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
  [1, 2, 3, 4, 0, 6, 7, 8, 9, 5],
  [2, 3, 4, 0, 1, 7, 8, 9, 5, 6],
  [3, 4, 0, 1, 2, 8, 9, 5, 6, 7],
  [4, 0, 1, 2, 3, 9, 5, 6, 7, 8],
  [5, 9, 8, 7, 6, 0, 4, 3, 2, 1],
  [6, 5, 9, 8, 7, 1, 0, 4, 3, 2],
  [7, 6, 5, 9, 8, 2, 1, 0, 4, 3],
  [8, 7, 6, 5, 9, 3, 2, 1, 0, 4],
  [9, 8, 7, 6, 5, 4, 3, 2, 1, 0],
];

List<List<int>> verhoeffP = [
  [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
  [1, 5, 7, 6, 2, 8, 3, 0, 9, 4],
  [5, 8, 0, 3, 7, 9, 6, 1, 4, 2],
  [8, 9, 1, 6, 0, 4, 3, 5, 2, 7],
  [9, 4, 5, 3, 1, 2, 6, 8, 7, 0],
  [4, 2, 8, 6, 5, 7, 3, 9, 0, 1],
  [2, 7, 9, 3, 8, 0, 6, 4, 1, 5],
  [7, 0, 4, 6, 9, 1, 3, 2, 5, 8],
];

List<int> verhoeffInv = [0, 4, 3, 2, 1, 5, 6, 7, 8, 9];

int gerarVerhoeff(String NUMERO) {
  int DIGITO = 0;
  int POS = 0;
  int NUM = 0;
  int TAMANHO = NUMERO.length;
  for (int I = 0; I < TAMANHO; I++) {
    POS = (I + 1) % 8;
    NUM = int.parse(NUMERO[TAMANHO - I - 1]);
    DIGITO = verhoeffD[DIGITO][verhoeffP[POS][NUM]];
  }
  return verhoeffInv[DIGITO];
}

String formataMatricula(int MATRICULA) {
  return MATRICULA.toString().padLeft(6, '0');
}

void main() async {
  var ARQUIVO = File('numeros.txt').openWrite();

  stdout.writeln("GERADOR DE NUMEROS DE MATRICULA DE 000.000 ATE 999.999 COM \"DV\"");
  stdout.writeln("Padrao: Verhoeff");
  stdout.writeln("---------------------------------------------------------------");
  stdout.writeln();

  stdout.write("Aguarde ARQUIVO sendo gerado... ");

  for (int I = 0; I <= 999999; I++) {
    String MATRICULA = formataMatricula(I);
    int DV = gerarVerhoeff(MATRICULA);
    ARQUIVO.writeln('${MATRICULA.substring(0, 3)}.${MATRICULA.substring(3)}-$DV');
  }

  await ARQUIVO.close();

  stdout.writeln("\n\nSUCESSO: Arquivo gerado.\n");
}
