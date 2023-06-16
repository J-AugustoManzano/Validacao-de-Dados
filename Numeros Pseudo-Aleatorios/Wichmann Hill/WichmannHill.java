/*
 * PRNG .......: Wichmann Hill
 * Ano ........: 1982
 * Autor ......: Brian A. Wichmann & David H. Hill
 */
 
public class Main {
	
    public static int WichmannHill(int X) {
        X = (171 * X) % 30269;
        return Math.abs(X);
    }

    public static void main(String[] args) {

        System.out.println("GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)");
        System.out.println("PSEUDORANDOM NUMBER GENERATOR (PRNG)");
        System.out.println("PADRAO: Wichmann Hill");
        System.out.println("==========================================" + "\n");

        System.out.println("    Semente: 1234        Semente: TIME");
        System.out.println("    -------------        -------------");

        int[] semente1234 = new int[10];
        double[] sementeTime = new double[10];
        int X1, X2;

        X1 = 1234;
        for (int i = 0; i <= 9; i++) {
            X1 = WichmannHill(X1);
            semente1234[i] = X1;
        }

        X2 = (int) System.currentTimeMillis() / 1000;
        for (int i = 0; i <= 9; i++) {
            X2 = WichmannHill(X2 + i);
            sementeTime[i] = X2 / 30269.0;
        }

        for (int i = 0; i <= 9; i++) {
            System.out.printf("%17.11f        %13.11f%n", semente1234[i] / 30269.0, sementeTime[i]);
        }
    }
    
}
