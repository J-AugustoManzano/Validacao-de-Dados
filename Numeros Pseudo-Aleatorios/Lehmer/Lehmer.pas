program LehmerPRNG;

uses
  SysUtils, DateUtils;
  
function Lehmer(var seed: LongWord): LongWord;
begin
  seed := (16807 * seed) mod 2147483647;
  Lehmer := seed;
end;

var
  Xn1, Xn2: LongWord;
  i: Integer;

begin
  Xn1 := 1234; 
  Xn2 := LongWord(DateTimeToUnix(Now)); 

  writeln('GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)');
  writeln('PSEUDORANDOM NUMBER GENERATOR (PRNG)');
  writeln('PADRAO: Lehmer');
  writeln('==========================================');
  writeln;
  writeln('    Semente: 1234        Semente: TIME');
  writeln('    -------------        -------------');

  for i := 1 to 10 do
    writeln(Lehmer(Xn1):17, '        ', Lehmer(Xn2):13);

end.
