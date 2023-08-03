{*
 * PRNG .......: Wichmann Hill
 * Ano ........: 1982
 * Autor ......: Brian A. Wichmann & David H. Hill
 *}
 
program WichmannHill;

uses
  SysUtils, DateUtils;

function WichmannHill(var X: Integer): Real;
var
  R: Real;
begin
  X := (171 * X) mod 30269;
  R := X / 30268.0;
  if R < 0.0 then
    R := R + 1.0;
  WichmannHill := R;
end;


var
  Xn1: array[1..10] of Real;
  Xn2: array[1..10] of Real;
  i, X1, X2: Integer;

begin
  writeln('GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)');
  writeln('PSEUDORANDOM NUMBER GENERATOR (PRNG)');
  writeln('PADRAO: Wichmann Hill');
  writeln('==========================================');
  writeln;
  writeln('    Semente: 1234        Semente: TIME');
  writeln('    -------------        -------------');

  X1 := 1234;
  X2 := UInt32(DateTimeToUnix(Now));
  
  for i := 1 to 10 do
  begin
    Xn1[i] := WichmannHill(X1);
    Xn2[i] := WichmannHill(X2);
    writeln(Xn1[i]:17:11, '        ', Xn2[i]:13:11);
  end;
end.
