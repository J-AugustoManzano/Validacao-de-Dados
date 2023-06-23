{ 
 PRNG .......: RANDU
 Ano ........: Decada de 1960
 Autor ......: IBM
}

program RANDU;

uses
  SysUtils, DateUtils;

function RANDU(var seed: Int64): Int64;
begin
  seed := (65539 * seed) mod 2147483648;
  RANDU := seed;
end;

var
  Xn1, Xn2: Int64;
  i: Integer;

begin

  Xn1 := 1234;
  Xn2 := LongWord(DateTimeToUnix(Now));

  writeln('GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)');
  writeln('PSEUDORANDOM NUMBER GENERATOR (PRNG)');
  writeln('PADRAO: RANDU');
  writeln('==========================================');
  writeln;
  writeln('    Semente: 1234        Semente: TIME');
  writeln('    -------------        -------------');
  
  for i := 1 to 10 do
    writeln(RANDU(Xn1):17, '        ', RANDU(Xn2):13);

end.
