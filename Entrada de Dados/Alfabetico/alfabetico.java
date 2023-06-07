import java.util.Scanner;

public class Main {
  public static void main(String[] args) {

    String TEXTO;
    boolean VALIDACAO;

    Scanner entrada = new Scanner(System.in);
    do {
      System.out.print("Entre uma cadeia alfabetica: ");
      TEXTO = entrada.nextLine();
      VALIDACAO = false;
      for (int I = 0; I < TEXTO.length(); I++) {
        char CARACTERE = TEXTO.charAt(I);
        if (Character.isLetter(CARACTERE) && CARACTERE != ' ') {
          VALIDACAO = true;
          break;
        }
      }
      if (VALIDACAO == false) {
        System.out.println("Entrada invalida. Por favor, tente novamente.");
      } else {
        break;
      }
    } while (true);
    
    entrada.close();
    System.out.println("Voce informou a cadeia: " + TEXTO);
  }
}
