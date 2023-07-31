/*
 PRNG .......: Tiny Mersenne Twister (TMT)
 Ano ........: 2015 (version 1.1)
 Autor ......: Mutsuo Saito & Makoto Matsumoto
*/

package main

import (
    "fmt"
    "time"
)

type Tinymt32PRNG struct {
    status      [4]uint32
    matrixAlpha uint32
    matrixBeta  uint32
    tempCoeff   uint32
}

func tinymt32NextState(prng *Tinymt32PRNG) {
    stateX := (prng.status[0] & 0x7fffffff) ^ prng.status[1] ^ prng.status[2]
    stateX ^= stateX << 1
    stateY := prng.status[3]
    stateY ^= (stateY >> 1) ^ stateX
    prng.status[0] = prng.status[1]
    prng.status[1] = prng.status[2]
    prng.status[2] = stateX ^ (stateY << 10)
    prng.status[3] = stateY
    if (stateY & 1) != 0 {
        prng.status[1] ^= prng.matrixAlpha
        prng.status[2] ^= prng.matrixBeta
    }
}

func tinymt32Temp(prng *Tinymt32PRNG) uint32 {
    finalValue := prng.status[3]
    tempCalc := prng.status[0] + (prng.status[2] >> 8)
    finalValue ^= tempCalc
    finalValue ^= (uint32(int32(tempCalc & 1)) * prng.tempCoeff)
    return finalValue
}

func tinymt32Init(prng *Tinymt32PRNG, seed uint32) {
    prng.status[0] = seed
    prng.status[1] = prng.matrixAlpha
    prng.status[2] = prng.matrixBeta
    prng.status[3] = prng.tempCoeff
    for i := uint32(1); i <= 7; i++ {
        prng.status[i & 3] ^= i + 1812433253 * (prng.status[(i - 1) & 3] ^ (prng.status[(i - 1) & 3] >> 30))
    }
    for i := 0; i <= 7; i++ {
        tinymt32NextState(prng)
    }
}

func tinymt32Gen(prng *Tinymt32PRNG) uint32 {
    tinymt32NextState(prng)
    return tinymt32Temp(prng)
}

func main() {
    var Xn1, Xn2 uint32

    var seed1, seed2 Tinymt32PRNG

    tinymt32Init(&seed1, 1234)
    tinymt32Init(&seed2, uint32(time.Now().Unix()))

    fmt.Println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)")
    fmt.Println("PSEUDORANDOM NUMBER GENERATOR (PRNG)")
    fmt.Println("PADRAO: Tiny Mersenne Twister (TMT)")
    fmt.Println("=============================================")
    fmt.Println()
    fmt.Println("      Semente: 1234       Semente: TIME")
    fmt.Println("      -------------       -------------")

    for i := 1; i <= 10; i++ {
        Xn1 = tinymt32Gen(&seed1)
        Xn2 = tinymt32Gen(&seed2)
        fmt.Printf("%19d%20d\n", Xn1, Xn2)
    }
}
