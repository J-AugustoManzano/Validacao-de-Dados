/**
 * PRNG .......: Park-Miller
 * Ano ........: 1988
 * Autor ......: S. K. Park & K. W. Miller
*/

import java.time.Instant;

public class Main {

    public static int ParkMiller(int X) {
        X = (16807 * X) % 2147483647;
        return Math.abs(X);
    }

    public static void main(String[] args) {
      
        int Xn1, Xn2;
        int i;

        Xn1 = 1234;
        Xn2 = (int) Instant.now().getEpochSecond();

        System.out.println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
        System.out.println("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
        System.out.println("PADRAO: Park-Miller");
        System.out.println("==========================================");
        System.out.println();
        System.out.println("    Semente: 1234        Semente: TIME");
        System.out.println("    -------------        -------------");

        for (i = 1; i <= 10; i++) {
            Xn1 = ParkMiller(Xn1);
            Xn2 = ParkMiller(Xn2);
            System.out.printf("%17d        %13d%n", Xn1, Xn2);
        }
      
    }
  
}
