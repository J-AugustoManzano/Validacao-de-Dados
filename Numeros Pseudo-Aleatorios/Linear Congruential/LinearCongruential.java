import java.util.Date;

public class Main {

    static double linearCongruential(long[] seed) {
        final long M = 2147483647;
        seed[0] = (1664525 * seed[0] + 1013904223) % M;
        return (double) seed[0] / M;
    }

    public static void main(String[] args) {
        long[] Xn1 = { 1234 };
        long[] Xn2 = { new Date().getTime() };

        System.out.println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
        System.out.println("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
        System.out.println("PADRAO: Linear Congruential");
        System.out.println("==========================================");
        System.out.println();
        System.out.println("    Semente: 1234        Semente: TIME");
        System.out.println("    -------------        -------------");

        for (int i = 1; i <= 10; i++) {
            System.out.printf("%17.11f        %13.11f%n",
                    linearCongruential(Xn1), linearCongruential(Xn2));
        }

    }

}
