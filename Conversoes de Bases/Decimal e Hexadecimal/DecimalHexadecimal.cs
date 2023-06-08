using System;

class DecimalHexadecimal
{
    const uint LimiteMaximoDecimal = 2147483647;
    const string LimiteMaximoHexadecimal = "7FFFFFFF";
    static string DecimalParaHexadecimal(uint decimalValue)
    {
        string hexadecimal = "";
        do
        {
            uint resto = decimalValue % 16;

            if (resto >= 0 && resto <= 9)
                hexadecimal = (char)(resto + '0') + hexadecimal;
            else
                hexadecimal = (char)(resto - 10 + 'A') + hexadecimal;
            decimalValue /= 16;
        } while (decimalValue != 0);
        return hexadecimal;
    }

    static uint HexadecimalParaDecimal(string hexadecimalValue)
    {
        uint decimalValue = 0;
        uint potencia = 0;
        for (int i = hexadecimalValue.Length - 1; i >= 0; i--)
        {
            char digito = char.ToUpper(hexadecimalValue[i]);
            if (digito >= '0' && digito <= '9')
                decimalValue += (uint)((digito - '0') * Math.Pow(16, potencia));
            else if (digito >= 'A' && digito <= 'F')
                decimalValue += (uint)((digito - 'A' + 10) * Math.Pow(16, potencia));
            potencia++;
        }
        return decimalValue;
    }

    static bool IsValidHexadecimal(string hexadecimalValue)
    {
        foreach (char c in hexadecimalValue)
        {
            if (!char.IsDigit(c) && (c < 'A' || c > 'F') && (c < 'a' || c > 'f'))
            {
                return false;
            }
        }
        return true;
    }

    static void Main()
    {
        int opcao;
        uint decimalValue;
        string hexadecimalValue;
        do
        {
            Console.WriteLine("===============================");
            Console.WriteLine(" CONVERSOR DECIMAL-HEXADECIMAL ");
            Console.WriteLine("===============================");
            Console.WriteLine();
            Console.WriteLine("1 - Converter decimal para hexadecimal");
            Console.WriteLine("2 - Converter hexadecimal para decimal");
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
                        Console.WriteLine("Valor decimal fora do limite permitido.");
                    else
                        Console.WriteLine("Valor em hexadecimal: {0}", DecimalParaHexadecimal(decimalValue));
                    break;
                case 2:
                    Console.WriteLine();
                    Console.Write("Digite um numero hexadecimal (ate {0}): ", LimiteMaximoHexadecimal);
                    hexadecimalValue = Console.ReadLine();
                    if (!IsValidHexadecimal(hexadecimalValue))
                        Console.WriteLine("Valor hexadecimal invalido.");
                    else if (HexadecimalParaDecimal(hexadecimalValue) > LimiteMaximoDecimal)
                        Console.WriteLine("Valor hexadecimal fora do limite permitido.");
                    else
                        Console.WriteLine("Valor em decimal: {0}", HexadecimalParaDecimal(hexadecimalValue));
                    break;
            }
            Console.WriteLine();
        } while (opcao != 0);
    }
}
