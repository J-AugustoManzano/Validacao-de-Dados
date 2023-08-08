{ PRNG .......: XorShift (32 bits)
  Ano ........: 2003
  Autor ......: George Marsaglia 
}

program XorShift32PRNG;

uses
  SysUtils;

type
  xorShift32State = record
    seed: UInt32;
  end;

function xorShift32(var state: xorShift32State): UInt32;
var
  random: UInt32;
begin
  random := state.seed;
  random := random xor (random shl 13);
  random := random xor (random shr 17);
  random := random xor (random shl 5);
  state.seed := random;
  xorShift32 := state.seed;
end;

var
  Xn1, Xn2: xorShift32State;
  i: Integer;
  
begin

  Xn1.seed := 1234;
  Xn2.seed := UInt32(GetTickCount);

  Writeln('GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)');
  Writeln('PSEUDORANDOM NUMBER GENERATOR (PRNG)');
  Writeln('PADRAO: XorShift (32 bits)');
  Writeln('=============================================');
  Writeln;
  Writeln('      Semente: 1234       Semente: TIME');
  Writeln('      -------------       -------------');

  for i := 1 to 10 do
    Writeln(Format('%19u%20u', [xorShift32(Xn1), xorShift32(Xn2)]));

end.
