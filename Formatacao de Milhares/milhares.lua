function FormataValor(valor)
    -- Verifica se o valor possui parte decimal
    local inteiro, decimal = string.match(valor, "(%d+)%.(%d+)")
    if not inteiro then
        inteiro = valor
        decimal = "00"
    end
    local valorFormatado = ""
    local contador = 0
    -- Formata a parte inteira
    for i = #inteiro, 1, -1 do
        valorFormatado = string.sub(inteiro, i, i) .. valorFormatado
        contador = contador + 1
        -- Insere o separador de milhares
        if contador % 3 == 0 and i > 1 then
            valorFormatado = "." .. valorFormatado
        end
    end
    valorFormatado = valorFormatado .. "," .. decimal
    return valorFormatado
end

local valor
io.write("Digite um valor real: ")
valor = io.read()
local valorFormatado = FormataValor(valor)
print("Valor formatado:" .. valorFormatado)
