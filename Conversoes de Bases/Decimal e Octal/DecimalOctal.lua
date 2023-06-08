function DecimalParaOctal(decimal)
  local octal = ""
  while decimal > 0 do
    local resto = decimal % 8
    octal = resto .. octal
    decimal = math.floor(decimal / 8)
  end
  return tonumber(octal)
end

function OctalParaDecimal(octal)
  local decimal = 0
  local potencia = 0
  while octal > 0 do
    local digito = octal % 10
    decimal = decimal + digito * (8 ^ potencia)
    octal = math.floor(octal / 10)
    potencia = potencia + 1
  end
  return math.floor(decimal)
end

function IsValidOctal(octal)
  while octal > 0 do
    if octal % 10 > 7 then
      return false
    end
    octal = math.floor(octal / 10)
  end
  return true
end

local LimiteMaximoDecimal = 2147483647
local LimiteMaximoOctal = 17777777777

repeat
  print("=========================")
  print(" CONVERSOR DECIMAL-OCTAL ")
  print("=========================")
  print()
  print("1 - Converter decimal para octal")
  print("2 - Converter octal para decimal")
  print("0 - Sair")
  print()
  io.write("Digite a opcao desejada: ")
  local opcao = tonumber(io.read())
  if opcao == 1 then
    print()
    io.write("Digite um numero decimal (ate ", LimiteMaximoDecimal, "): ")
    local decimal = tonumber(io.read())
    if decimal > LimiteMaximoDecimal then
      print("Valor decimal fora do limite permitido.")
    else
      print("Valor em octal: " .. DecimalParaOctal(decimal))
    end
  elseif opcao == 2 then
    print()
    io.write("Digite um numero octal (ate ", LimiteMaximoOctal, "): ")
    local octal = tonumber(io.read())
    if not IsValidOctal(octal) then
      print("Valor octal invalido.")
    elseif octal > LimiteMaximoOctal then
      print("Valor octal fora do limite permitido.")
    else
      print("Valor em decimal: " .. OctalParaDecimal(octal))
    end
  end
  print()
until opcao == 0
