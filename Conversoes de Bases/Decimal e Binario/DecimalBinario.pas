program DecimalBinario;

uses
  SysUtils;

const
  LimiteMaximoDecimal: Cardinal = 2147483647;
  LimiteMaximoBinario: string = '1111111111111111111111111111111';

function DecimalParaBinario(decimal: Cardinal): string;
var
  resto: Cardinal;
  binario: string;
begin
  binario := '';
  while decimal > 0 do
  begin
    resto := decimal mod 2;
    binario := IntToStr(resto) + binario;
    decimal := decimal div 2;
  end;
  while Length(binario) < 32 do
    binario := '0' + binario;
  DecimalParaBinario := binario;
end;

function BinarioParaDecimal(binario: string): Cardinal;
var
  i, potencia, valor: Cardinal;
begin
  valor := 0;
  for i := Length(binario) downto 1 do
  begin
    if binario[i] = '1' then
    begin
      potencia := Length(binario) - i;
      valor := valor + (1 shl potencia);
    end;
  end;
  BinarioParaDecimal := valor;
end;

function IsValidBinario(binario: string): Boolean;
var
  i: Integer;
begin
  for i := 1 to Length(binario) do
  begin
    if not (binario[i] in ['0', '1']) then
    begin
      IsValidBinario := False;
      Exit;
    end;
  end;
  IsValidBinario := True;
end;

var
  opcao: Integer;
  decimal: Cardinal;
  binario: string;

begin
  repeat
    Writeln('===========================');
    Writeln(' CONVERSOR DECIMAL-BINARIO ');
    Writeln('===========================');
    Writeln;
    Writeln('1 - Converter decimal para binario');
    Writeln('2 - Converter binario para decimal');
    Writeln('0 - Sair');
    Writeln;
    Write('Digite a opcao desejada: ');
    Readln(opcao);
    case opcao of
      1:
      begin
        WriteLn;
        Write('Digite um numero decimal (ate ', LimiteMaximoDecimal, '): ');
        Readln(decimal);
        if decimal > LimiteMaximoDecimal then
          Writeln('Valor decimal fora do limite permitido.')
        else
          Writeln('Valor em binario: ', DecimalParaBinario(decimal));
      end;
      2:
      begin
        WriteLn;
        Write('Digite um numero binario (ate ', LimiteMaximoBinario, '): ');
        Readln(binario);
        if not IsValidBinario(binario) then
          Writeln('Valor binario invalido.')
        else if Length(binario) > Length(LimiteMaximoBinario) then
          Writeln('Valor binario fora do limite permitido.')
        else
          Writeln('Valor em decimal: ', BinarioParaDecimal(binario));
      end;
    end;
    Writeln;
  until opcao = 0;
end.
