{ 
 PRNG .......: Linear Congruential
 Ano ........: 1965
 Autor ......: W. E. Thomson
}

program Linear_Congruential;

uses
  SysUtils, DateUtils;
  
function LinearCongruential(var seed: Int64): Double;
const
  M = 2147483647;
begin
  seed := (1664525 * seed + 1013904223) mod M;
  LinearCongruential := seed / M;
end;

var
  Xn1, Xn2: Int64;
  i: Integer;

begin

  Xn1 := 1234; 
  Xn2 := LongWord(DateTimeToUnix(Now)); 

  writeln('GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)');
  writeln('PSEUDORANDOM NUMBER GENERATOR (PRNG)');
  writeln('PADRAO: Linear Congruential');
  writeln('==========================================');
  writeln;
  writeln('    Semente: 1234        Semente: TIME');
  writeln('    -------------        -------------');

  for i := 1 to 10 do
    writeln(LinearCongruential(Xn1):17:11, '        ', LinearCongruential(Xn2):13:11);
    
end.
