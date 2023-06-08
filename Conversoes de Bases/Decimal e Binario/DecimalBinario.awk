#!/usr/bin/awk -f

function DecimalParaBinario(decimal) {
  binario = ""
  while (decimal > 0) {
    resto = decimal % 2
    binario = resto binario
    decimal = int(decimal / 2)
  }
  while (length(binario) < 32) {
    binario = "0" binario
  }
  return binario
}

function BinarioParaDecimal(binario) {
  valor = 0
  for (i = length(binario); i >= 1; i--) {
    if (substr(binario, i, 1) == "1") {
      potencia = length(binario) - i
      valor += 2 ^ potencia
    }
  }
  return valor
}

function IsValidBinario(binario) {
  for (i = 1; i <= length(binario); i++) {
    if (substr(binario, i, 1) != "0" && substr(binario, i, 1) != "1") {
      return 0
    }
  }
  return 1
}

BEGIN {
  LimiteMaximoDecimal = 2147483647
  LimiteMaximoBinario = "1111111111111111111111111111111"
  opcao = -1
  while (opcao != 0) {
    print "==========================="
    print " CONVERSOR DECIMAL-BINARIO "
    print "==========================="
    print ""
    print "1 - Converter decimal para binario"
    print "2 - Converter binario para decimal"
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
        print "Valor em binario: " DecimalParaBinario(decimal)
      }
    } else if (opcao == 2) {
      printf "\nDigite um numero binario (ate %s): ", LimiteMaximoBinario
      getline binario < "-"
      if (!IsValidBinario(binario)) {
        print "Valor binario invalido."
      } else if (length(binario) > length(LimiteMaximoBinario)) {
        print "Valor binario fora do limite permitido."
      } else {
        print "Valor em decimal: " BinarioParaDecimal(binario)
      }
    }
    print ""
  }
}
