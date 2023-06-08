#!/usr/bin/awk -f

function DecimalParaOctal(decimal) {
  octal = ""
  while (decimal > 0) {
    resto = decimal % 8
    octal = resto octal
    decimal = int(decimal / 8)
  }
  return octal
}

function OctalParaDecimal(octal) {
  valor = 0
  potencia = 0
  while (octal > 0) {
    digito = octal % 10
    valor += digito * 8 ^ potencia
    octal = int(octal / 10)
    potencia++
  }
  return valor
}

function IsValidOctal(octal) {
  while (octal > 0) {
    if (octal % 10 > 7) {
      return 0
    }
    octal = int(octal / 10)
  }
  return 1
}

BEGIN {
  LimiteMaximoDecimal = 2147483647
  LimiteMaximoOctal = 17777777777

  opcao = -1
  while (opcao != 0) {
    print "==============================="
    print " CONVERSOR DECIMAL-OCTAL       "
    print "==============================="
    print ""
    print "1 - Converter decimal para octal"
    print "2 - Converter octal para decimal"
    print "0 - Sair"
    print ""
    printf "Digite a opcao desejada: "
    getline opcao < "-"
    if (opcao == 1) {
      printf "\nDigite um numero decimal (ate %d): ", LimiteMaximoDecimal
      getline decimal < "-"
      if (decimal > LimiteMaximoDecimal) {
        print "Valor decimal fora do limite permitido."
      } else {
        print "Valor em octal: " DecimalParaOctal(decimal)
      }
    } else if (opcao == 2) {
      printf "\nDigite um numero octal (ate %d): ", LimiteMaximoOctal
      getline octal < "-"
      if (!IsValidOctal(octal)) {
        print "Valor octal invalido."
      } else if (octal > LimiteMaximoOctal) {
        print "Valor octal fora do limite permitido."
      } else {
        print "Valor em decimal: " OctalParaDecimal(octal)
      }
    }
    print ""
  }
}
