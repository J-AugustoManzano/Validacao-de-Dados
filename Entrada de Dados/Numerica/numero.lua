local NUMERO = nil
repeat
  io.write("Entre um numero: ")
  local entrada = io.read("*l")
  NUMERO = tonumber(entrada)
  if (NUMERO == nil) then
    print("Entrada invalida. Por favor, tente novamente.")
  end
until NUMERO ~= nil
print("Voce informou o numero: " .. NUMERO)
