/*
 PRNG .......: SplitMix64
 Ano ........: 2015
 Autor ......: Sebastiano Vigna
*/

// Fundamentado: rosettacode.org/wiki/Pseudo-random_numbers/Splitmix64

import java.util.Random;

public class Main {
	
    private static class SplitMix64 {
        private long state;

        public SplitMix64(long seed) {
            state = seed;
        }

        private long nextInt() {
            state += 0x9e3779b97f4a7c15L;
            long z = state;
            z = (z ^ (z >> 30)) * 0xbf58476d1ce4e5b9L;
            z = (z ^ (z >> 27)) * 0x94d049bb133111ebL;
            return z ^ (z >> 31);
        }

        public double nextFloat() {
            return ((double) (nextInt() >> 11)) / (1L << 53);
        }
    }

    public static void main(String[] args) {
		
        SplitMix64 Xn1 = new SplitMix64(1234);
        SplitMix64 Xn2 = new SplitMix64(System.currentTimeMillis());

        System.out.println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
        System.out.println("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
        System.out.println("PADRAO: SplitMix64");
        System.out.println("===================================================");
        System.out.println();

        System.out.println("  Semente: 1234 (int)        Semente: TIME (int)");
        System.out.println("  --------------------       --------------------");
        for (int i = 1; i <= 5; i++) {
            System.out.printf("%22d %26d%n", Xn1.nextInt(), Xn2.nextInt());
        }
        System.out.println();

        System.out.println("  Semente: 1234 (real)       Semente: TIME (real)");
        System.out.println("  --------------------       --------------------");
        for (int i = 1; i <= 5; i++) {
            System.out.printf("%22.18f %26.18f%n", Xn1.nextFloat(), Xn2.nextFloat());
        }
        
    }
    
}
