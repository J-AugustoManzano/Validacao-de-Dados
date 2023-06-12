import 'dart:io';

String formataMatricula(int matricula) {
  return matricula.toString().padLeft(6, '0');
}

int mod10(String matricula) {
  int soma = 0;
  for (int i = 0; i < 6; i++) {
    int digito = int.parse(matricula[i]);
    if (i % 2 != 0 && digito * 2 > 9)
      soma += digito * 2 - 9;
    else if (i % 2 != 0 && digito * 2 <= 9)
      soma += digito * 2;
    else
      soma += digito;
  }
  int dv = (soma % 10 == 0) ? 0 : 10 - soma % 10;
  return dv;
}

void main() async {
  var arquivo = File('numeros.txt').openWrite();

  stdout.writeln("GERADOR DE NUMEROS DE MATRICULA DE 000.000 ATE 999.999 COM \"DV\"");
  stdout.writeln("Padrao: Modulo 10");
  stdout.writeln("---------------------------------------------------------------");
  stdout.writeln();

  stdout.write("Aguarde arquivo sendo gerado... ");

  for (int i = 0; i <= 999999; i++) {
    String matricula = formataMatricula(i);
    int dv = mod10(matricula);
    arquivo.writeln('${matricula.substring(0, 3)}.${matricula.substring(3)}-$dv');
  }

  await arquivo.close();

  stdout.writeln("\n\nSUCESSO: Arquivo gerado.\n");
}
