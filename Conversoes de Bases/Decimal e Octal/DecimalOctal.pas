program DecimalOctal;

uses
  SysUtils, Math;

const
  LimiteMaximoDecimal: Cardinal = 2147483647;
  LimiteMaximoOctal: Cardinal = 17777777777;

function DecimalParaOctal(decimal: Cardinal): Cardinal;
var
  resto: Cardinal;
  potencia: Cardinal;
  octal: Cardinal;
begin
  octal := 0;
  potencia := 1;
  while decimal > 0 do
  begin
    resto := decimal mod 8;
    octal := octal + resto * potencia;
    decimal := decimal div 8;
    potencia := potencia * 10;
  end;
  DecimalParaOctal := octal;
end;

function OctalParaDecimal(octal: Cardinal): Cardinal;
var
  potencia: Cardinal;
  digito: Cardinal;
  decimal: Cardinal;
begin
  decimal := 0;
  potencia := 0;
  while octal > 0 do
  begin
    digito := octal mod 10;
    decimal := decimal + digito * Trunc(Power(8, potencia));
    octal := octal div 10;
    potencia := potencia + 1;
  end;
  OctalParaDecimal := decimal;
end;

function IsValidOctal(octal: Cardinal): Boolean;
begin
  while octal > 0 do
  begin
    if (octal mod 10) > 7 then
    begin
      IsValidOctal := False;
      Exit;
    end;
    octal := octal div 10;
  end;
  IsValidOctal := True;
end;

var
  opcao: Integer;
  decimal: Cardinal;
  octal: Cardinal;

begin
  repeat
    Writeln('=========================');
    Writeln(' CONVERSOR DECIMAL-OCTAL ');
    Writeln('=========================');
    Writeln;
    Writeln('1 - Converter decimal para octal');
    Writeln('2 - Converter octal para decimal');
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
          Writeln('Valor em octal: ', DecimalParaOctal(decimal));
      end;
      2:
      begin
        WriteLn;
        Write('Digite um numero octal (ate ', LimiteMaximoOctal, '): ');
        Readln(octal);
        if not IsValidOctal(octal) then
          Writeln('Valor octal invalido.')
        else if octal > LimiteMaximoOctal then
          Writeln('Valor octal fora do limite permitido.')
        else
          Writeln('Valor em decimal: ', OctalParaDecimal(octal));
      end;
    end;
    Writeln;
  until opcao = 0;
end.
