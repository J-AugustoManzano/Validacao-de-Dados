/**
 * PRNG: Add With Carry (AWC)
 * Ano: 1991
 * Autor: George Marsaglia
 */

public class Main {

    private static long AWCNextRandom(long Xn) {
        Xn = (Xn + 12345L) % 4294967296L;
        return Xn;
    }

    private static long AWCInitialize(long seed) {
        return seed;
    }

    public static void main(String[] args) {

        System.out.println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
        System.out.println("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
        System.out.println("PADRAO: Add With Carry");
        System.out.println("==========================================");
        System.out.println();
        System.out.println("    Semente: 1234        Semente: TIME");
        System.out.println("    -------------        -------------");

        long Xn1, Xn2;
        int i;
        long seed1, seed2;

        seed1 = 1234L;
        Xn1 = AWCInitialize(seed1);

        seed2 = System.currentTimeMillis();
        Xn2 = AWCInitialize(seed2);

        for (i = 1; i <= 10; i++) {
            Xn1 = AWCNextRandom(Xn1);
            Xn2 = AWCNextRandom(Xn2);
            System.out.printf("%17d        %13d\n", Xn1, Xn2);
        }

    }
  
}
