using System;

class DecimalBinario
{
    const uint LimiteMaximoDecimal = 2147483647;
    const string LimiteMaximoBinario = "1111111111111111111111111111111";

    static string DecimalParaBinario(uint decimalValue)
    {
        string binario = "";
        while (decimalValue > 0)
        {
            uint resto = decimalValue % 2;
            binario = resto.ToString() + binario;
            decimalValue /= 2;
        }
        while (binario.Length < 32)
        {
            binario = "0" + binario;
        }
        return binario;
    }

    static uint BinarioParaDecimal(string binario)
    {
        uint valor = 0;
        for (int i = binario.Length - 1; i >= 0; i--)
        {
            if (binario[i] == '1')
            {
                int potencia = binario.Length - 1 - i;
                valor += (uint)(1 << potencia);
            }
        }
        return valor;
    }

    static bool IsValidBinario(string binario)
    {
        foreach (char c in binario)
        {
            if (c != '0' && c != '1')
            {
                return false;
            }
        }
        return true;
    }

    static void Main()
    {
        int opcao = 0;
        uint decimalValue = 0;
        string binario = "";
        do
        {
            Console.WriteLine("===========================");
            Console.WriteLine(" CONVERSOR DECIMAL-BINARIO     ");
            Console.WriteLine("===========================");
            Console.WriteLine();
            Console.WriteLine("1 - Converter decimal para binario");
            Console.WriteLine("2 - Converter binario para decimal");
            Console.WriteLine("0 - Sair");
            Console.WriteLine();
            Console.Write("Digite a opcao desejada: ");
            opcao = int.Parse(Console.ReadLine());
            switch (opcao)
            {
                case 1:
                    Console.WriteLine();
                    Console.Write("Digite um numero decimal (ate {0}): ", LimiteMaximoDecimal);
                    decimalValue = uint.Parse(Console.ReadLine());
                    if (decimalValue > LimiteMaximoDecimal)
                    {
                        Console.WriteLine("Valor decimal fora do limite permitido.");
                    }
                    else
                    {
                        string bin = DecimalParaBinario(decimalValue);
                        Console.WriteLine("Valor em binario: {0}", bin);
                    }
                    break;
                case 2:
                    Console.WriteLine();
                    Console.Write("Digite um numero binario (ate {0}): ", LimiteMaximoBinario);
                    binario = Console.ReadLine();
                    if (!IsValidBinario(binario))
                    {
                        Console.WriteLine("Valor binario invalido.");
                    }
                    else if (binario.Length > LimiteMaximoBinario.Length)
                    {
                        Console.WriteLine("Valor binario fora do limite permitido.");
                    }
                    else
                    {
                        uint dec = BinarioParaDecimal(binario);
                        Console.WriteLine("Valor em decimal: {0}", dec);
                    }
                    break;
                case 0:
                    break;
                default:
                    Console.WriteLine("Opcao invalida. Tente novamente.");
                    break;
            }
            Console.WriteLine();
        } while (opcao != 0);
    }
}
