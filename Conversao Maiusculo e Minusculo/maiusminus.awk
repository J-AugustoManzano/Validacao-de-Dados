#!/usr/bin/awk -f

BEGIN {
    printf "Digite um texto .....: "
    getline texto < "-"
    
    textoMaiusculo = toupper(texto)
    textoMinusculo = tolower(texto)
    
    printf "Texto em maiusculo ..: "
    print textoMaiusculo
    
    printf "Texto em minusculo ..: "
    print textoMinusculo
}
