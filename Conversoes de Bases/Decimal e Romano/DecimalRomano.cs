using System;

public class DecimalRomano
{
    private static readonly string[] ALGARISMOS_ROMANOS = { "I", "IV", "V", "IX", "X", "XL", "L", "XC", "C", "CD", "D", "CM", "M" };
    private static readonly int[] VALORES_DECIMAIS = { 1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000 };
    private const int LIMITE_MAXIMO_DECIMAL = 3999;
    private const string LIMITE_MAXIMO_ROMANO = "MMMCMXCIX";

    public static string DecimalParaRomano(int decimalValue)
    {
        string romano = "";
        int i = 12;
        while (decimalValue > 0)
        {
            if (decimalValue >= VALORES_DECIMAIS[i])
            {
                romano += ALGARISMOS_ROMANOS[i];
                decimalValue -= VALORES_DECIMAIS[i];
            }
            else
            {
                i--;
            }
        }
        return romano;
    }

    public static int RomanoParaDecimal(string romano)
    {
        int resultado = 0;
        int valorAnterior = 0;
        romano = romano.ToUpper();
        for (int i = romano.Length - 1; i >= 0; i--)
        {
            bool valorEncontrado = false;
            for (int j = 0; j < 13; j++)
            {
                if (romano[i] == ALGARISMOS_ROMANOS[j][0])
                {
                    valorEncontrado = true;
                    if (VALORES_DECIMAIS[j] < valorAnterior)
                    {
                        resultado -= VALORES_DECIMAIS[j];
                    }
                    else
                    {
                        resultado += VALORES_DECIMAIS[j];
                        valorAnterior = VALORES_DECIMAIS[j];
                    }
                    break;
                }
            }
            if (!valorEncontrado)
            {
                resultado = 0;
                break;
            }
        }
        return resultado;
    }

    public static void Main(string[] args)
    {
        int opcao;
        int decimalValue;
        string romano;
        do
        {
            Console.WriteLine("===============================");
            Console.WriteLine(" CONVERSOR DECIMAL-ROMANO      ");
            Console.WriteLine("===============================");
            Console.WriteLine();
            Console.WriteLine("1 - Converter decimal para romano");
            Console.WriteLine("2 - Converter romano para decimal");
            Console.WriteLine("0 - Sair");
            Console.WriteLine();
            Console.Write("Digite a opcao desejada: ");
            opcao = int.Parse(Console.ReadLine());
            switch (opcao)
            {
                case 1:
                    Console.WriteLine();
                    Console.Write("Digite um numero decimal (ate " + LIMITE_MAXIMO_DECIMAL + "): ");
                    decimalValue = int.Parse(Console.ReadLine());
                    if (decimalValue < 1 || decimalValue > LIMITE_MAXIMO_DECIMAL)
                    {
                        Console.WriteLine("Valor decimal fora do limite permitido.");
                    }
                    else
                    {
                        Console.WriteLine("Valor em algarismo romano: " + DecimalParaRomano(decimalValue));
                    }
                    break;
                case 2:
                    Console.WriteLine();
                    Console.Write("Digite um numero romano (ate " + LIMITE_MAXIMO_ROMANO + "): ");
                    romano = Console.ReadLine();
                    romano = romano.ToUpper();
                    if (romano.Length == 0 || RomanoParaDecimal(romano) == 0)
                    {
                        Console.WriteLine("Valor romano fora do limite permitido.");
                    }
                    else
                    {
                        Console.WriteLine("Valor em decimal: " + RomanoParaDecimal(romano));
                    }
                    break;
            }
            Console.WriteLine();
        } while (opcao != 0);
    }
}
