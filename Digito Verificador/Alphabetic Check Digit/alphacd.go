package main

import (
    "fmt"
    "strings"
)

func AlphaCD(valor string) byte {
    soma := 0
    proximo := 0
    var caractere byte
    digitos := make([]int, len(valor))

    for i := 0; i < len(valor); i++ {
        caractere = strings.ToUpper(string(valor[i]))[0]
        if caractere == ' ' || caractere == '.' || caractere == '-' {
            continue
        }
        if caractere >= '0' && caractere <= '9' {
            digitos[len(valor)-i-1] = int(caractere - '0')
        } else if caractere >= 'A' && caractere <= 'Z' {
            digitos[len(valor)-i-1] = (int(caractere-'A'+1) % 9)
        }
        if (i+1)%2 == 0 {
            digitos[len(valor)-i-1] *= 2
            if digitos[len(valor)-i-1] >= 10 {
                digitos[len(valor)-i-1] = digitos[len(valor)-i-1]/10 + digitos[len(valor)-i-1]%10
            }
        }
        soma += digitos[len(valor)-i-1]
    }
    if soma%10 == 0 {
        proximo = soma
    } else {
        proximo = (soma/10 + 1) * 10
    }
    return byte((proximo - soma) + '0')
}

func TrimString(str string) string {
    str = strings.TrimLeft(str, " ")
    if len(str) > 0 {
        str = strings.TrimRight(str, " ")
        return str
    } else {
        return ""
    }
}

func main() {
    var entrada, matricula, digitoVerificador string

    fmt.Println("ALPHABETIC CHECK DIGIT")
    fmt.Println("======================")
    fmt.Println()

    fmt.Print("Entre com a matricula alfanumerica (tamanho livre): ")
    fmt.Scanln(&entrada)
    fmt.Printf("Digito verificador para %s = %c\n", entrada, AlphaCD(entrada))
    fmt.Println()

    fmt.Print("Entre com a matricula e o digito verificador (juntos): ")
    fmt.Scanln(&matricula)
    digitoVerificador = matricula[len(matricula)-1:]
    matricula = TrimString(matricula[:len(matricula)-1])

    if AlphaCD(matricula) == digitoVerificador[0] {
        fmt.Println("Numero valido.")
    } else {
        fmt.Println("Numero invalido.")
    }
}
