program TabelaValores;

function AlphaCD(valor: string): char;
var
  i, soma, proximo: integer;
  caractere: char;
  digitos: array of integer;
begin
  SetLength(digitos, Length(valor));
  soma := 0;
  for i := 1 to Length(valor) do
  begin
    caractere := UpCase(valor[i]);
    if (caractere = ' ') or (caractere = '.') or (caractere = '-') then
      continue;
    if (caractere >= '0') and (caractere <= '9') then
      digitos[Length(valor) - i] := ord(caractere) - ord('0')
    else if (caractere >= 'A') and (caractere <= 'Z') then
      digitos[Length(valor) - i] := (ord(caractere) - ord('A') + 1) mod 9;
    if (i mod 2 = 0) then
    begin
      digitos[Length(valor) - i] := digitos[Length(valor) - i] * 2;
      if digitos[Length(valor) - i] >= 10 then
        digitos[Length(valor) - i] := (digitos[Length(valor) - i] div 10) + (digitos[Length(valor) - i] mod 10);
    end;
    soma := soma + digitos[Length(valor) - i];
  end;
  if (soma mod 10 = 0) then
    proximo := soma
  else
    proximo := ((soma div 10) + 1) * 10;
  AlphaCD := Chr(proximo - soma + Ord('0'));
end;

function TrimString(str: string): string;
var
  i: integer;
begin
  i := 1;
  while (i <= Length(str)) and (str[i] = ' ') do
    i := i + 1;
  if i <= Length(str) then
  begin
    while (str[Length(str)] = ' ') do
      str := Copy(str, 1, Length(str) - 1);
    TrimString := Copy(str, i, Length(str));
  end
  else
    TrimString := '';
end;

var
  entrada, matricula, digitoVerificador: string;

begin

  writeln('ALPHABETIC CHECK DIGIT');
  writeln('======================');
  writeln();
  
  write('Entre matricula alfanumerica (tamanho livre): ');
  readln(entrada);
  writeln('Dígito verificador para ', entrada, ' = ', AlphaCD(entrada));
  writeln();

  write('Entre matricula e dígito verificador (juntos): ');
  readln(matricula);
  digitoVerificador := Copy(matricula, Length(matricula), 1);
  matricula := TrimString(Copy(matricula, 1, Length(matricula) - 1));

  if (AlphaCD(matricula) = digitoVerificador) then
    writeln('Numero valido.')
  else
    writeln('Numero invalido.');
    
end.
