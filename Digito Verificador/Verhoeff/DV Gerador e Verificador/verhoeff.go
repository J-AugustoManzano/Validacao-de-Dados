package main

import (
    "fmt"
    "strconv"
)

// Tabela de multiplicacao: d(j, k)
// k = 10 colunas
// j = 10 linhas
var verhoeffD = [][]int{
    {0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
    {1, 2, 3, 4, 0, 6, 7, 8, 9, 5},
    {2, 3, 4, 0, 1, 7, 8, 9, 5, 6},
    {3, 4, 0, 1, 2, 8, 9, 5, 6, 7},
    {4, 0, 1, 2, 3, 9, 5, 6, 7, 8},
    {5, 9, 8, 7, 6, 0, 4, 3, 2, 1},
    {6, 5, 9, 8, 7, 1, 0, 4, 3, 2},
    {7, 6, 5, 9, 8, 2, 1, 0, 4, 3},
    {8, 7, 6, 5, 9, 3, 2, 1, 0, 4},
    {9, 8, 7, 6, 5, 4, 3, 2, 1, 0},
}

// Tabela de permutacao: p(pos, num)
// num = 10 colunas
// pos =  8 linhas (mod 8)
var verhoeffP = [][]int{
    {0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
    {1, 5, 7, 6, 2, 8, 3, 0, 9, 4},
    {5, 8, 0, 3, 7, 9, 6, 1, 4, 2},
    {8, 9, 1, 6, 0, 4, 3, 5, 2, 7},
    {9, 4, 5, 3, 1, 2, 6, 8, 7, 0},
    {4, 2, 8, 6, 5, 7, 3, 9, 0, 1},
    {2, 7, 9, 3, 8, 0, 6, 4, 1, 5},
    {7, 0, 4, 6, 9, 1, 3, 2, 5, 8},
}

// Tabela de inversao: inv(j)
// j = 8 colunas
//     1 linha
var verhoeffInv = []int{0, 4, 3, 2, 1, 5, 6, 7, 8, 9}

// Gerar digito verificador no padrao Verhoeff
func gerarVerhoeff(NUMERO string) int {
    DIGITO := 0
    TAMANHO := len(NUMERO)
    for I := 0; I < TAMANHO; I++ {
        POS := (I + 1) % 8
        NUM, _ := strconv.Atoi(string(NUMERO[TAMANHO - I - 1]))
        DIGITO = verhoeffD[DIGITO][verhoeffP[POS][NUM]]
    }
    return verhoeffInv[DIGITO]
}

// Validar digito verificador no padrao Verhoeff
// Ultimo digito do numero fornecido
func validarVerhoeff(NUMERO string) bool {
    DIGITO := 0
    TAMANHO := len(NUMERO)
    for I := 0; I < TAMANHO; I++ {
        POS := I % 8
        NUM, _ := strconv.Atoi(string(NUMERO[TAMANHO - I - 1]))
        DIGITO = verhoeffD[DIGITO][verhoeffP[POS][NUM]]
    }
    return DIGITO == 0
}

// Remove a mascara do numero
func removerMascara(NUMERO string) string {
    NUMERO_SMASC := ""
    ENCONTROU_PRIMEIRO_DIGITO := false
    for _, CARACTERE := range NUMERO {
        if CARACTERE == '.' {
            ENCONTROU_PRIMEIRO_DIGITO = true
        } else if NUM, ERRO := strconv.Atoi(string(CARACTERE)); ERRO == nil {
            if !ENCONTROU_PRIMEIRO_DIGITO && NUM == 0 {
                continue
            }
            NUMERO_SMASC += string(CARACTERE)
        }
    }
    return NUMERO_SMASC
}

func main() {
  var DV int
  var entradaValida bool
  var NUMERO, NUMERO_COM_DV, NUMERO_SEM_MASCARA_DV, NUMERO_SMASC string

  entradaValida = false
  for !entradaValida {
        fmt.Print("Entre matricula no formato 999.999: ")
        fmt.Scan(&NUMERO)
        fmt.Println()
        if len(NUMERO) != 7 || NUMERO[3] != '.' {
            fmt.Println()
            fmt.Println("Matricula invalida. Tente novamente.")
            fmt.Println()
        } else {
            entradaValida = true
        }
    }

    NUMERO_SMASC = removerMascara(NUMERO)
    DV = gerarVerhoeff(NUMERO_SMASC)
    fmt.Println("Digito verificador:", DV)
    fmt.Println()

    entradaValida = false
    for !entradaValida {
        fmt.Print("Entre matricula e dígito verificador no formato 999.999-9: ")
        fmt.Scan(&NUMERO_COM_DV)
        fmt.Println()
        if len(NUMERO_COM_DV) != 9 || NUMERO_COM_DV[3] != '.' || NUMERO_COM_DV[7] != '-' {
            fmt.Println()
            fmt.Println("Matricula invalida. Tente novamente.")
            fmt.Println()
        } else {
            entradaValida = true
        }
    }

    NUMERO_SEM_MASCARA_DV = removerMascara(NUMERO_COM_DV)
    if validarVerhoeff(NUMERO_SEM_MASCARA_DV) {
        fmt.Println("Matricula valida.")
    } else {
        fmt.Println("Matricula invalida.")
    }
}
