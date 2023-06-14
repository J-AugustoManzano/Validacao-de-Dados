import java.util.Scanner;

public class Main {
    
    // Tabela de multiplicacao >>> d(j, k)
    // k = 10 colunas
    // j = 10 linhas
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

    // Tabela de permutacao >>> p(pos, num)
    // num = 10 colunas
    // pos =  8 linhas (mod 8)
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

    // Tabela de inversao >>> inv(j)
    // j = 8 colunas
    //     1 linha
    static int[] verhoeffInv = {0, 4, 3, 2, 1, 5, 6, 7, 8, 9};

    // Gerar digito verificador no padrao Verhoeff
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

    // Validar digito verificador no padrao Verhoeff
    // Ultimo digito do numero fornecido
    static boolean validarVerhoeff(String NUMERO) {
        int DIGITO, POS, NUM;
        int TAMANHO = NUMERO.length();
        DIGITO = 0;
        for (int I = 0; I < TAMANHO; I++) {
            POS = I % 8;
            NUM = NUMERO.charAt(TAMANHO - I - 1) - 48;
            DIGITO = verhoeffD[DIGITO][verhoeffP[POS][NUM]];
        }
        return (DIGITO == 0);
    }
    
    // Remove a mascara do numero
    static String removerMascara(String NUMERO) {
        StringBuilder NUMERO_SMASC = new StringBuilder();
        boolean ENCONTROU_PRIMEIRO_DIGITO = false;
        for (char CARACTERE : NUMERO.toCharArray()) {
            if (CARACTERE == '.') {
                ENCONTROU_PRIMEIRO_DIGITO = true;
            } else if (Character.isDigit(CARACTERE)) {
                if (!ENCONTROU_PRIMEIRO_DIGITO && CARACTERE == 48)
                    continue;
                NUMERO_SMASC.append(CARACTERE);
            }
        }
        return NUMERO_SMASC.toString();
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int DV;
        boolean entradaValida;
        String NUMERO;
        String NUMERO_COM_DV;
        String NUMERO_SEM_MASCARA_DV;
        String NUMERO_SMASC;

        entradaValida = false;
        do {
            System.out.print("Entre matricula no formato 999.999: ");
            NUMERO = scanner.next();
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
        DV = gerarVerhoeff(NUMERO_SMASC);
        System.out.println("Digito verificador: " + DV);
        System.out.println();

        entradaValida = false;
        do {
            System.out.print("Entre matricula e digito verificador no formato 999.999-9: ");
            NUMERO_COM_DV = scanner.next();
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
        if (validarVerhoeff(NUMERO_SEM_MASCARA_DV)) {
            System.out.println("Matricula valida.");
        } else {
            System.out.println("Matricula invalida.");
        }
    }
}
