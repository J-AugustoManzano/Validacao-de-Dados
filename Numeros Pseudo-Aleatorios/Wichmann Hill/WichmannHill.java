/**
 * PRNG .......: Wichmann Hill
 * Ano ........: 1982
 * Autor ......: Brian A. Wichmann & David H. Hill
 */

import java.util.Date;

public class Main {

    static double WichmannHill(int[] X) {
        X[0] = (171 * X[0]) % 30269;
        return X[0] / 30269.0;
    }

    public static void main(String[] args) {

        int[] X1 = { 1234 };
        int[] X2 = { (int) new Date().getTime() };
        double Xn1, Xn2;

        System.out.println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
        System.out.println("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
        System.out.println("PADRAO: Wichmann Hill");
        System.out.println("==========================================\n");

        System.out.println("    Semente: 1234        Semente: TIME");
        System.out.println("    -------------        -------------\n");

        for (int i = 1; i <= 10; i++) {
            Xn1 = WichmannHill(X1);
            Xn2 = WichmannHill(X2);
            System.out.printf("%17.11f        %13.11f%n", Xn1, Xn2);
        }

    }

}
