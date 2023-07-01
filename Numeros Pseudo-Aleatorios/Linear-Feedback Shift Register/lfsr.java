/*
   PRNG .......: Linear-Feedback Shift Register (LFSR)
   Ano ........: 1965
   Autor ......: R. C. Tausworthe
*/

import java.util.Date;

public class Main {

    private static double lfsr(long[] state) {
        state[0] = (state[0] >> 1) ^ (0xB4BCD35CL * (state[0] & 1));
        return (double) state[0] / 4294967296.0;
    }

    public static void main(String[] args) {
      
        long[] Xn1 = {0x1234L};
        long[] Xn2 = {(new Date().getTime() & 0xFFFFFFFFL)};
        int i;

        System.out.println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
        System.out.println("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
        System.out.println("PADRAO: Linear-Feedback Shift Register");
        System.out.println("==========================================\n");
        System.out.println("    Semente: 1234        Semente: TIME");
        System.out.println("    -------------        -------------\n");

        for (i = 1; i <= 10; i++) {
            System.out.printf("%17.11f        %13.11f\n", lfsr(Xn1), lfsr(Xn2));
        }
      
    }
  
}
