/**
 * PRNG .......: Blum-Blum-Shub
 * Ano ........: 1986
 * Autor ......: L. Blum, M. Blum & M. Shub
 */

public class Main {

    private static int blumBlumShub(int X) {
        X = (int) ((X * (long) X) % 2467246241L);
        return X & 0x7FFFFFFF; // Manter apenas os bits positivos
    }

    private static final int[] Xn1 = new int[10];
    private static final int[] Xn2 = new int[10];
    private static int X1, X2;
    
    public static void main(String[] args) {
		
        System.out.println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
        System.out.println("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
        System.out.println("PADRAO: Blum-Blum-Shub");
        System.out.println("==========================================\n");
        System.out.println("    Semente: 1234        Semente: TIME");
        System.out.println("    -------------        -------------");

        X1 = 1234;
        X2 = (int) (System.currentTimeMillis() / 1000);

        for (int i = 0; i <= 9; i++) {
            X1 = blumBlumShub(X1);
            X2 = blumBlumShub(X2);
            Xn1[i] = X1;
            Xn2[i] = X2;
            System.out.printf("%17d        %13d\n", Xn1[i], Xn2[i]);
        }
        
    }

}
