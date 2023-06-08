ALGARISMOS_ROMANOS = ['I', 'IV', 'V', 'IX', 'X', 'XL', 'L', 'XC', 'C', 'CD', 'D', 'CM', 'M']
VALORES_DECIMAIS = [1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000]
LIMITE_MAXIMO_DECIMAL = 3999
LIMITE_MAXIMO_ROMANO = 'MMMCMXCIX'

def decimal_para_romano(decimal):
    romano = ''
    i = 12
    while decimal > 0:
        if decimal >= VALORES_DECIMAIS[i]:
            romano += ALGARISMOS_ROMANOS[i]
            decimal -= VALORES_DECIMAIS[i]
        else:
            i -= 1
    return romano

def romano_para_decimal(romano):
    resultado = 0
    valor_anterior = 0
    valor_encontrado = False
    romano = romano.upper()
    for i in range(len(romano)-1, -1, -1):
        valor_encontrado = False
        for valor_atual in range(13):
            if romano[i] == ALGARISMOS_ROMANOS[valor_atual]:
                valor_encontrado = True
                if valor_atual < valor_anterior:
                    resultado -= VALORES_DECIMAIS[valor_atual]
                else:
                    resultado += VALORES_DECIMAIS[valor_atual]
                    valor_anterior = valor_atual
                break
        if not valor_encontrado:
            resultado = 0
            break
    return resultado

opcao = -1
while opcao != 0:
    print('==========================')
    print(' CONVERSOR DECIMAL-ROMANO ')
    print('==========================')
    print()
    print('1 - Converter decimal para romano')
    print('2 - Converter romano para decimal')
    print('0 - Sair')
    print()
    opcao = int(input('Digite a opcao desejada: '))
    if opcao == 1:
        print()
        decimal = int(input('Digite um numero decimal (ate ' + str(LIMITE_MAXIMO_DECIMAL) + '): '))
        if decimal < 1 or decimal > LIMITE_MAXIMO_DECIMAL:
            print('Valor decimal fora do limite permitido.')
        else:
            print('Valor em algarismo romano:', decimal_para_romano(decimal))
    elif opcao == 2:
        print()
        romano = input('Digite um numero romano (ate ' + LIMITE_MAXIMO_ROMANO + '): ')
        romano = romano.upper() # Converter para maiúsculas para facilitar a comparação
        if len(romano) == 0 or romano_para_decimal(romano) == 0:
            print('Valor romano fora do limite permitido.')
        else:
            print('Valor em decimal:', romano_para_decimal(romano))
    print()
