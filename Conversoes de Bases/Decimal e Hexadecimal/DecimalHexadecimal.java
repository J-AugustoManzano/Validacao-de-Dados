import java.util.Scanner;

public class Main { // DecimalHexadecimal
    static final int LimiteMaximoDecimal = 2147483647;
    static final String LimiteMaximoHexadecimal = "7FFFFFFF";

    public static String DecimalParaHexadecimal(int decimal) {
        String hexadecimal = "";
        do {
            int resto = decimal % 16;
            if (resto >= 0 && resto <= 9)
                hexadecimal = (char) (resto + '0') + hexadecimal;
            else
                hexadecimal = (char) (resto - 10 + 'A') + hexadecimal;
            decimal = decimal / 16;
        } while (decimal != 0);
        return hexadecimal;
    }

    public static int HexadecimalParaDecimal(String hexadecimal) {
        int potencia = 0;
        int decimal = 0;
        while (!hexadecimal.isEmpty()) {
            char digito = Character.toUpperCase(hexadecimal.charAt(hexadecimal.length() - 1));
            if (digito >= '0' && digito <= '9')
                decimal += (digito - '0') * Math.pow(16, potencia);
            else if (digito >= 'A' && digito <= 'F')
                decimal += (digito - 'A' + 10) * Math.pow(16, potencia);
            hexadecimal = hexadecimal.substring(0, hexadecimal.length() - 1);
            potencia++;
        }
        return decimal;
    }

    public static boolean IsValidHexadecimal(String hexadecimal) {
        for (int i = 0; i < hexadecimal.length(); i++) {
            char digito = Character.toUpperCase(hexadecimal.charAt(i));
            if (!(digito >= '0' && digito <= '9' || digito >= 'A' && digito <= 'F'))
                return false;
        }
        return true;
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int opcao;
        int decimal;
        String hexadecimal;
        do {
            System.out.println("===============================");
            System.out.println(" CONVERSOR DECIMAL-HEXADECIMAL ");
            System.out.println("===============================");
            System.out.println();
            System.out.println("1 - Converter decimal para hexadecimal");
            System.out.println("2 - Converter hexadecimal para decimal");
            System.out.println("0 - Sair");
            System.out.println();
            System.out.print("Digite a opcao desejada: ");
            opcao = scanner.nextInt();
            switch (opcao) {
                case 1:
                    System.out.println();
                    System.out.print("Digite um numero decimal (ate " + LimiteMaximoDecimal + "): ");
                    decimal = scanner.nextInt();
                    if (decimal > LimiteMaximoDecimal)
                        System.out.println("Valor decimal fora do limite permitido.");
                    else
                        System.out.println("Valor em hexadecimal: " + DecimalParaHexadecimal(decimal));
                    break;
                case 2:
                    System.out.println();
                    System.out.print("Digite um numero hexadecimal (ate " + LimiteMaximoHexadecimal + "): ");
                    hexadecimal = scanner.next();
                    if (!IsValidHexadecimal(hexadecimal))
                        System.out.println("Valor hexadecimal invalido.");
                    else if (HexadecimalParaDecimal(hexadecimal) > LimiteMaximoDecimal)
                        System.out.println("Valor hexadecimal fora do limite permitido.");
                    else
                        System.out.println("Valor em decimal: " + HexadecimalParaDecimal(hexadecimal));
                    break;
            }
            System.out.println();
        } while (opcao != 0);
    }
}
