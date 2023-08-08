{
 PRNG .......: XorShift (128 bits)
 Ano ........: 2003
 Autor ......: George Marsaglia
}

program XorShift128;

uses
  SysUtils, DateUtils;

type
  xorShift128State = record
    seed: UInt64;
  end;

function xorshift128(var state: xorShift128State): UInt64;
var
  random: UInt64;
begin
  random := state.seed;
  random := random xor (random shl 11);
  random := random xor (random shr 8);
  random := random xor (random shl 19);
  state.seed := random;
  xorshift128 := random;
end;

var
  Xn1, Xn2: xorShift128State;
  i: Integer;
  
begin

  Xn1.seed := 1234;
  Xn2.seed := UInt64(DateTimeToUnix(Now));

  WriteLn('GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)');
  WriteLn('PSEUDORANDOM NUMBER GENERATOR (PRNG)');
  WriteLn('PADRAO: XorShift (128 bits)');
  WriteLn('=================================================');
  WriteLn;
  WriteLn('   Semente: 1234          Semente: TIME');
  WriteLn('   --------------------   --------------------');

  for i := 1 to 10 do
    WriteLn(Format('%23u%23u', [xorshift128(Xn1), xorshift128(Xn2)]));
    
end.
