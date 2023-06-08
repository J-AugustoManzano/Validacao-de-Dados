def formata_valor(valor):
    # Verifica se o valor possui parte decimal
    if '.' in valor:
        inteiro, decimal = valor.split('.')
    else:
        inteiro = valor
        decimal = '00'
    # Formata a parte inteira
    valor_formatado = ''
    for i in range(len(inteiro), 0, -1):
        valor_formatado = inteiro[i-1] + valor_formatado
        if i > 1 and (len(inteiro) - i + 1) % 3 == 0:
            valor_formatado = '.' + valor_formatado
    valor_formatado = valor_formatado + ',' + decimal
    return valor_formatado

valor = input('Digite um valor real: ')
valor_formatado = formata_valor(valor)
print('Valor formatado:', valor_formatado)
