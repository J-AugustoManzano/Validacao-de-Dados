local NUMERO = nil
local NUMERO_AUX = ""

repeat
  io.write("Entre um numero: ")
  NUMERO_AUX = io.read("*l")
  NUMERO = tonumber(NUMERO_AUX)
  if (NUMERO == nil) then
    print("Entrada invalida. Por favor, tente novamente.")
  end
until (NUMERO ~= nil)
print("Voce informou o numero: " .. NUMERO)
