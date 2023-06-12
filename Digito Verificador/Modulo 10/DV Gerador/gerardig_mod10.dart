// GerarMatricula
import 'dart:io';

bool validarMatricula(String matricula) {
  if (matricula.length != 7) return false;
  if (!RegExp(r'^\d$').hasMatch(matricula[0]) || !RegExp(r'^\d$').hasMatch(matricula[6])) return false;
  if (matricula[3] != '.') return false;
  for (var I = 1; I <= 2; I++) 
    if (!RegExp(r'^\d$').hasMatch(matricula[I]) || !RegExp(r'^\d$').hasMatch(matricula[I + 4])) return false;
  return true;
}

String removerCaractere(String cadeia, String caractere) {
  return cadeia.replaceAll(caractere, '');
}

int mod10(String matricula) {
  var MATRIC_SPT = removerCaractere(matricula, '.');
  var MATRIC_INT = List<int>.filled(6, 0);
  var I, SOMA = 0;
  for (I = 0; I <= 5; I++)
    MATRIC_INT[I] = int.parse(MATRIC_SPT[I]);
  for (I = 0; I <= 5; I++) {
    if (I % 2 != 0 && MATRIC_INT[I] * 2 > 9)
      SOMA += MATRIC_INT[I] * 2 - 9;
    else if (I % 2 != 0 && MATRIC_INT[I] * 2 <= 9)
      SOMA += MATRIC_INT[I] * 2;
    if (I % 2 == 0) SOMA += MATRIC_INT[I];
  }
  var DV = (SOMA ~/ 10 + 1) * 10 - SOMA;
  return DV;
}

void main() {
  
  var ENTRADA = stdin;
  var MATRIC_CPT;
  var DV;

  do {
    stdout.write('Informe matricula no formato 999.999: ');
    MATRIC_CPT = ENTRADA.readLineSync();
    if (!validarMatricula(MATRIC_CPT)) 
      print('\nMatricula invalida. Tente novamente.\n\n');
  } while (!validarMatricula(MATRIC_CPT));
  
  DV = mod10(MATRIC_CPT);
  print('\nMatricula com DV = $MATRIC_CPT-$DV');
  stdout.write('\nTecle <Enter> para encerrar...');
  ENTRADA.readLineSync();
}
