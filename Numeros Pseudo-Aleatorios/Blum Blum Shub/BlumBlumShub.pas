{ 
 PRNG .......: Blum-Blum-Shub
 Ano ........: 1986
 Autor ......: L. Blum, M. Blum & M. Shub
}

program BlumBlumShub;

uses
  SysUtils, DateUtils;
  
function BlumBlumShub(var X: LongWord): LongWord;
begin
  X := (X * X) mod 2467246241;
  BlumBlumShub := X;
end;

var
  Xn1: array[1..10] of LongWord;
  Xn2: array[1..10] of LongWord;
  X1, X2: LongWord;
  i: Integer;
  
begin

  writeln('GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)');
  writeln('PSEUDORANDOM NUMBER GENERATOR (PRNG)');
  writeln('PADRAO: Blum-Blum-Shub');
  writeln('==========================================');
  writeln;
  writeln('    Semente: 1234        Semente: TIME');
  writeln('    -------------        -------------');

  X1 := 1234;
  X2 := UInt32(DateTimeToUnix(Now));
  
  for i := 1 to 10 do
  begin
    Xn1[i] := BlumBlumShub(X1);
    Xn2[i] := BlumBlumShub(X2);
    writeln(Xn1[i]:17, '        ', Xn2[i]:13);
  end

end.
