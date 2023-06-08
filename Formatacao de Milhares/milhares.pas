program SeparacaoMilhares;

uses
  SysUtils;

procedure FormataValor(const valor: string; var valorFormatado: string);
var
  inteiro, decimal: string;
  i: Integer;
begin
  // Verifica se o valor possui parte decimal
  if Pos('.', valor) > 0 then
  begin
    inteiro := Copy(valor, 1, Pos('.', valor) - 1);
    decimal := Copy(valor, Pos('.', valor) + 1, Length(valor) - Pos('.', valor));
  end
  else
  begin
    inteiro := valor;
    decimal := '00';
  end;
  // Formata a parte inteira
  valorFormatado := '';
  for i := Length(inteiro) downto 1 do
  begin
    valorFormatado := inteiro[i] + valorFormatado;
    if (i > 1) and ((Length(inteiro) - i + 1) mod 3 = 0) then
      valorFormatado := '.' + valorFormatado;
  end;
  // Concatena a parte decimal
  valorFormatado := valorFormatado + ',' + decimal;
end;

var
  valor: string;
  valorFormatado: string;

begin
  Write('Digite um valor real: ');
  ReadLn(valor);
  FormataValor(valor, valorFormatado);
  WriteLn('Valor formatado: ', valorFormatado);
end.
