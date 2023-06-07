program TextCaseConverter;

var
  texto: string;
  textoMaiusculo, textoMinusculo: string;

begin
  Write('Digite um texto .....: ');
  ReadLn(texto);

  textoMaiusculo := UpCase(texto);
  textoMinusculo := LowerCase(texto);

  Write('Texto em maiusculo ..: ');
  WriteLn(textoMaiusculo);

  Write('Texto em minusculo ...: ');
  WriteLn(textoMinusculo);
end.
