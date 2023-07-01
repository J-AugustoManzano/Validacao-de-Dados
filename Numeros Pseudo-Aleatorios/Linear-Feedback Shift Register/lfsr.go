/**
 * PRNG .......: Linear-Feedback Shift Register (LFSR)
 * Ano ........: 1965
 * Autor ......: R. C. Tausworthe
 */

package main

import (
    "fmt"
    "time"
)

func lfsr(state []int64) float64 {
    state[0] = (state[0] >> 1) ^ (0xB4BCD35C * (state[0] & 1))
    return float64(state[0]) / 4294967296.0
}

func main() {

    Xn1 := []int64{0x1234}
    Xn2 := []int64{time.Now().UnixNano() & 0xFFFFFFFF}

    fmt.Println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
    fmt.Println("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
    fmt.Println("PADRAO: Linear-Feedback Shift Register")
    fmt.Println("==========================================\n")
    fmt.Println("    Semente: 1234        Semente: TIME")
    fmt.Println("    -------------        -------------\n")

    for i := 1; i <= 10; i++ {
        fmt.Printf("%17.11f        %13.11f\n", lfsr(Xn1), lfsr(Xn2))
    }

}
