local NUMERO = nil
repeat
  io.write("Entre um numero: ")
  local input = io.read("*l")
  NUMERO = tonumber(input)
  if (NUMERO == nil) then
    print("Entrada invalida. Por favor, tente novamente.")
  end
until NUMERO ~= nil
print("Voce informou o numero: " .. NUMERO)
