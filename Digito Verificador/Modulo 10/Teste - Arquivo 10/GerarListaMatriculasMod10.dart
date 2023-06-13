import 'dart:io';

String formataMatricula(int MATRICULA) {
  return MATRICULA.toString().padLeft(6, '0');
}

int mod10(String MATRICULA) {
  int SOMA = 0;
  for (int I = 0; I <= 5; I++) {
    int DIGITO = int.parse(MATRICULA[I]);
    if (I % 2 != 0 && DIGITO * 2 > 9)
      SOMA += DIGITO * 2 - 9;
    else if (I % 2 != 0 && DIGITO * 2 <= 9)
      SOMA += DIGITO * 2;
    else
      SOMA += DIGITO;
  }
  int DV = (SOMA % 10 == 0) ? 0 : 10 - SOMA % 10;
  return DV;
}

void main() async {
  var ARQUIVO = File('numeros.txt').openWrite();

  stdout.writeln("GERADOR DE NUMEROS DE MATRICULA DE 000.000 ATE 999.999 COM \"DV\"");
  stdout.writeln("Padrao: Modulo 10");
  stdout.writeln("---------------------------------------------------------------");
  stdout.writeln();

  stdout.write("Aguarde ARQUIVO sendo gerado... ");

  for (int I = 0; I <= 999999; I++) {
    String MATRICULA = formataMatricula(I);
    int DV = mod10(MATRICULA);
    ARQUIVO.writeln('${MATRICULA.substring(0, 3)}.${MATRICULA.substring(3)}-$DV');
  }

  await ARQUIVO.close();

  stdout.writeln("\n\nSUCESSO: Arquivo gerado.\n");
}
