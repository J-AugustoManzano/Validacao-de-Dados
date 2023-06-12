// ValidarMatricula
import 'dart:io';

bool validarMatricula(String MATRICULA) {
  if (MATRICULA.length != 9) return false;
  if (!RegExp(r'^[0-9]{3}\.[0-9]{3}-[0-9]$').hasMatch(MATRICULA)) return false;
  return true;
}

String removerCaractere(String CADEIA, String CARACTERE) {
  return CADEIA.replaceAll(CARACTERE, '');
}

int mod10Check(String MATRICULA) {
  List<int> MATRIC_INT = [];
  int SOMA = 0;
  int DV = 0;

  for (int i = 0; i < 6; i++) {
    MATRIC_INT.add(int.parse(MATRICULA[i]));
  }

  for (int i = 0; i < 6; i++) {
    if ((i + 1) % 2 == 0) {
      if (MATRIC_INT[i] * 2 > 9) {
        SOMA += MATRIC_INT[i] * 2 - 9;
      } else {
        SOMA += MATRIC_INT[i] * 2;
      }
    } else {
      SOMA += MATRIC_INT[i];
    }
  }

  DV = (10 - (SOMA % 10)) % 10;
  return DV;
}

void main() {
  String MATRIC_CPT = '';
  String MATRIC_SPT = '';
  List<int> MATRIC_INT = [];
  int DVC = 0;
  int DVE = 0;

  do {
    stdout.write('Informe a matricula no formato 999.999-9: ');
    MATRIC_CPT = stdin.readLineSync()!;

    if (!validarMatricula(MATRIC_CPT)) {
      print('\nEntrada invalida, tente novamente.\n\n');
    }
  } while (!validarMatricula(MATRIC_CPT));

  MATRIC_SPT = MATRIC_CPT;
  MATRIC_SPT = removerCaractere(MATRIC_SPT, '.');
  MATRIC_SPT = removerCaractere(MATRIC_SPT, '-');
  DVC = mod10Check(MATRIC_SPT);

  for (int i = 0; i < 7; i++) {
    MATRIC_INT.add(int.parse(MATRIC_SPT[i]));
  }
  DVE = MATRIC_INT[6];

  print('');
  if (DVC == DVE) {
    print('Matricula valida.');
  } else {
    print('Matricula invalida.');
  }
  print('');

  stdout.write('Pressione <Enter> para encerrar... ');
  stdin.readLineSync();
}
