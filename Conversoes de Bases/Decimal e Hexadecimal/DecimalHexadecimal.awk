#!/usr/bin/awk -f

function DecimalParaHexadecimal(decimal) {
    hexadecimal = ""
    while (decimal > 0) {
        resto = decimal % 16

        if (resto >= 0 && resto <= 9)
            hexadecimal = sprintf("%c%s", resto + 48, hexadecimal)
        else
            hexadecimal = sprintf("%c%s", resto + 55, hexadecimal)

        decimal = int(decimal / 16)
    }
    return hexadecimal
}

function HexadecimalParaDecimal(hexadecimal) {
    potencia = 0
    decimal = 0
    while (length(hexadecimal) > 0) {
        digito = substr(hexadecimal, length(hexadecimal), 1)
        digito = toupper(digito)
        if (digito >= "0" && digito <= "9")
            decimal += (digito - "0") * (16 ** potencia)
        else if (digito >= "A" && digito <= "F")
            decimal += (digito - "A" + 10) * (16 ** potencia)
        hexadecimal = substr(hexadecimal, 1, length(hexadecimal) - 1)
        potencia++
    }
    return decimal
}

BEGIN {
    LimiteMaximoDecimal = 2147483647
    LimiteMaximoHexadecimal = "7FFFFFFF"
    opcao = -1
    while (opcao != 0) {
        print "==============================="
        print " CONVERSOR DECIMAL-HEXADECIMAL "
        print "==============================="
        print ""
        print "1 - Converter decimal para hexadecimal"
        print "2 - Converter hexadecimal para decimal"
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
                print "Valor em hexadecimal: " DecimalParaHexadecimal(decimal)
            }
        } else if (opcao == 2) {
            printf "\nDigite um numero hexadecimal (ate %s): ", LimiteMaximoHexadecimal
            getline hexadecimal < "-"
            if (length(hexadecimal) > length(LimiteMaximoHexadecimal)) {
                print "Valor hexadecimal fora do limite permitido."
            } else {
                decimal = HexadecimalParaDecimal(hexadecimal)
                if (decimal == -1) {
                    print "Valor hexadecimal invalido."
                } else {
                    print "Valor em decimal: " decimal
                }
            }
        }
        print ""
    }
}
