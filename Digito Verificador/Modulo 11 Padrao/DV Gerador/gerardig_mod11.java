import java.util.Scanner;

public class Main {
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
        return CADEIA.replace(Character.toString(CARACTERE), "");
    }

    public static char mod11(String MATRIC_CPT) {
        String MATRIC_SPT = MATRIC_CPT;
        MATRIC_SPT = removerCaractere(MATRIC_SPT, '.');
        int[] MATRIC_INT = new int[6];
        for (int I = 0; I <= 5; I++)
            MATRIC_INT[I] = MATRIC_SPT.charAt(I) - 48;
        int SOMA = 0;
        for (int I = 0; I <= 5; I++)
            SOMA += MATRIC_INT[I] * (7 - I);
        char DV;
        if ((SOMA % 11) == 0)
            DV = '0';
        else if ((SOMA % 11) == 1)
            DV = 'X';
        else if ((SOMA % 11) == 10)
            DV = '1';
        else
            DV = (char) ((11 - (SOMA % 11)) + 48);
        return DV;
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String MATRICULA;
        char DV;

        do {
            System.out.print("Informe matricula no formato 999.999: ");
            MATRICULA = scanner.nextLine();
            if (!validarMatricula(MATRICULA)) {
                System.out.println();
                System.out.println("Matricula invalida. Tente novamente.");
                System.out.println();
            }
        } while (!validarMatricula(MATRICULA));

        DV = mod11(MATRICULA);
        System.out.println();
        System.out.printf("Matricula com DV = %s-%c%n", MATRICULA, DV);
        System.out.println();
        System.out.print("Tecle <Enter> para encerrar... ");
        scanner.nextLine();
    }
}
