// GerarMatricula
import java.util.Scanner;

public class Main { // DigitoVerificadorMatricula

    public static boolean validarMatricula(String MATRICULA) {
        if (MATRICULA.length() != 7)
            return false;
        if (!Character.isDigit(MATRICULA.charAt(0)) || !Character.isDigit(MATRICULA.charAt(6)))
            return false;
        if (MATRICULA.charAt(3) != '.')
            return false;
        for (int I = 1; I <= 2; I++)
            if (!Character.isDigit(MATRICULA.charAt(I)) || !Character.isDigit(MATRICULA.charAt(I + 4)))
                return false;
        return true;
    }

    public static String removerCaractere(String CADEIA, char CARACTERE) {
        StringBuilder SB = new StringBuilder();
        for (char C : CADEIA.toCharArray())
            if (C != CARACTERE)
                SB.append(C);
        return SB.toString();
    }

    public static int mod10(String MATRICULA) {
        int[] MATRIC_INT = new int[6];
        int SOMA = 0;
        for (int I = 0; I <= 5; I++)
            MATRIC_INT[I] = Character.getNumericValue(MATRICULA.charAt(I));
        for (int I = 0; I <= 5; I++) {
            if (I % 2 != 0 && MATRIC_INT[I] * 2 > 9)
                SOMA += MATRIC_INT[I] * 2 - 9;
            else if (I % 2 != 0 && MATRIC_INT[I] * 2 <= 9)
                SOMA += MATRIC_INT[I] * 2;
            if (I % 2 == 0)
                SOMA += MATRIC_INT[I];
        }
        int DV = (SOMA / 10 + 1) * 10 - SOMA;
        return DV;
    }

    public static void main(String[] args) {

        Scanner ENTRADA = new Scanner(System.in);
        String MATRIC_CPT;
        String MATRIC_SPT;
        int DV;

        do {
            System.out.print("Informe matricula no formato 999.999: ");
            MATRIC_CPT = ENTRADA.nextLine();
            if (!validarMatricula(MATRIC_CPT)) {
                System.out.println();
                System.out.println("Matricula invalida. Tente novamente.");
                System.out.println("\n");
            }
        } while (!validarMatricula(MATRIC_CPT));
        
        MATRIC_SPT = removerCaractere(MATRIC_CPT, '.');
        DV = mod10(MATRIC_SPT);
        System.out.println();
        System.out.println("Matricula com DV = " + MATRIC_CPT + "-" + DV);
        System.out.println();
        System.out.print("Tecle <Enter> para encerrar... ");
        ENTRADA.nextLine();
        ENTRADA.close();
    }
}
