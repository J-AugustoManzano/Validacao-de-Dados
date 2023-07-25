/*
 PRNG .......: Middle Square
 Ano ........: 1946
 Autor ......: John von Neumann
*/

import java.util.Date;

public class Main {

    public static long meanSquare(long seed) {
        seed = (seed * seed / 100) % 10000;
        return (seed + 10000) % 10000;
    }

    public static void main(String[] args) {

        long Xn1 = 1234;
        long Xn2 = new Date().getTime();

        System.out.println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
        System.out.println("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
        System.out.println("PADRAO: Middle Square");
        System.out.println("==========================================\n");
        System.out.println("    Semente: 1234        Semente: TIME");
        System.out.println("    -------------        -------------\n");

        for (int i = 1; i <= 10; i++) {
            Xn1 = meanSquare(Xn1);
            Xn2 = meanSquare(Xn2);
            System.out.format("%17d        %13d%n", Xn1, Xn2);
        }

    }

}
