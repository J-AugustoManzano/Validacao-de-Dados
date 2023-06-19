{*
 * PRNG .......: Wichmann Hill
 * Ano ........: 1982
 * Autor ......: Brian A. Wichmann & David H. Hill
 *}
 
program WichmannHill;

uses
  SysUtils, DateUtils;

function WichmannHill(var X: Integer): Double;
begin
  X := (171 * X) mod 30269;
  WichmannHill := abs(X / 30269.0);
end;

var
  i: Integer;
  Xn1: array[1..10] of Double;
  Xn2: array[1..10] of Double;
  X1, X2: Integer;

begin
  writeln('GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)');
  writeln('PSEUDORANDOM NUMBER GENERATOR (PRNG)');
  writeln('PADRAO: Wichmann Hill');
  writeln('==========================================');
  writeln;
  writeln('    Semente: 1234        Semente: TIME');
  writeln('    -------------        -------------');

  X1 := 1234;
  for i := 1 to 10 do
  begin
    Xn1[i] := WichmannHill(X1);
  end;

  X2 := UInt32(DateTimeToUnix(Now));
  for i := 1 to 10 do
  begin
    Xn2[i] := WichmannHill(X2);
  end;

  for i := 1 to 10 do
    writeln(Xn1[i]:17:11, '        ', Xn2[i]:13:11);

end.
