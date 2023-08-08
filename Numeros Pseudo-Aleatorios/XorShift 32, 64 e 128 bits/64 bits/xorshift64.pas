{
 PRNG .......: XorShift (64 bits)
 Ano ........: 2003
 Autor ......: George Marsaglia
}

program XorShift64;

{$mode objfpc}

uses
  SysUtils;

type
  xorShift64State = record
    seed: UInt64;
  end;

function xorShift64(var state: xorShift64State): UInt64;
begin
  state.seed := state.seed xor (state.seed shl 13);
  state.seed := state.seed xor (state.seed shr 7);
  state.seed := state.seed xor (state.seed shl 17);
  xorShift64 := state.seed and UInt64($7FFFFFFFFFFFFFFF);
end;

var
  Xn1, Xn2: xorShift64State;
  i: Integer;
begin
  Xn1.seed := 1234;
  Xn2.seed := UInt64(Trunc(Now * 24 * 60 * 60));

  WriteLn('GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)');
  WriteLn('PSEUDORANDOM NUMBER GENERATOR (PRNG)');
  WriteLn('PADRAO: XorShift (64 bits)');
  WriteLn('=================================================');
  WriteLn;
  WriteLn('   Semente: 1234          Semente: TIME');
  WriteLn('   --------------------   --------------------');

  for i := 1 to 10 do
    WriteLn(Format('%23d%23d', [Int64(xorShift64(Xn1)), Int64(xorShift64(Xn2))]));

  ReadLn;
end.
