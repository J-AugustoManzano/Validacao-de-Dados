using System;

public class DecimalOctal
{
    private const ulong LimiteMaximoDecimal = 2147483647;
    private const ulong LimiteMaximoOctal = 017777777777UL;
    public static ulong DecimalParaOctal(ulong decimalNumber)
    {
        ulong resto, potencia = 1, octal = 0;
        while (decimalNumber > 0)
        {
            resto = decimalNumber % 8;
            octal += resto * potencia;
            decimalNumber /= 8;
            potencia *= 10;
        }
        return octal;
    }

    public static ulong OctalParaDecimal(ulong octal)
    {
        ulong potencia = 0, digito, decimalNumber = 0;
        while (octal > 0)
        {
            digito = octal % 10;
            decimalNumber += digito * (ulong)Math.Pow(8, potencia);
            octal /= 10;
            potencia++;
        }
        return decimalNumber;
    }

    public static bool IsValidOctal(ulong octal)
    {
        while (octal > 0)
        {
            if (octal % 10 > 7)
            {
                return false;
            }
            octal /= 10;
        }
        return true;
    }

    public static void Main(string[] args)
    {
        int opcao = -1;
        ulong decimalNumber, octal;
        while (opcao != 0)
        {
            Console.WriteLine("=========================");
            Console.WriteLine(" CONVERSOR DECIMAL-OCTAL ");
            Console.WriteLine("=========================");
            Console.WriteLine();
            Console.WriteLine("1 - Converter decimal para octal");
            Console.WriteLine("2 - Converter octal para decimal");
            Console.WriteLine("0 - Sair");
            Console.WriteLine();
            Console.Write("Digite a opcao desejada: ");
            opcao = Convert.ToInt32(Console.ReadLine());
            switch (opcao)
            {
                case 1:
                    Console.WriteLine();
                    Console.Write($"Digite um numero decimal (ate {LimiteMaximoDecimal}): ");
                    decimalNumber = Convert.ToUInt64(Console.ReadLine());
                    if (decimalNumber > LimiteMaximoDecimal)
                        Console.WriteLine("Valor decimal fora do limite permitido.");
                    else
                        Console.WriteLine("Valor em octal: " + DecimalParaOctal(decimalNumber));
                    break;
                case 2:
                    Console.WriteLine();
                    Console.Write($"Digite um numero octal (ate {LimiteMaximoOctal}): ");
                    octal = Convert.ToUInt64(Console.ReadLine());
                    if (!IsValidOctal(octal))
                        Console.WriteLine("Valor octal invalido.");
                    else if (octal > LimiteMaximoOctal)
                        Console.WriteLine("Valor octal fora do limite permitido.");
                    else
                        Console.WriteLine("Valor em decimal: " + OctalParaDecimal(octal));
                    break;
                case 0:
                    break;
                default:
                    Console.WriteLine("Opcao invalida. Digite novamente.");
                    break;
            }
            Console.WriteLine();
        }
    }
}
