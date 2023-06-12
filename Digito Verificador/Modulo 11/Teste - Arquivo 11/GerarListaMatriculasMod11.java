import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

public class Main {

    static void removerCaractere(char[] CADEIA, char CARACTERE) {
        int POS1 = 0;
        int POS2 = 0;
        while (CADEIA[POS1] != 0) {
            CADEIA[POS2] = CADEIA[POS1];
            POS2 += (CADEIA[POS2] != CARACTERE) ? 1 : 0;
            POS1 += 1;
        }
        CADEIA[POS2] = 0;
    }

    static char mod11(char[] MATRIC_CPT) {
        char[] MATRIC_SPT = new char[8];
        int[] MATRIC_INT = new int[6];
        int SOMA = 0;
        char DV = ' ';
        System.arraycopy(MATRIC_CPT, 0, MATRIC_SPT, 0, MATRIC_SPT.length);
        removerCaractere(MATRIC_SPT, '.');
        for (int I = 0; I <= 5; I++)
            MATRIC_INT[I] = MATRIC_SPT[I] - 48;
        for (int I = 0; I <= 5; I++)
            SOMA += MATRIC_INT[I] * (7 - I);
        if ((SOMA % 11) == 0)
            DV = (char) 48; // DV = 0
        else if ((SOMA % 11) == 1)
            DV = (char) 88; // DV = X
        else if ((SOMA % 11) == 10)
            DV = (char) 49; // DV = 1
        else
            DV = (char) (11 - (SOMA % 11) + 48);
        return DV;
    }

    public static void main(String[] args) {
        char[] MATRICULA = new char[12];
        PrintWriter ARQUIVO = null;
        try {
            ARQUIVO = new PrintWriter(new FileWriter("numeros.txt"));
        } catch (IOException e) {
            System.err.println("Erro ao abrir o arquivo.");
            System.out.println("Programa encerrado.");
            System.out.println();
            return;
        }

        System.out.println("GERADOR DE NUMEROS DE MATRICULA DE 000.000 ATE 999.999 COM \"DV\"");
        System.out.println("Padrao: Modulo 11");
        System.out.println("---------------------------------------------------------------");
        System.out.println();

        System.out.print("Aguarde arquivo sendo gerado... ");

        for (int I = 0; I <= 999999; I++) {
            String MATRICULA_STR = String.format("%06d", I);
            MATRICULA_STR.getChars(0, MATRICULA_STR.length(), MATRICULA, 0);
            char DV = mod11(MATRICULA);
            String MATRICULA_FORMATADA = String.format("%s.%s-%c", MATRICULA_STR.substring(0, 3), MATRICULA_STR.substring(3), DV);
            ARQUIVO.println(MATRICULA_FORMATADA);
        }

        ARQUIVO.close();

        System.out.println("\n\nSUCESSO: Arquivo gerado.\n");
    }
}
