import java.util.Scanner;

class Data {
    short   dia;
    short   mes;
    short   ano;
    boolean ok;
}

public class Main {
    public static int StrToInt(String cadeia) {
        int valor = 0;
        int sinal = 1;
        if (cadeia.isEmpty())
            return 0;
        if (cadeia.charAt(0) == '-') {
            sinal = -1;
            for (int i = 1; i < cadeia.length(); i++) {
                if (!Character.isDigit(cadeia.charAt(i)))
                    return 0;
                valor = valor * 10 + cadeia.charAt(i) - '0';
            }
        } else {
            for (int i = 0; i < cadeia.length(); i++) {
                if (!Character.isDigit(cadeia.charAt(i)))
                    return 0;
                valor = valor * 10 + cadeia.charAt(i) - '0';
            }
        }
        return valor * sinal;
    }

    public static String IntToStr(int valor) {
        return Integer.toString(valor);
    }

    public static String Formatar(int valor, int digitos) {
        String valorCadeia = IntToStr(valor);
        while (valorCadeia.length() < digitos)
            valorCadeia = '0' + valorCadeia;
        return valorCadeia;
    }

    public static boolean anoBissexto(Data data) {
        if (data.ano % 400 == 0)
            return true;
        else if ((data.ano % 4 == 0) && (data.ano % 100 != 0))
            return true;
        else
            return false;
    }

    public static int ultimoDiaMes(Data data) {
        if (data.mes == 2)
            return (anoBissexto(data)) ? 29 : 28;
        if (data.mes <= 7)
            return (data.mes % 2 != 0) ? 31 : 30;
        return (data.mes % 2 != 0) ? 30 : 31;
    }

    public static void validaData(Data data) {
        data.ok = (data.ano >=    1) && 
                  (data.ano <= 9999) &&
                  (data.mes >=    1) && 
                  (data.mes <=   12) &&
                  (data.dia >=    1) && 
                  (data.dia <= ultimoDiaMes(data)) &&
                !((data.ano == 1582) &&
                  (data.mes ==   10) &&
                  (data.dia >=    5) &&
                  (data.dia <=   14));
    }

    public static void alteraData(Data data, int dia, int mes, int ano) {
        data.dia = (short) dia;
        data.mes = (short) mes;
        data.ano = (short) ano;
        validaData(data);
    }

    public static void mostraData(Data data) {
        if (data.ok)
            System.out.println(Formatar(data.dia, 2) + '/' + Formatar(data.mes, 2) + '/' + Formatar(data.ano, 4));
        else
            System.out.println("**/**/****");
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("TESTE DE VALIDACAO DE DATA (CALENDARIO)");
        System.out.println("=======================================");
        System.out.println();
        System.out.print("Entre data no formato DD/MM/AAAA: ");

        String DTS = scanner.nextLine();

        int DIA = StrToInt(DTS.substring(0, 2));
        int MES = StrToInt(DTS.substring(3, 5));
        int ANO = StrToInt(DTS.substring(6, 10));

        Data data = new Data();
        alteraData(data, DIA, MES, ANO);

        System.out.print("Data informada: ");
        mostraData(data);

        System.out.println();
        System.out.print("Tecle <Enter> para encerrar... ");
        scanner.nextLine();
    }
}
