program ValidacaoCadeiaAlfabetica;

var
  TEXTO: string;
  I: integer;
  VALIDACAO: boolean;

begin
  repeat
    write('Entre uma cadeia alfabetica: ');
    readln(TEXTO);
    VALIDACAO := false;
    for I := 1 to length(TEXTO) do
    begin
      if (TEXTO[I] in ['A'..'Z', 'a'..'z', ' ']) then
      begin
        VALIDACAO := true;
      end
      else
      begin
        VALIDACAO := false;
        break;
      end;
    end;
    if (not VALIDACAO) then
      writeln('Entrada invalida. Por favor, tente novamente.')
    else
      break;
  until VALIDACAO;
  writeln('Voce informou a cadeia: ', TEXTO);
end.
