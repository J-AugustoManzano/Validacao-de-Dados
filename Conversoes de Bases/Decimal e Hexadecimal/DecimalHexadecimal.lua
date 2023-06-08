local function DecimalParaHexadecimal(decimal)
    local resto
    local hexadecimal = ""
    repeat
        resto = decimal % 16
        if resto >= 0 and resto <= 9 then
            hexadecimal = tostring(resto) .. hexadecimal
        elseif resto >= 10 and resto <= 15 then
            hexadecimal = string.char(resto - 10 + string.byte("A")) .. hexadecimal
        end
        decimal = math.floor(decimal / 16)
    until decimal == 0

    return hexadecimal
end

local function HexadecimalParaDecimal(hexadecimal)
    local potencia = 0
    local decimal = 0
    while #hexadecimal > 0 do
        local digito = string.upper(string.sub(hexadecimal, #hexadecimal, #hexadecimal))
        local valor
        if digito >= "0" and digito <= "9" then
            valor = tonumber(digito)
        elseif digito >= "A" and digito <= "F" then
            valor = string.byte(digito) - string.byte("A") + 10
        else
            return nil
        end
        decimal = decimal + valor * (16 ^ potencia)
        potencia = potencia + 1
        hexadecimal = string.sub(hexadecimal, 1, #hexadecimal - 1)
    end
    return decimal
end

local function IsValidHexadecimal(hexadecimal)
    return string.match(hexadecimal, "^[0-9A-Fa-f]+$") ~= nil
end

local LimiteMaximoDecimal = 2147483647
local LimiteMaximoHexadecimal = "7FFFFFFF"

repeat
    print("===============================")
    print(" CONVERSOR DECIMAL-HEXADECIMAL ")
    print("===============================")
    print()
    print("1 - Converter decimal para hexadecimal")
    print("2 - Converter hexadecimal para decimal")
    print("0 - Sair")
    print()
    io.write("Digite a opcao desejada: ")
    local opcao = tonumber(io.read())
    if opcao == 1 then
        print()
        io.write("Digite um numero decimal (ate " .. LimiteMaximoDecimal .. "): ")
        local decimal = tonumber(io.read())
        if decimal and decimal >= 0 and decimal <= LimiteMaximoDecimal then
            local hexadecimal = DecimalParaHexadecimal(decimal)
            print("Valor em hexadecimal: " .. hexadecimal)
        else
            print("Valor decimal fora do limite permitido.")
        end
    elseif opcao == 2 then
        print()
        io.write("Digite um numero hexadecimal (ate " .. LimiteMaximoHexadecimal .. "): ")
        local hexadecimal = io.read()
        if IsValidHexadecimal(hexadecimal) then
            local decimal = HexadecimalParaDecimal(hexadecimal)
            if decimal and decimal <= LimiteMaximoDecimal then
                print("Valor em decimal: " .. math.floor(decimal))
            else
                print("Valor hexadecimal fora do limite permitido.")
            end
        else
            print("Valor hexadecimal invalido.")
        end
    end
    print()
until opcao == 0
