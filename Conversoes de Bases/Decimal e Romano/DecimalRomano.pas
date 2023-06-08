program ConversorRomano;

uses
  SysUtils;

const
  AlgarismosRomanos: array[1..13] of string = ('I', 'IV', 'V', 'IX', 'X', 'XL', 'L', 'XC', 'C', 'CD', 'D', 'CM', 'M');
  ValoresDecimais: array[1..13] of Cardinal = (1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000);
  LimiteMaximoDecimal: Cardinal = 3999;
  LimiteMaximoRomano: string = 'MMMCMXCIX';

function DecimalParaRomano(decimal: Cardinal): string;
var
  i: Integer;
  romano: string;
begin
  romano := '';
  i := 13;
  while decimal > 0 do
  begin
    if decimal >= ValoresDecimais[i] then
    begin
      romano := romano + AlgarismosRomanos[i];
      decimal := decimal - ValoresDecimais[i];
    end
    else
      i := i - 1;
  end;
  DecimalParaRomano := romano;
end;

function RomanoParaDecimal(romano: string): Cardinal;
var
  i, valorAtual, valorAnterior, resultado: Cardinal;
  valorEncontrado: Boolean;
begin
  resultado := 0;
  valorAnterior := 0;
  valorEncontrado := False;
  romano := UpperCase(romano); 
  for i := Length(romano) downto 1 do
  begin
    valorEncontrado := False;
    for valorAtual := 1 to 13 do
    begin
      if romano[i] = AlgarismosRomanos[valorAtual] then
      begin
        valorEncontrado := True;
        if valorAtual < valorAnterior then
          resultado := resultado - ValoresDecimais[valorAtual]
        else
        begin
          resultado := resultado + ValoresDecimais[valorAtual];
          valorAnterior := valorAtual;
        end;
        Break;
      end;
    end;
    if not valorEncontrado then
    begin
      resultado := 0;
      Break;
    end;
  end;
  RomanoParaDecimal := resultado;
end;

var
  opcao: Integer;
  decimal: Cardinal;
  romano: string;

begin
  repeat
    Writeln('==========================');
    Writeln(' CONVERSOR DECIMAL-ROMANO ');
    Writeln('==========================');
    Writeln;
    Writeln('1 - Converter decimal para romano');
    Writeln('2 - Converter romano para decimal');
    Writeln('0 - Sair');
    Writeln;
    Write('Digite a opcao desejada: ');
    Readln(opcao);
    case opcao of
      1:
      begin
        Write('Digite um numero decimal (ate ', LimiteMaximoDecimal, '): ');
        Readln(decimal);
        if (decimal < 1) or (decimal > LimiteMaximoDecimal) then
          Writeln('Valor decimal fora do limite permitido.')
        else
          Writeln('Valor em algarismo romano: ', DecimalParaRomano(decimal));
      end;
      2:
      begin
        Write('Digite um numero romano (ate ', LimiteMaximoRomano, '): ');
        Readln(romano);
        romano := UpperCase(romano); // Converter para maiúsculas para facilitar a comparação
        if (Length(romano) = 0) or (RomanoParaDecimal(romano) = 0) then
          Writeln('Valor romano fora do limite permitido.')
        else
          Writeln('Valor em decimal: ', RomanoParaDecimal(romano));
      end;
    end;
    Writeln;
  until opcao = 0;
end.
