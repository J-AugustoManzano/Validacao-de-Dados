{ 
 PRNG .......: Park-Miller
 Ano ........: 1988
 Autor ......: S. K. Park & K. W. Miller
}

program ParkMillerPRNG;

uses
  SysUtils, DateUtils;

function ParkMiller(var X: LongWord): LongWord;
begin
  X := (16807 * X) mod 2147483647;
  ParkMiller := X;
end;

var
  Xn1, Xn2: LongWord;
  i: Integer;
  
begin

  Xn1 := 1234; 
  Xn2 := LongWord(DateTimeToUnix(Now)); 

  writeln('GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)');
  writeln('PSEUDORANDOM NUMBER GENERATOR (PRNG)');
  writeln('PADRAO: Park-Miller');
  writeln('==========================================');
  writeln;
  writeln('    Semente: 1234        Semente: TIME');
  writeln('    -------------        -------------');

  for i := 1 to 10 do
    writeln(ParkMiller(Xn1):17, '        ', ParkMiller(Xn2):13);

end.
