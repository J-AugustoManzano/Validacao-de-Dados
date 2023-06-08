program DecimalHexadecimal;

uses
  SysUtils, Math;

const
  LimiteMaximoDecimal: Cardinal = 2147483647;
  LimiteMaximoHexadecimal: string = '7FFFFFFF';

function DecimalParaHexadecimal(decimal: Cardinal): string;
var
  resto: Cardinal;
  hexadecimal: string;
begin
  hexadecimal := '';
  repeat
    resto := decimal mod 16;
    case resto of
      0..9:
        hexadecimal := Chr(resto + Ord('0')) + hexadecimal;
      10..15:
        hexadecimal := Chr(resto - 10 + Ord('A')) + hexadecimal;
    end;
    decimal := decimal div 16;
  until decimal = 0;
  DecimalParaHexadecimal := hexadecimal;
end;

function HexadecimalParaDecimal(hexadecimal: string): Cardinal;
var
  potencia: Cardinal;
  digito: Char;
  decimal: Cardinal;
begin
  decimal := 0;
  potencia := 0;
  while Length(hexadecimal) > 0 do
  begin
    digito := UpCase(hexadecimal[Length(hexadecimal)]);
    case digito of
      '0'..'9':
        decimal := decimal + (Ord(digito) - Ord('0')) * Trunc(Power(16, potencia));
      'A'..'F':
        decimal := decimal + (Ord(digito) - Ord('A') + 10) * Trunc(Power(16, potencia));
    end;
    Delete(hexadecimal, Length(hexadecimal), 1);
    potencia := potencia + 1;
  end;

  HexadecimalParaDecimal := decimal;
end;

function IsValidHexadecimal(hexadecimal: string): Boolean;
var
  i: Integer;
begin
  for i := 1 to Length(hexadecimal) do
  begin
    if not (UpCase(hexadecimal[i]) in ['0'..'9', 'A'..'F']) then
    begin
      IsValidHexadecimal := False;
      Exit;
    end;
  end;
  IsValidHexadecimal := True;
end;

var
  opcao: Integer;
  decimal: Cardinal;
  hexadecimal: string;

begin
  repeat
    Writeln('===============================');
    Writeln(' CONVERSOR DECIMAL-HEXADECIMAL ');
    Writeln('===============================');
    Writeln;
    Writeln('1 - Converter decimal para hexadecimal');
    Writeln('2 - Converter hexadecimal para decimal');
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
          Writeln('Valor em hexadecimal: ', DecimalParaHexadecimal(decimal));
      end;
      2:
      begin
        WriteLn;
        Write('Digite um numero hexadecimal (ate ', LimiteMaximoHexadecimal, '): ');
        Readln(hexadecimal);
        if not IsValidHexadecimal(hexadecimal) then
          Writeln('Valor hexadecimal invalido.')
        else if HexadecimalParaDecimal(hexadecimal) > LimiteMaximoDecimal then
          Writeln('Valor hexadecimal fora do limite permitido.')
        else
          Writeln('Valor em decimal: ', HexadecimalParaDecimal(hexadecimal));
      end;
    end;
    Writeln;
  until opcao = 0;
end.
