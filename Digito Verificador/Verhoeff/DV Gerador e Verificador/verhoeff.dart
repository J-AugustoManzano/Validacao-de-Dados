import 'dart:io';

// Tabela de multiplicacao >>> d(j, k)
// k = 10 colunas
// j = 10 linhas
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

// Tabela de permutacao >>> p(pos, num)
// num = 10 colunas
// pos =  8 linhas (mod 8)
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

// Tabela de inversao >>> inv(j)
// j = 8 colunas
//     1 linha
List<int> verhoeffInv = [0, 4, 3, 2, 1, 5, 6, 7, 8, 9];

// Gerar digito verificador no padrao Verhoeff
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

// Validar digito verificador no padrao Verhoeff
// Ultimo digito do numero fornecido
bool validarVerhoeff(String NUMERO) {
  int DIGITO = 0;
  int POS = 0;
  int NUM = 0;
  int TAMANHO = NUMERO.length;
  for (int I = 0; I < TAMANHO; I++) {
    POS = I % 8;
    NUM = int.parse(NUMERO[TAMANHO - I - 1]);
    DIGITO = verhoeffD[DIGITO][verhoeffP[POS][NUM]];
  }
  return DIGITO == 0;
}

// Remove a mascara do numero
String removerMascara(String NUMERO) {
  String NUMERO_SMASC = '';
  bool ENCONTROU_PRIMEIRO_DIGITO = false;
  for (String CARACTERE in NUMERO.split('')) {
    if (CARACTERE == '.') {
      ENCONTROU_PRIMEIRO_DIGITO = true;
    } else if (int.tryParse(CARACTERE) != null) {
      if (!ENCONTROU_PRIMEIRO_DIGITO && CARACTERE == '0') {
        continue;
      }
      NUMERO_SMASC += CARACTERE;
    }
  }
  return NUMERO_SMASC;
}

void main() {
  int DV;
  bool entradaValida;
  String NUMERO;
  String NUMERO_COM_DV;
  String NUMERO_SEM_MASCARA_DV;
  String NUMERO_SMASC;

  entradaValida = false;
  do {
    stdout.write('Entre matricula no formato 999.999: ');
    NUMERO = stdin.readLineSync()!;
    stdout.writeln();
    if (NUMERO.length != 7 || NUMERO[3] != '.') {
      stdout.writeln();
      stdout.writeln('Matricula invalida. Tente novamente.');
      stdout.writeln();
    } else {
      entradaValida = true;
    }
  } while (!entradaValida);

  NUMERO_SMASC = removerMascara(NUMERO);
  DV = gerarVerhoeff(NUMERO_SMASC);
  stdout.writeln('Dígito verificador: $DV');
  stdout.writeln();

  entradaValida = false;
  do {
    stdout.write('Entre matricula e digito verificador no formato 999.999-9: ');
    NUMERO_COM_DV = stdin.readLineSync()!;
    stdout.writeln();
    if (NUMERO_COM_DV.length != 9 || NUMERO_COM_DV[3] != '.' || NUMERO_COM_DV[7] != '-') {
      stdout.writeln();
      stdout.writeln('Matricula invalida. Tente novamente.');
      stdout.writeln();
    } else {
      entradaValida = true;
    }
  } while (!entradaValida);

  NUMERO_SEM_MASCARA_DV = removerMascara(NUMERO_COM_DV);
  if (validarVerhoeff(NUMERO_SEM_MASCARA_DV)) {
    stdout.writeln('Matricula valida.');
  } else {
    stdout.writeln('Matricula invalida.');
  }
}
