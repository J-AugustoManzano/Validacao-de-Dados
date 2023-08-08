/*
 PRNG .......: XorShift (32 bits)
 Ano ........: 2003
 Autor ......: George Marsaglia
*/

import java.util.Random;

public class Main {

    static class XorShift32State {
        int seed;
    }

    static int xorshift32(XorShift32State state) {
        int random = state.seed;
        random ^= random << 13;
        random ^= random >>> 17;
        random ^= random << 5;
        state.seed = random;
        return random & 0x7FFFFFFF; // Apenas os 31 bits mais significativos
    }

    public static void main(String[] args) {
		
        XorShift32State Xn1 = new XorShift32State();
        XorShift32State Xn2 = new XorShift32State();

        Xn1.seed = 1234;
        Xn2.seed = (int) System.currentTimeMillis();

        System.out.println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
        System.out.println("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
        System.out.println("PADRAO: XorShift (32 bits)");
        System.out.println("=============================================");
        System.out.println();
        System.out.println("      Semente: 1234       Semente: TIME");
        System.out.println("      -------------       -------------");

        for (int i = 1; i <= 10; i++) {
            System.out.printf("%19d%20d%n", xorshift32(Xn1), xorshift32(Xn2));
        }
        
    }
    
}
