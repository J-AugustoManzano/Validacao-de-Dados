io.write("Digite um texto .....: ")
local texto = io.read()

local textoMaiusculo = string.upper(texto)
local textoMinusculo = string.lower(texto)

io.write("Texto em maiusculo ..: ")
print(textoMaiusculo)

io.write("Texto em minusculo ..: ")
print(textoMinusculo)
