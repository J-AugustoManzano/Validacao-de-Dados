function VALIDA_HEXA(VALOR)
  for I = 1, #VALOR do
    local CARACTERE = string.sub(VALOR, I, I)
    if not ((CARACTERE >= '0' and CARACTERE <= '9') or
            (CARACTERE >= 'A' and CARACTERE <= 'F') or
            (CARACTERE >= 'a' and CARACTERE <= 'f')) then
      return false
    end
  end
  return true
end


print("")
local VALOR_HEX = ""
local SAIR_LOOP = false
while not SAIR_LOOP do
  io.write("Entre valor hexadecimal de 4 caracteres: ")
  VALOR_HEX = io.read()
  VALOR_HEX = string.gsub(VALOR_HEX, "^%s*(.-)%s*$", "%1")
  if string.len(VALOR_HEX) ~= 4 then
    print("Valor invalido, deve ter exatamente 4 caracteres.")
    print()
    goto continue
  end
  if not VALIDA_HEXA(VALOR_HEX) then
    print("Valor invalido, apenas caracteres [0-9] e [A-F].")
    print()
    goto continue
  end
  SAIR_LOOP = true
  ::continue::
end
VALOR_HEX = string.upper(VALOR_HEX)
print("Valor fornecido: " .. VALOR_HEX)
print()
