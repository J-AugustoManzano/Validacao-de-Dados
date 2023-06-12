import 'dart:io';

bool _isDigit(String CARACTERE) {
  return CARACTERE.codeUnitAt(0) >= 48 && CARACTERE.codeUnitAt(0) <= 57;
}

bool validarMatricula(String MATRICULA) {
  if (MATRICULA.length != 9) return false;
  for (int I = 0; I <= 2; I++) {
    if (!_isDigit(MATRICULA[I])) return false;
  }
  if (MATRICULA[3] != '.') return false;
  for (int I = 4; I <= 6; I++) {
    if (!_isDigit(MATRICULA[I])) return false;
  }
  if (MATRICULA[7] != '-') return false;
  if (!_isDigit(MATRICULA[8])) return false;
  return true;
}

String removerCaractere(String CADEIA, String CARACTERE) {
  StringBuffer NOVACADEIA = new StringBuffer();
  for (int I = 0; I < CADEIA.length; I++) {
    if (CADEIA[I] != CARACTERE) {
      NOVACADEIA.write(CADEIA[I]);
    }
  }
  return NOVACADEIA.toString();
}

int mod11Check(String MATRICULA) {
  List<int> MATRIC_INT = List<int>.filled(7, 0);
  int DV, I;
  for (int I = 0; I <= 6; I++)
    MATRIC_INT[I] = MATRICULA.codeUnitAt(I) - 48;
  int SOMA = 0;
  for (I = 0; I <= 5; I++) {
    SOMA += MATRIC_INT[I] * (7 - I);
  }
  DV = (11 - SOMA % 11) % 10;
  return DV;
}

void main() {
  String MATRIC_CPT;
  String MATRIC_SPT;
  List<int> MATRIC_INT = List<int>.filled(7, 0);
  int DVC, DVE;

  do {
    stdout.write('Informe matricula no formato 999.999-9: ');
    MATRIC_CPT = stdin.readLineSync()!;
    if (!validarMatricula(MATRIC_CPT)) {
      print('\nMatricula invalida. Tente novamente.\n');
    }
  } while (!validarMatricula(MATRIC_CPT));

  MATRIC_SPT = MATRIC_CPT;
  MATRIC_SPT = removerCaractere(MATRIC_SPT, '.');
  MATRIC_SPT = removerCaractere(MATRIC_SPT, '-');
  DVC = mod11Check(MATRIC_SPT);
  MATRIC_INT[6] = MATRIC_SPT.codeUnitAt(6) - 48;
  DVE = MATRIC_INT[6];
  print('');
  if (DVC == DVE)
    print('Numero de matricula valido');
  else
    print('Numero de matricula invalido');
  print('');
  stdout.write('Tecle <Enter> para encerrar... ');
  stdin.readLineSync();
}
