import java.util.Scanner;

public class Main {
    public static boolean isDigit(char CARACTERE) {
        return CARACTERE >= '0' && CARACTERE <= '9';
    }

    public static boolean validarMatricula(String MATRICULA) {
        int I;
        if (MATRICULA.length() != 9) return false;
        for (I = 0; I <= 2; I++) {
            if (!isDigit(MATRICULA.charAt(I))) return false;
        }
        if (MATRICULA.charAt(3) != '.') return false;
        for (I = 4; I <= 6; I++) {
            if (!isDigit(MATRICULA.charAt(I))) return false;
        }
        if (MATRICULA.charAt(7) != '-') return false;
        if (!isDigit(MATRICULA.charAt(8))) return false;
        return true;
    }

    public static String removerCaractere(String CADEIA, char CARACTERE) {
        StringBuilder NOVACADEIA = new StringBuilder();
        for (int I = 0; I < CADEIA.length(); I++) {
            if (CADEIA.charAt(I) != CARACTERE) {
                NOVACADEIA.append(CADEIA.charAt(I));
            }
        }
        return NOVACADEIA.toString();
    }

    public static int mod11Check(String MATRICULA) {
        int[] MATRIC_INT = new int[7];
        int DV, I;
        for (I = 0; I <= 6; I++)
            MATRIC_INT[I] = MATRICULA.charAt(I) - '0';
        int SOMA = 0;
        for (I = 0; I <= 5; I++) {
            SOMA += MATRIC_INT[I] * (7 - I);
        }
        DV = (11 - SOMA % 11) % 10;
        return DV;
    }

    public static void main(String[] args) {
        Scanner ENTRADA = new Scanner(System.in);
        String MATRIC_CPT;
        String MATRIC_SPT;
        int DVC, DVE;

        do {
            System.out.print("Informe matricula no formato 999.999-9: ");
            MATRIC_CPT = ENTRADA.nextLine();
            if (!validarMatricula(MATRIC_CPT)) {
                System.out.println("\nMatricula invalida. Tente novamente.\n");
            }
        } while (!validarMatricula(MATRIC_CPT));

        MATRIC_SPT = MATRIC_CPT;
        MATRIC_SPT = removerCaractere(MATRIC_SPT, '.');
        MATRIC_SPT = removerCaractere(MATRIC_SPT, '-');
        DVC = mod11Check(MATRIC_SPT);
        int[] MATRIC_INT = new int[7];
        for (int I = 0; I <= 5; I++) {
            MATRIC_INT[I] = MATRIC_SPT.charAt(I) - '0';
        }
        DVE = MATRIC_SPT.charAt(6) - '0';
        System.out.println();
        if (DVC == DVE)
            System.out.println("Numero de matricula valido");
        else
            System.out.println("Numero de matricula invalido");
        System.out.println();
        System.out.print("Tecle <Enter> para encerrar... ");
        ENTRADA.nextLine();
        ENTRADA.close();
    }
}
