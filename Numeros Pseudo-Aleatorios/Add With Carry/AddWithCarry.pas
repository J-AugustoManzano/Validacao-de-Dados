{ 
 PRNG .......: Add With Carry (AWC)
 Ano ........: 1991
 Autor ......: George Marsaglia
}

program AddWithCarry;

uses
  SysUtils, DateUtils;

var
  Xn1, Xn2: LongWord;

function AWCNextRandom(var Xn: LongWord): LongWord;
begin
  Xn := (Xn + 12345) mod 4294967296;
  AWCNextRandom := Xn;
end;

procedure AWCInitialize(seed: LongWord; var Xn: LongWord);
begin
  Xn := seed;
end;

var
  i: Integer;
  seed1, seed2: LongWord;
  
begin

  writeln('GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)');
  writeln('PSEUDORANDOM NUMBER GENERATOR (PRNG)');
  writeln('PADRAO: Add With Carry');
  writeln('==========================================');
  writeln;
  writeln('    Semente: 1234        Semente: TIME');
  writeln('    -------------        -------------');

  seed1 := 1234;
  AWCInitialize(seed1, Xn1);

  seed2 := LongWord(DateTimeToUnix(Now));
  AWCInitialize(seed2, Xn2);

  for i := 1 to 10 do
    writeln(AWCNextRandom(Xn1):17, '        ', AWCNextRandom(Xn2):13);
    
end.
