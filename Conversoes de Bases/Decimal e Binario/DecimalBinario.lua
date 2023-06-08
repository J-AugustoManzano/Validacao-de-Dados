local function DecimalParaBinario(decimal)
    local binario = ""
    while decimal > 0 do
        local resto = decimal % 2
        binario = tostring(resto) .. binario
        decimal = math.floor(decimal / 2)
    end
    while string.len(binario) < 32 do
        binario = "0" .. binario
    end
    return binario
end

local function BinarioParaDecimal(binario)
    local valor = 0
    for i = string.len(binario), 1, -1 do
        local char = string.sub(binario, i, i)
        if char == "1" then
            local potencia = string.len(binario) - i
            valor = valor + 2^potencia
        end
    end
    return valor
end

local function IsValidBinario(binario)
    for i = 1, string.len(binario) do
        local char = string.sub(binario, i, i)
        if char ~= "0" and char ~= "1" then
            return false
        end
    end
    return true
end

local LimiteMaximoDecimal = 2147483647
local LimiteMaximoBinario = "1111111111111111111111111111111"

local opcao
repeat
    print("===========================")
    print(" CONVERSOR DECIMAL-BINARIO     ")
    print("============================")
    print()
    print("1 - Converter decimal para binario")
    print("2 - Converter binario para decimal")
    print("0 - Sair")
    print()
    io.write("Digite a opcao desejada: ")
    opcao = tonumber(io.read())
    if opcao == 1 then
        print()
        io.write("Digite um numero decimal (ate " .. LimiteMaximoDecimal .. "): ")
        local decimal = tonumber(io.read())
        if decimal and decimal >= 0 and decimal <= LimiteMaximoDecimal then
            local binario = DecimalParaBinario(decimal)
            print("Valor em binario: " .. binario)
        else
            print("Valor decimal fora do limite permitido.")
        end
    elseif opcao == 2 then
        print()
        io.write("Digite um numero binario (ate " .. LimiteMaximoBinario .. "): ")
        local binario = io.read()
        if IsValidBinario(binario) then
            local decimal = BinarioParaDecimal(binario)
            if decimal and decimal <= LimiteMaximoDecimal then
                print("Valor em decimal: " .. math.floor(decimal))
            else
                print("Valor binario fora do limite permitido.")
            end
        else
            print("Valor binario invalido.")
        end
    end
    print()
until opcao == 0
