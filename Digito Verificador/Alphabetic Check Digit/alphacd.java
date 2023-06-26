import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("ALPHABETIC CHECK DIGIT");
        System.out.println("======================");
        System.out.println();

        System.out.print("Entre matricula alfanumerica (tamanho livre): ");
        String entrada = scanner.nextLine();
        System.out.println("Dígito verificador para " + entrada + " = " + AlphaCD(entrada));
        System.out.println();

        System.out.print("Entre matricula e dígito verificador (juntos): ");
        String matricula = scanner.nextLine();
        char digitoVerificador = matricula.charAt(matricula.length() - 1);
        String matriculaSemDigito = matricula.substring(0, matricula.length() - 1).trim();

        if (AlphaCD(matriculaSemDigito) == digitoVerificador) {
            System.out.println("Numero valido.");
        } else {
            System.out.println("Numero invalido.");
        }
    }

    public static char AlphaCD(String valor) {
        int soma = 0;
        int proximo = 0;
        int[] digitos = new int[valor.length()];

        for (int i = 0; i < valor.length(); i++) {
            char caractere = Character.toUpperCase(valor.charAt(i));
            if (caractere == ' ' || caractere == '.' || caractere == '-') {
                // Ignorar caracteres especiais
                continue;
            } else if (caractere >= '0' && caractere <= '9') {
                digitos[valor.length() - i - 1] = caractere - '0';
            } else if (caractere >= 'A' && caractere <= 'Z') {
                digitos[valor.length() - i - 1] = (caractere - 'A' + 1) % 9;
            }

            if ((i + 1) % 2 == 0) {
                digitos[valor.length() - i - 1] *= 2;
                if (digitos[valor.length() - i - 1] >= 10) {
                    digitos[valor.length() - i - 1] = (digitos[valor.length() - i - 1] / 10)
                            + (digitos[valor.length() - i - 1] % 10);
                }
            }

            soma += digitos[valor.length() - i - 1];
        }

        if (soma % 10 == 0) {
            proximo = soma;
        } else {
            proximo = ((soma / 10) + 1) * 10;
        }

        return (char) (proximo - soma + '0');
    }
}
