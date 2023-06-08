#!/usr/bin/awk -f

function decimalParaRomano(decimal) {
    algarismosRomanos[1] = "I"
    algarismosRomanos[2] = "IV"
    algarismosRomanos[3] = "V"
    algarismosRomanos[4] = "IX"
    algarismosRomanos[5] = "X"
    algarismosRomanos[6] = "XL"
    algarismosRomanos[7] = "L"
    algarismosRomanos[8] = "XC"
    algarismosRomanos[9] = "C"
    algarismosRomanos[10] = "CD"
    algarismosRomanos[11] = "D"
    algarismosRomanos[12] = "CM"
    algarismosRomanos[13] = "M"
    
    valoresDecimais[1] = 1
    valoresDecimais[2] = 4
    valoresDecimais[3] = 5
    valoresDecimais[4] = 9
    valoresDecimais[5] = 10
    valoresDecimais[6] = 40
    valoresDecimais[7] = 50
    valoresDecimais[8] = 90
    valoresDecimais[9] = 100
    valoresDecimais[10] = 400
    valoresDecimais[11] = 500
    valoresDecimais[12] = 900
    valoresDecimais[13] = 1000
    
    romano = ""
    i = 13
    while (decimal > 0) {
        if (decimal >= valoresDecimais[i]) {
            romano = romano algarismosRomanos[i]
            decimal = decimal - valoresDecimais[i]
        }
        else {
            i = i - 1
        }
    }
    return romano
}

function romanoParaDecimal(romano) {
    algarismosRomanos[1] = "I"
    algarismosRomanos[2] = "IV"
    algarismosRomanos[3] = "V"
    algarismosRomanos[4] = "IX"
    algarismosRomanos[5] = "X"
    algarismosRomanos[6] = "XL"
    algarismosRomanos[7] = "L"
    algarismosRomanos[8] = "XC"
    algarismosRomanos[9] = "C"
    algarismosRomanos[10] = "CD"
    algarismosRomanos[11] = "D"
    algarismosRomanos[12] = "CM"
    algarismosRomanos[13] = "M"
    
    valoresDecimais[1] = 1
    valoresDecimais[2] = 4
    valoresDecimais[3] = 5
    valoresDecimais[4] = 9
    valoresDecimais[5] = 10
    valoresDecimais[6] = 40
    valoresDecimais[7] = 50
    valoresDecimais[8] = 90
    valoresDecimais[9] = 100
    valoresDecimais[10] = 400
    valoresDecimais[11] = 500
    valoresDecimais[12] = 900
    valoresDecimais[13] = 1000
    
    resultado = 0
    valorAnterior = 0
    valorEncontrado = 0
    lengthRomano = length(romano)
    for (i = lengthRomano; i >= 1; i--) {
        valorEncontrado = 0
        for (valorAtual = 1; valorAtual <= 13; valorAtual++) {
            if (substr(romano, i, 1) == algarismosRomanos[valorAtual]) {
                valorEncontrado = 1
                if (valorAtual < valorAnterior) {
                    resultado = resultado - valoresDecimais[valorAtual]
                }
                else {
                    resultado = resultado + valoresDecimais[valorAtual]
                    valorAnterior = valorAtual
                }
                break
            }
        }
        if (!valorEncontrado) {
            resultado = 0
            break
        }
    }
    return resultado
}

BEGIN {
    LimiteMaximoDecimal = 3999
    LimiteMaximoRomano = "MMMCMXCIX"

    while (1) {
        print "=========================="
        print " CONVERSOR DECIMAL-ROMANO "
        print "=========================="
        print ""
        print "1 - Converter decimal para romano"
        print "2 - Converter romano para decimal"
        print "0 - Sair"
        print ""
        printf "Digite a opcao desejada: "
        getline opcao < "-"
        print ""
        if (opcao == 0) {
            break
        }
        else if (opcao == 1) {
            printf "Digite um numero decimal (ate " LimiteMaximoDecimal "): "
            getline decimal < "-"
            if (decimal < 1 || decimal > LimiteMaximoDecimal) {
                print "Valor decimal fora do limite permitido."
            }
            else {
                print "Valor em algarismo romano: " decimalParaRomano(decimal)
            }
        }
        else if (opcao == 2) {
            printf "Digite um numero romano (ate " LimiteMaximoRomano "): "
            getline romano < "-"
            romano = toupper(romano)
            if (length(romano) == 0 || romanoParaDecimal(romano) == 0) {
                print "Valor romano fora do limite permitido."
            }
            else {
                print "Valor em decimal: " romanoParaDecimal(romano)
            }
        }
        print ""
    }
}
