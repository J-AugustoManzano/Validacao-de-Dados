/**
 * PRNG .......: Permuted Congruential Generator (PCG)
 * Ano ........: 2014
 * Autor ......: Dr. M.E. O'Neill
 */

import java.util.Date;

public class Main {

    private static int rotr32(int x, int r) {
        return (x >>> r) | (x << (-r & 31));
    }

    private static int pcg32(long seed) {
        long x = seed;
        int rotation = (int) (x >>> 59);
        x = x * 6364136223846793005L + 1442695040888963407L;
        x ^= x >>> 18;
        x = x + seed;
        return rotr32((int) (((x >>> 27) + rotation) ^ (x >>> 32)), rotation) & 0x7FFFFFFF;
    }

    private static int getTimer() {
        long millis = new Date().getTime();
        return (int) (millis & 0xFFFFFFFFL);
    }

    public static void main(String[] args) {
		
        System.out.println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
        System.out.println("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
        System.out.println("PADRAO: Permuted Congruential Generator (PCG)");
        System.out.println("=============================================");
        System.out.println();

        long Xn1 = 1234;
        long Xn2 = getTimer();

        System.out.println("      Semente: 1234       Semente: TIME");
        System.out.println("      -------------       -------------");

        for (int i = 1; i <= 10; i++) {
            int random1 = pcg32(Xn1);
            int random2 = pcg32(Xn2);
            System.out.printf("%19d", random1);
            System.out.printf("%20d%n", random2);
            Xn1 = random1;
            Xn2 = random2;
        }
        
    }
    
}
