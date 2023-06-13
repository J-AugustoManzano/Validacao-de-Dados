import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

public class Main {

    public static String formataMatricula(int MATRICULA) {
        return String.format("%06d", MATRICULA);
    }

    public static int mod10(String MATRICULA) {
        int SOMA = 0;
        for (int I = 0; I <= 5; I++) {
            int DIGITO = Character.getNumericValue(MATRICULA.charAt(I));
            if (I % 2 != 0 && DIGITO * 2 > 9) {
                SOMA += DIGITO * 2 - 9;
            } else if (I % 2 != 0 && DIGITO * 2 <= 9) {
                SOMA += DIGITO * 2;
            } else {
                SOMA += DIGITO;
            }
        }
        int DV = (SOMA % 10 == 0) ? 0 : 10 - SOMA % 10;
        return DV;
    }

    public static void main(String[] args) {
        String ARQUIVO = "numeros.txt";

        try (PrintWriter writer = new PrintWriter(new FileWriter(ARQUIVO))) {
            System.out.println("GERADOR DE NUMEROS DE MATRICULA DE 000.000 ATE 999.999 COM \"DV\"");
            System.out.println("Padrao: Modulo 10");
            System.out.println("---------------------------------------------------------------");
            System.out.println();

            System.out.print("Aguarde ARQUIVO sendo gerado... ");

            for (int I = 0; I <= 999999; I++) {
                String MATRICULA = formataMatricula(I);
                int DV = mod10(MATRICULA);
                writer.println(MATRICULA.substring(0, 3) + "." + MATRICULA.substring(3) + "-" + DV);
            }

            System.out.println("\n\nSUCESSO: Arquivo gerado.\n");
        } catch (IOException e) {
            System.err.println("Erro ao abrir o ARQUIVO.");
            System.err.println("Programa encerrado.");
        }
    }
}
