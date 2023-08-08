/*
 PRNG .......: XorShift (64 bits)
 Ano ........: 2003
 Autor ......: George Marsaglia
*/

import java.util.Random;

public class Main {
    private static class XorShift64State {
        private long seed;

        public XorShift64State(long seed) {
            this.seed = seed;
        }
    }

    private static long xorShift64(XorShift64State state) {
        long random = state.seed;
        random ^= random << 13;
        random ^= random >>> 7;
        random ^= random << 17;
        state.seed = random;
        return random & 0x7FFFFFFFFFFFFFFFL; // Apenas os 63 bits mais significativos
    }

    public static void main(String[] args) {
        XorShift64State Xn1 = new XorShift64State(1234L);
        XorShift64State Xn2 = new XorShift64State(System.currentTimeMillis());

        System.out.println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
        System.out.println("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
        System.out.println("PADRAO: XorShift (64 bits)");
        System.out.println("=================================================");
        System.out.println();
        System.out.println("   Semente: 1234          Semente: TIME");
        System.out.println("   --------------------   --------------------");

        for (int i = 1; i <= 10; i++) {
            System.out.printf("%23d%23d%n", xorShift64(Xn1), xorShift64(Xn2));
        }
    }
}
