import java.util.Scanner;

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

    private static boolean validarDamm(String NUMERO) {
        int DV = 0;
        for (int I = 0; I < NUMERO.length(); I++) {
            DV = dammTab[DV][Character.getNumericValue(NUMERO.charAt(I))];
        }
        return DV == 0;
    }

    private static String removerMascara(String NUMERO) {
        StringBuilder NUMERO_SMASC = new StringBuilder();
        boolean encontrouPrimeiroDigito = false;

        for (char caractere : NUMERO.toCharArray()) {
            if (caractere == '.') {
                encontrouPrimeiroDigito = true;
            } else if (Character.isDigit(caractere)) {
                if (!encontrouPrimeiroDigito && caractere == '0') {
                    continue;
                }
                NUMERO_SMASC.append(caractere);
            }
        }
        return NUMERO_SMASC.toString();
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        boolean entradaValida = false;
        String NUMERO, NUMERO_COM_DV, NUMERO_SEM_MASCARA_DV, NUMERO_SMASC;
        int DV;

        do {
            System.out.print("Entre matricula no formato 999.999: ");
            NUMERO = scanner.nextLine();
            System.out.println();
            if (NUMERO.length() != 7 || NUMERO.charAt(3) != '.') {
                System.out.println();
                System.out.println("Matricula invalida. Tente novamente.");
                System.out.println();
            } else {
                entradaValida = true;
            }
        } while (!entradaValida);

        NUMERO_SMASC = removerMascara(NUMERO);
        DV = gerarDamm(NUMERO_SMASC);
        System.out.println("Digito verificador: " + DV);
        System.out.println();

        entradaValida = false;
        do {
            System.out.print("Entre matricula e digito verificador no formato 999.999-9: ");
            NUMERO_COM_DV = scanner.nextLine();
            System.out.println();
            if (NUMERO_COM_DV.length() != 9 || NUMERO_COM_DV.charAt(3) != '.' || NUMERO_COM_DV.charAt(7) != '-') {
                System.out.println();
                System.out.println("Matricula invalida. Tente novamente.");
                System.out.println();
            } else {
                entradaValida = true;
            }
        } while (!entradaValida);

        NUMERO_SEM_MASCARA_DV = removerMascara(NUMERO_COM_DV);
        if (validarDamm(NUMERO_SEM_MASCARA_DV)) {
            System.out.println("Matricula valida.");
        } else {
            System.out.println("Matricula invalida.");
        }
    }
}
