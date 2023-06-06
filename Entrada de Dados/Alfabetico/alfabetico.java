import java.util.Scanner;

public class Main {
  public static void main(String[] args) {

    String TEXTO;
    boolean VALIDACAO;

    Scanner entrada = new Scanner(System.in);
    do {
      System.out.print("Entre uma cadeia alfabética: ");
      TEXTO = entrada.nextLine();
      VALIDACAO = true;
      for (int I = 0; I < TEXTO.length(); I++) {
        char CARACTERE = TEXTO.charAt(I);
        if (!((CARACTERE >= 'A' && CARACTERE <= 'Z') ||
              (CARACTERE >= 'a' && CARACTERE <= 'z') ||
               CARACTERE == ' ')) {
          VALIDACAO = false;
          break;
        }
      }
      if (VALIDACAO == false) {
        System.out.println("Entrada inválida. Por favor, tente novamente.");
      } else {
        break;
      }
    } while (true);
    entrada.close();
    System.out.println("Você informou a cadeia: " + TEXTO);
  }
}
