import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

public class Main {

    static int[][] verhoeffD = {
        {0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
        {1, 2, 3, 4, 0, 6, 7, 8, 9, 5},
        {2, 3, 4, 0, 1, 7, 8, 9, 5, 6},
        {3, 4, 0, 1, 2, 8, 9, 5, 6, 7},
        {4, 0, 1, 2, 3, 9, 5, 6, 7, 8},
        {5, 9, 8, 7, 6, 0, 4, 3, 2, 1},
        {6, 5, 9, 8, 7, 1, 0, 4, 3, 2},
        {7, 6, 5, 9, 8, 2, 1, 0, 4, 3},
        {8, 7, 6, 5, 9, 3, 2, 1, 0, 4},
        {9, 8, 7, 6, 5, 4, 3, 2, 1, 0}
    };

    static int[][] verhoeffP = {
        {0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
        {1, 5, 7, 6, 2, 8, 3, 0, 9, 4},
        {5, 8, 0, 3, 7, 9, 6, 1, 4, 2},
        {8, 9, 1, 6, 0, 4, 3, 5, 2, 7},
        {9, 4, 5, 3, 1, 2, 6, 8, 7, 0},
        {4, 2, 8, 6, 5, 7, 3, 9, 0, 1},
        {2, 7, 9, 3, 8, 0, 6, 4, 1, 5},
        {7, 0, 4, 6, 9, 1, 3, 2, 5, 8}
    };

    static int[] verhoeffInv = {0, 4, 3, 2, 1, 5, 6, 7, 8, 9};

    static int gerarVerhoeff(String NUMERO) {
        int DIGITO, POS, NUM;
        int TAMANHO = NUMERO.length();
        DIGITO = 0;
        for (int I = 0; I < TAMANHO; I++) {
            POS = (I + 1) % 8;
            NUM = NUMERO.charAt(TAMANHO - I - 1) - 48; // ASCII 48 = '0'
            DIGITO = verhoeffD[DIGITO][verhoeffP[POS][NUM]];
        }
        return verhoeffInv[DIGITO];
    }

    public static String formataMatricula(int MATRICULA) {
        return String.format("%06d", MATRICULA);
    }

    public static void main(String[] args) {
        String ARQUIVO = "numeros.txt";
        int I, DV;

        try (PrintWriter writer = new PrintWriter(new FileWriter(ARQUIVO))) {
            System.out.println("GERADOR DE NUMEROS DE MATRICULA DE 000.000 ATE 999.999 COM \"DV\"");
            System.out.println("Padrao: Verhoeff");
            System.out.println("---------------------------------------------------------------");
            System.out.println();

            System.out.print("Aguarde ARQUIVO sendo gerado... ");

            for (I = 0; I <= 999999; I++) {
                String MATRICULA = formataMatricula(I);
                DV = gerarVerhoeff(MATRICULA);
                writer.println(MATRICULA.substring(0, 3) + "." + MATRICULA.substring(3) + "-" + DV	);
            }

            System.out.println("\n\nSUCESSO: Arquivo gerado.\n");
        } catch (IOException e) {
            System.err.println("Erro ao abrir o ARQUIVO.");
            System.err.println("Programa encerrado.");
        }
    }
}
