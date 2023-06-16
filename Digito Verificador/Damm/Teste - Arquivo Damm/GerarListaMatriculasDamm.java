import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

public class Main {

    private static int[][] dammTab = {
            {0, 3, 1, 7, 5, 9, 8, 6, 4, 2},
            {7, 0, 9, 2, 1, 5, 4, 8, 6, 3},
            {4, 2, 0, 6, 8, 7, 1, 3, 5, 9},
            {1, 7, 5, 0, 9, 8, 3, 4, 2, 6},
            {6, 1, 2, 3, 0, 4, 5, 9, 7, 8},
            {3, 6, 7, 4, 2, 0, 9, 5, 8, 1},
            {5, 8, 6, 9, 7, 2, 0, 1, 3, 4},
            {8, 9, 4, 5, 3, 6, 2, 0, 1, 7},
            {9, 4, 3, 8, 6, 1, 7, 2, 0, 5},
            {2, 5, 8, 1, 4, 3, 6, 7, 9, 0}
    };

    private static int gerarDamm(String NUMERO) {
        int DV = 0;
        for (int I = 0; I < NUMERO.length(); I++) {
            DV = dammTab[DV][Character.getNumericValue(NUMERO.charAt(I))];
        }
        return DV;
    }

    public static String formataMatricula(int MATRICULA) {
        return String.format("%06d", MATRICULA);
    }

    public static void main(String[] args) {
        String ARQUIVO = "numeros.txt";
        int I, DV;

        try (PrintWriter writer = new PrintWriter(new FileWriter(ARQUIVO))) {
            System.out.println("GERADOR DE NUMEROS DE MATRICULA DE 000.000 ATE 999.999 COM \"DV\"");
            System.out.println("Padrao: Damm");
            System.out.println("---------------------------------------------------------------");
            System.out.println();

            System.out.print("Aguarde ARQUIVO sendo gerado... ");

            for (I = 0; I <= 999999; I++) {
                String MATRICULA = formataMatricula(I);
                DV = gerarDamm(MATRICULA);
                writer.println(MATRICULA.substring(0, 3) + "." + MATRICULA.substring(3) + "-" + DV	);
            }

            System.out.println("\n\nSUCESSO: Arquivo gerado.\n");
        } catch (IOException e) {
            System.err.println("Erro ao abrir o ARQUIVO.");
            System.err.println("Programa encerrado.");
        }
    }
}
