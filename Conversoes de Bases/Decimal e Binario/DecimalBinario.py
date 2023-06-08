def decimal_para_binario(decimal):
    binario = ""
    while decimal > 0:
        resto = decimal % 2
        binario = str(resto) + binario
        decimal = decimal // 2
    while len(binario) < 32:
        binario = '0' + binario
    return binario

def binario_para_decimal(binario):
    valor = 0
    for i in range(len(binario)-1, -1, -1):
        if binario[i] == '1':
            potencia = len(binario) - 1 - i
            valor += 2**potencia
    return valor

def is_valid_binario(binario):
    for char in binario:
        if char != '0' and char != '1':
            return False
    return True

LimiteMaximoDecimal = 2147483647
LimiteMaximoBinario = '1111111111111111111111111111111'

while True:
    print("===========================")
    print(" CONVERSOR DECIMAL-BINARIO ")
    print("===========================")
    print()
    print("1 - Converter decimal para binario")
    print("2 - Converter binario para decimal")
    print("0 - Sair")
    print()
    opcao = int(input("Digite a opcao desejada: "))
    if opcao == 1:
        print()
        decimal = int(input(f"Digite um numero decimal (ate {LimiteMaximoDecimal}): "))
        
        if decimal > LimiteMaximoDecimal:
            print("Valor decimal fora do limite permitido.")
        else:
            print("Valor em binario: ", decimal_para_binario(decimal))
    elif opcao == 2:
        print()
        binario = input(f"Digite um numero binario (ate {LimiteMaximoBinario}): ")
        if not is_valid_binario(binario):
            print("Valor binario invalido.")
        elif len(binario) > len(LimiteMaximoBinario):
            print("Valor binario fora do limite permitido.")
        else:
            print("Valor em decimal: ", binario_para_decimal(binario))
    print()
    if opcao == 0:
        break
