#!/usr/bin/awk -f

function VALIDA_HEXA(VALOR) {
  for (i = 1; i <= length(VALOR); i++) {
    CARACTERE = substr(VALOR, i, 1);
    if (!(CARACTERE ~ /[0-9A-F]/)) {
      return 0;
    }
  }
  return 1;
}

BEGIN {
  printf("\n");

  while (1) {
    printf("Entre valor hexadecimal de 4 caracteres: ");
    getline VALOR_HEX < "/dev/tty";
    if (length(VALOR_HEX) != 4) {
      print "Valor invalido, deve ter exatamente 4 caracteres.\n";
      continue;
    }
    if (!VALIDA_HEXA(VALOR_HEX)) {
      print "Valor invalido, apenas caracteres [0-9] e [A-F].\n";
      continue;
    }
    break;
  }
  VALOR_HEX = toupper(VALOR_HEX);
  printf("Valor fornecido: %s\n\n", VALOR_HEX);
}
