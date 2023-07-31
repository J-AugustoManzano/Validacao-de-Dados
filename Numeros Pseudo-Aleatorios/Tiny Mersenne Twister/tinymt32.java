/*
 PRNG .......: Tiny Mersenne Twister (TMT)
 Ano ........: 2015 (version 1.1)
 Autor ......: Mutsuo Saito & Makoto Matsumoto
*/

import java.util.Random;

class Tinymt32PRNG {
    private int[] status = new int[4];
    private int matrixAlpha;
    private int matrixBeta;
    private int tempCoeff;

    private void tinymt32NextState() {
        int stateX, stateY;
        stateY = status[3];
        stateX = (status[0] & 0x7fffffff) ^ status[1] ^ status[2];
        stateX ^= (stateX << 1);
        stateY ^= (stateY >> 1) ^ stateX;
        status[0] = status[1];
        status[1] = status[2];
        status[2] = stateX ^ (stateY << 10);
        status[3] = stateY;
        if ((stateY & 1) != 0) {
            status[1] ^= matrixAlpha;
            status[2] ^= matrixBeta;
        }
    }

    private int tinymt32Temp() {
        int finalValue, tempCalc;
        finalValue = status[3];
        tempCalc = status[0] + (status[2] >> 8);
        finalValue ^= tempCalc;
        finalValue ^= -((tempCalc & 1) & 0xffffffff) & tempCoeff;
        return finalValue;
    }

    public void tinymt32Init(int seed) {
        status[0] = seed;
        matrixAlpha = 0x8f7011ee;
        matrixBeta = 0xfc78ff1f;
        tempCoeff = 0x3793fdff;
        for (int i = 1; i <= 7; i++) {
            status[i & 3] ^= i + 1812433253 * (status[(i - 1) & 3] ^ (status[(i - 1) & 3] >>> 30));
        }
        for (int i = 0; i < 7; i++) {
            tinymt32NextState();
        }
    }

    public int tinymt32Gen() {
        tinymt32NextState();
        return tinymt32Temp();
    }
}

public class Main {
    public static void main(String[] args) {
        Tinymt32PRNG seed1 = new Tinymt32PRNG();
        Tinymt32PRNG seed2 = new Tinymt32PRNG();

        seed1.tinymt32Init(1234);
        seed2.tinymt32Init((int) (System.currentTimeMillis() / 1000L));

        System.out.println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
        System.out.println("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
        System.out.println("PADRAO: Tiny Mersenne Twister (TMT)");
        System.out.println("==========================================");
        System.out.println();
        System.out.println("    Semente: 1234        Semente: TIME");
        System.out.println("    -------------        -------------");

        for (int i = 1; i <= 10; i++) {
            int Xn1 = seed1.tinymt32Gen();
            int Xn2 = seed2.tinymt32Gen();
            System.out.printf("%17d%21d%n", Xn1 & 0xffffffffL, Xn2 & 0xffffffffL);
        }
    }
}
