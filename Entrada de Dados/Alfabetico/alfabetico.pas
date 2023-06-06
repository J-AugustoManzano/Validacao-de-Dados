program ValidacaoCadeiaAlfabetica;

var
  TEXTO: string;
  I: integer;
  VALIDACAO: boolean;

begin
  repeat
    write('Entre uma cadeia alfabetica: ');
    readln(TEXTO);
    VALIDACAO := true;
    for I := 1 to length(TEXTO) do
    begin
      if not ((TEXTO[I] >= 'A') and (TEXTO[I] <= 'Z')) and
         not ((TEXTO[I] >= 'a') and (TEXTO[I] <= 'z')) and
         not  (TEXTO[I] = ' ') then
      begin
        VALIDACAO := false;
        break;
      end;
    end;
    if (VALIDACAO = false) then
      writeln('Entrada invalida. Por favor, tente novamente.')
    else
      break;
  until (VALIDACAO = true);
  writeln('Voce informou a cadeia: ', TEXTO);
end.
