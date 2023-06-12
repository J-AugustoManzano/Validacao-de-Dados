import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

public class Main {

    public static String formataMatricula(int matricula) {
        return String.format("%06d", matricula);
    }

    public static int mod10(String matricula) {
        int soma = 0;
        for (int i = 0; i < 6; i++) {
            int digito = Character.getNumericValue(matricula.charAt(i));
            if (i % 2 != 0 && digito * 2 > 9) {
                soma += digito * 2 - 9;
            } else if (i % 2 != 0 && digito * 2 <= 9) {
                soma += digito * 2;
            } else {
                soma += digito;
            }
        }
        int dv = (soma % 10 == 0) ? 0 : 10 - soma % 10;
        return dv;
    }

    public static void main(String[] args) {
        String arquivo = "numeros.txt";

        try (PrintWriter writer = new PrintWriter(new FileWriter(arquivo))) {
            System.out.println("GERADOR DE NUMEROS DE MATRICULA DE 000.000 ATE 999.999 COM \"DV\"");
            System.out.println("Padrao: Modulo 10");
            System.out.println("---------------------------------------------------------------");
            System.out.println();

            System.out.print("Aguarde arquivo sendo gerado... ");

            for (int i = 0; i <= 999999; i++) {
                String matricula = formataMatricula(i);
                int dv = mod10(matricula);
                writer.println(matricula.substring(0, 3) + "." + matricula.substring(3) + "-" + dv);
            }

            System.out.println("\n\nSUCESSO: Arquivo gerado.\n");
        } catch (IOException e) {
            System.err.println("Erro ao abrir o arquivo.");
            System.err.println("Programa encerrado.");
        }
    }
}
