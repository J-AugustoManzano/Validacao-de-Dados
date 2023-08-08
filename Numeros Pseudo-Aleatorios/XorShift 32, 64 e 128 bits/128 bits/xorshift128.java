/*
 PRNG .......: XorShift (128 bits)
 Ano ........: 2003
 Autor ......: George Marsaglia
*/

import java.util.Date;

class XorShift128State {
    long seed;
}

public class Main {
    static long xorshift128(XorShift128State state) {
        long random = state.seed;
        random ^= random << 11;
        random ^= random >> 8;
        random ^= random << 19;
        state.seed = random;
        return random & 0x7FFFFFFFFFFFFFFFL; 
    }

    public static void main(String[] args) {
        XorShift128State Xn1 = new XorShift128State();
        XorShift128State Xn2 = new XorShift128State();

        Xn1.seed = 1234;
        Xn2.seed = new Date().getTime();

        System.out.println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
        System.out.println("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
        System.out.println("PADRAO: XorShift (128 bits)");
        System.out.println("=================================================");
        System.out.println("");
        System.out.println("   Semente: 1234          Semente: TIME");
        System.out.println("   --------------------   --------------------");

        for (int i = 1; i <= 10; i++) {
            System.out.printf("%23d%23d%n", xorshift128(Xn1), xorshift128(Xn2));
        }
    }
}
