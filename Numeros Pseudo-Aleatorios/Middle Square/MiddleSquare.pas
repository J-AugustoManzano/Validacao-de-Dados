{ 
 PRNG .......: Middle Square
 Ano ........: 1946
 Autor ......: John von Neumann
}

program Mean_Square;

uses
  SysUtils, DateUtils;
  
function MeanSquare(var seed: LongInt): LongInt;
begin
  seed := (seed * seed div 100) mod 10000;
  MeanSquare := seed;
end;

var
  Xn1, Xn2: LongInt;
  i: Integer;

begin

  Xn1 := 1234; 
  Xn2 := LongWord(DateTimeToUnix(Now)); 

  writeln('GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)');
  writeln('PSEUDORANDOM NUMBER GENERATOR (PRNG)');
  writeln('PADRAO: Middle Square');
  writeln('==========================================');
  writeln;
  writeln('    Semente: 1234        Semente: TIME');
  writeln('    -------------        -------------');

  for i := 1 to 10 do
    writeln(MeanSquare(Xn1):17, '        ', MeanSquare(Xn2):13);

end.
