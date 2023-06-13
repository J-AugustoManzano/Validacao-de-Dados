// ValidarMatricula
import java.util.Scanner;

public class Main {
    public static boolean validarMatricula(String MATRICULA) {
        if (MATRICULA.length() != 9)
            return false;
        if (!(Character.isDigit(MATRICULA.charAt(0))) || !(Character.isDigit(MATRICULA.charAt(1))) || !(Character.isDigit(MATRICULA.charAt(2))))
            return false;
        if (MATRICULA.charAt(3) != '.')
            return false;
        if (!(Character.isDigit(MATRICULA.charAt(4))) || !(Character.isDigit(MATRICULA.charAt(5))) || !(Character.isDigit(MATRICULA.charAt(6))))
            return false;
        if (MATRICULA.charAt(7) != '-')
            return false;
        if (!(Character.isDigit(MATRICULA.charAt(8))))
            return false;
        return true;
    }

    public static String removerCaractere(String CADEIA, char CARACTERE) {
        return CADEIA.replace(Character.toString(CARACTERE), "");
    }

    public static int mod10Check(String MATRICULA) {
        int[] MATRIC_INT = new int[6];
        int SOMA = 0;
        int DV = 0;
        for (int i = 0; i < 6; i++)
            MATRIC_INT[i] = Integer.parseInt(Character.toString(MATRICULA.charAt(i)));
        for (int i = 0; i < 6; i++) {
            if ((i + 1) % 2 == 0) {
                if (MATRIC_INT[i] * 2 > 9)
                    SOMA += MATRIC_INT[i] * 2 - 9;
                else
                    SOMA += MATRIC_INT[i] * 2;
            } else {
                SOMA += MATRIC_INT[i];
            }
        }
        DV = (10 - (SOMA % 10)) % 10;
        return DV;
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String MATRIC_CPT = "";
        String MATRIC_SPT = "";
        int[] MATRIC_INT = new int[7];
        int DVC = 0;
        int DVE = 0;

        do {
            System.out.print("Informe a matricula no formato 999.999-9: ");
            MATRIC_CPT = scanner.nextLine();

            if (!validarMatricula(MATRIC_CPT)) {
                System.out.println();
                System.out.println("Entrada invalida, tente novamente.");
                System.out.println();
                System.out.println();
            }
        } while (!validarMatricula(MATRIC_CPT));

        MATRIC_SPT = MATRIC_CPT;
        MATRIC_SPT = removerCaractere(MATRIC_SPT, '.');
        MATRIC_SPT = removerCaractere(MATRIC_SPT, '-');
        DVC = mod10Check(MATRIC_SPT);

        for (int i = 0; i < 7; i++)
            MATRIC_INT[i] = Integer.parseInt(Character.toString(MATRIC_SPT.charAt(i)));
        DVE = MATRIC_INT[6];

        System.out.println();
        if (DVC == DVE)
            System.out.println("Matricula valida.");
        else
            System.out.println("Matricula invalida.");
        System.out.println();

        System.out.print("Pressione <Enter> para encerrar... ");
        scanner.nextLine();
    }
}
