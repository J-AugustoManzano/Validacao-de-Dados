local ALGARISMOS_ROMANOS = {"I", "IV", "V", "IX", "X", "XL", "L", "XC", "C", "CD", "D", "CM", "M"}
local VALORES_DECIMAIS = {1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000}
local LIMITE_MAXIMO_DECIMAL = 3999
local LIMITE_MAXIMO_ROMANO = "MMMCMXCIX"

function DecimalParaRomano(decimal)
  local romano = ""
  local i = 13
  while decimal > 0 do
    if decimal >= VALORES_DECIMAIS[i] then
      romano = romano .. ALGARISMOS_ROMANOS[i]
      decimal = decimal - VALORES_DECIMAIS[i]
    else
      i = i - 1
    end
  end
  return romano
end

function RomanoParaDecimal(romano)
  local resultado = 0
  local valorAnterior = 0
  local valorEncontrado = false
  romano = romano:upper()
  for i = #romano, 1, -1 do
    valorEncontrado = false
    for valorAtual = 1, #ALGARISMOS_ROMANOS do
      if romano:sub(i, i) == ALGARISMOS_ROMANOS[valorAtual] then
        valorEncontrado = true
        if valorAtual < valorAnterior then
          resultado = resultado - VALORES_DECIMAIS[valorAtual]
        else
          resultado = resultado + VALORES_DECIMAIS[valorAtual]
          valorAnterior = valorAtual
        end
        break
      end
    end
    if not valorEncontrado then
      resultado = 0
      break
    end
  end
  return resultado
end

repeat
  print("==========================")
  print(" CONVERSOR DECIMAL-ROMANO ")
  print("==========================")
  print()
  print("1 - Converter decimal para romano")
  print("2 - Converter romano para decimal")
  print("0 - Sair")
  print()
  io.write("Digite a opcao desejada: ")
  local opcao = tonumber(io.read())
  if opcao == 1 then
    print()
    io.write(string.format("Digite um numero decimal (ate %d): ", LIMITE_MAXIMO_DECIMAL))
    local decimal = tonumber(io.read())
    if decimal and decimal >= 1 and decimal <= LIMITE_MAXIMO_DECIMAL then
      print(string.format("Valor em algarismo romano: %s", DecimalParaRomano(decimal)))
    else
      print("Valor decimal fora do limite permitido.")
    end
  elseif opcao == 2 then
    print()
    io.write(string.format("Digite um numero romano (ate %s): ", LIMITE_MAXIMO_ROMANO))
    local romano = io.read()
    if romano and #romano > 0 then
      romano = romano:upper() -- Converter para maiúsculas para facilitar a comparação
      local decimal = RomanoParaDecimal(romano)
      if decimal ~= 0 then
        print(string.format("Valor em decimal: %d", decimal))
      else
        print("Valor romano fora do limite permitido.")
      end
    else
      print("Valor romano fora do limite permitido.")
    end
  end
  print()
until opcao == 0
