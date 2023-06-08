#!/usr/bin/awk -f

function formataValor(valor, valorFormatado,    inteiro, decimal, i) {
    # Verifica se o valor possui parte decimal
    if (index(valor, ".") > 0) {
        inteiro = substr(valor, 1, index(valor, ".") - 1)
        decimal = substr(valor, index(valor, ".") + 1)
    } else {
        inteiro = valor
        decimal = "00"
    }
    # Formata a parte inteira
    valorFormatado = ""
    for (i = length(inteiro); i >= 1; i--) {
        valorFormatado = substr(inteiro, i, 1) valorFormatado
        if (i > 1 && (length(inteiro) - i + 1) % 3 == 0) {
            valorFormatado = "." valorFormatado
        }
    }
    # Concatena a parte decimal
    valorFormatado = valorFormatado "," decimal
    return valorFormatado
}

BEGIN {
    printf "Digite um valor real: "
    getline valor < "-"
    valorFormatado = formataValor(valor)
    print "Valor formatado: " valorFormatado
    exit
}
