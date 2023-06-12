import 'dart:io';

bool validarMatricula(String MATRICULA) {
  if (MATRICULA.length != 7) return false;
  if (!RegExp(r'^\d$').hasMatch(MATRICULA[0]) || !RegExp(r'^\d$').hasMatch(MATRICULA[6])) return false;
  if (MATRICULA[3] != '.') return false;
  for (int I = 1; I <= 2; I++) {
    if (!RegExp(r'^\d$').hasMatch(MATRICULA[I]) || !RegExp(r'^\d$').hasMatch(MATRICULA[I + 4])) return false;
  }
  return true;
}

String removerCaractere(String CADEIA, String CARACTERE) {
  return CADEIA.replaceAll(CARACTERE, '');
}

String mod11(String MATRIC_CPT) {
  String MATRIC_SPT = MATRIC_CPT;
  MATRIC_SPT = removerCaractere(MATRIC_SPT, '.');
  List<int> MATRIC_INT = List<int>.filled(6, 0);
  for (int I = 0; I <= 5; I++) {
    MATRIC_INT[I] = MATRIC_SPT.codeUnitAt(I) - 48;
  }
  int SOMA = 0;
  for (int I = 0; I <= 5; I++) {
    SOMA += MATRIC_INT[I] * (7 - I);
  }
  String DV;
  if ((SOMA % 11) == 0) {
    DV = '0';
  } else if ((SOMA % 11) == 1) {
    DV = 'X';
  } else if ((SOMA % 11) == 10) {
    DV = '1';
  } else {
    DV = String.fromCharCode((11 - (SOMA % 11)) + 48);
  }
  return DV;
}

void main() {
	
  String MATRICULA;
  String DV;

  do {
    stdout.write("Informe matricula no formato 999.999: ");
    MATRICULA = stdin.readLineSync()!;
    if (!validarMatricula(MATRICULA)) {
      print('');
      print("Matricula invalida. Tente novamente.");
      print('');
    }
  } while (!validarMatricula(MATRICULA));

  DV = mod11(MATRICULA);
  print('');
  print("Matricula com DV = $MATRICULA-$DV");
  print('');
  stdout.write("Tecle <Enter> para encerrar... ");
  stdin.readLineSync();
}
