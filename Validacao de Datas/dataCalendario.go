package main

import (
    "bufio"
    "fmt"
    "os"
    "strconv"
    "strings"
)

type Data struct {
    dia int
    mes int
    ano int
    ok  bool
}

func StrToInt(cadeia string) int {
    valor, _ := strconv.Atoi(cadeia)
    return valor
}

func IntToStr(valor int) string {
    return strconv.Itoa(valor)
}

func Formatar(valor, digitos int) string {
    valorCadeia := IntToStr(valor)
    for len(valorCadeia) < digitos {
        valorCadeia = "0" + valorCadeia
    }
    return valorCadeia
}

func anoBissexto(data Data) bool {
    if data.ano%400 == 0 {
        return true
    } else if data.ano%4 == 0 && data.ano%100 != 0 {
        return true
    } else {
        return false
    }
}

func ultimoDiaMes(data Data) int {
    if data.mes == 2 {
        if anoBissexto(data) {
            return 29
        } else {
            return 28
        }
    }
    if data.mes <= 7 {
        if data.mes%2 != 0 {
            return 31
        } else {
            return 30
        }
    }
    if data.mes%2 != 0 {
        return 30
    } else {
        return 31
    }
}

func validaData(data *Data) {
    data.ok = (data.ano >=    1) &&
              (data.ano <= 9999) &&
              (data.mes >=    1) &&
              (data.mes <=   12) &&
              (data.dia >=    1) &&
              (data.dia <= ultimoDiaMes(*data)) &&
            !((data.ano == 1582) &&
              (data.mes ==   10) &&
              (data.dia >=    5) &&
              (data.dia <=   14))
}

func alteraData(data *Data, dia, mes, ano int) {
    data.dia = dia
    data.mes = mes
    data.ano = ano
    validaData(data)
}

func mostraData(data Data) {
    if data.ok {
        fmt.Printf("%s/%s/%s\n", Formatar(data.dia, 2), Formatar(data.mes, 2), Formatar(data.ano, 4))
    } else {
        fmt.Println("**/**/****")
    }
}

func main() {
    fmt.Println("TESTE DE VALIDACAO DE DATA (CALENDARIO)")
    fmt.Println("=======================================")
    fmt.Println("")

    reader := bufio.NewReader(os.Stdin)
    fmt.Print("Entre data no formato DD/MM/AAAA: ")
    DTS, _ := reader.ReadString('\n')
    DTS = strings.TrimSpace(DTS)

    DIA := StrToInt(DTS[0:2])
    MES := StrToInt(DTS[3:5])
    ANO := StrToInt(DTS[6:10])

    data := Data{}
    alteraData(&data, DIA, MES, ANO)

    fmt.Print("Data informada: ")
    mostraData(data)

    fmt.Println("")
    fmt.Print("Tecle <Enter> para encerrar... ")
    reader.ReadString('\n')
}
