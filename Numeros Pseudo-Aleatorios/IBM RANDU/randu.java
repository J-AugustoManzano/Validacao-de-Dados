/**
 * PRNG .......: RANDU
 * Ano ........: Decada de 1960
 * Autor ......: IBM
 */

import java.time.Instant;

public class Main {

    private static long RANDU(long seed) {
        return (65539 * seed) % 2147483648L;
    }

    public static void main(String[] args) {
      
        long Xn1 = 1234;
        long Xn2 = Instant.now().getEpochSecond();

        System.out.println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
        System.out.println("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
        System.out.println("PADRAO: RANDU");
        System.out.println("==========================================");
        System.out.println();
        System.out.println("    Semente: 1234        Semente: TIME");
        System.out.println("    -------------        -------------");

        for (int i = 1; i <= 10; i++) {
            Xn1 = RANDU(Xn1);
            Xn2 = RANDU(Xn2);
            System.out.format("%17d        %13d%n", Xn1, Xn2);
        }
      
    }
  
}
