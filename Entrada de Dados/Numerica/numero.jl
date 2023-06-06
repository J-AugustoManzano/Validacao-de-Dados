while true
  VALIDACAO = false
  print("Entre um numero: ")
  NUMERO_AUX = readline()
  if (tryparse(Int, NUMERO_AUX) !== nothing)
    global NUMERO = parse(Int, NUMERO_AUX)
    global VALIDACAO = true
    break
  else
    println("Entrada invalida. Por favor, tente novamente.")
  end
end
println("Voce informou o numero: ", NUMERO)
