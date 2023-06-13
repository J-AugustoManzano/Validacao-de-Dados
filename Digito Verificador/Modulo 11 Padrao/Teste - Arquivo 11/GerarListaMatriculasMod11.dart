import 'dart:io';

void removerCaractere(List<String> CADEIA, String CARACTERE) {
  int POS1 = 0;
  int POS2 = 0;
  while (CADEIA[POS1] != '\0') {
    CADEIA[POS2] = CADEIA[POS1];
    if (CADEIA[POS2] != CARACTERE) {
      POS2 += 1;
    }
    POS1 += 1;
  }
  CADEIA[POS2] = '\0';
}

String mod11(List<String> MATRIC_CPT) {
  List<String> MATRIC_SPT = List<String>.filled(8, '\0');
  List<int> MATRIC_INT = List<int>.filled(6, 0);
  int SOMA = 0;
  String DV = ' ';
  for (int I = 0; I < 8; I++) {
    MATRIC_SPT[I] = MATRIC_CPT[I];
  }
  removerCaractere(MATRIC_SPT, '.');
  for (int I = 0; I < 6; I++) {
    MATRIC_INT[I] = MATRIC_SPT[I].codeUnitAt(0) - 48;
  }
  for (int I = 0; I < 6; I++) {
    SOMA += MATRIC_INT[I] * (7 - I);
  }
  if (SOMA % 11 == 0) {
    DV = '0';
  } else if (SOMA % 11 == 1) {
    DV = 'X';
  } else if (SOMA % 11 == 10) {
    DV = '1';
  } else {
    DV = String.fromCharCode(11 - (SOMA % 11) + 48);
  }
  return DV;
}

void main() async {
  List<String> MATRICULA = List<String>.filled(12, '\0');

  File arquivo = File('numeros.txt');
  IOSink fileSink;
  try {
    fileSink = arquivo.openWrite();
  } catch (e) {
    stderr.writeln('Erro ao abrir o arquivo.');
    stdout.writeln('Programa encerrado.');
    stdout.writeln('');
    return;
  }

  stdout.writeln('GERADOR DE NUMEROS DE MATRICULA DE 000.000 ATE 999.999 COM "DV"');
  stdout.writeln('Padrao: Modulo 11');
  stdout.writeln('---------------------------------------------------------------');
  stdout.writeln('');

  stdout.write('Aguarde arquivo sendo gerado... ');

  for (int I = 0; I <= 999999; I++) {
    String MATRICULA_STR = I.toString().padLeft(6, '0');
    for (int J = 0; J < MATRICULA_STR.length; J++) {
      MATRICULA[J] = MATRICULA_STR[J];
    }
    String DV = mod11(MATRICULA);
    String MATRICULA_FORMATADA =
        '${MATRICULA_STR.substring(0, 3)}.${MATRICULA_STR.substring(3)}-$DV';
    fileSink.writeln(MATRICULA_FORMATADA);
  }

  await fileSink.close();

  stdout.writeln('\n\nSUCESSO: Arquivo gerado.\n');
}
