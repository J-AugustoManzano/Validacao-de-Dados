(*
 PRNG .......: SplitMix64
 Ano ........: 2015
 Autor ......: Sebastiano Vigna
*)

// Fundamentado: rosettacode.org/wiki/Pseudo-random_numbers/Splitmix64

program SplitMix64PRNG;

uses
  SysUtils, DateUtils;

type
  SplitMix64 = record
    state: UInt64;
  end;

function SplitMix64Init(state: UInt64): SplitMix64;
begin
  SplitMix64Init.state := state;
end;

function nextInt(var sm64: SplitMix64): UInt64;
var
  z: UInt64;
begin
  sm64.state := sm64.state + $9e3779b97f4a7c15;
  z := sm64.state;
  z := (z xor (z shr 30)) * $bf58476d1ce4e5b9;
  z := (z xor (z shr 27)) * $94d049bb133111eb;
  nextInt := z xor (z shr 31);
end;

function nextFloat(var sm64: SplitMix64): Double;
begin
  nextFloat := Double(nextInt(sm64) shr 11) / (1 shl 53);
end;

var
  Xn1: SplitMix64;
  Xn2: SplitMix64;
  i: Integer;

begin

  Xn1 := SplitMix64Init(1234);
  Xn2 := SplitMix64Init(UInt64(DateTimeToUnix(Now)));

  WriteLn('GERADOR DE NUMEROS PSEUDO ALEATORIOS (GNA)');
  WriteLn('PSEUDORANDOM NUMBER GENERATOR (PRNG)');
  WriteLn('PADRAO: SplitMix64');
  WriteLn('========================================');
  WriteLn;

  WriteLn('  Semente: 1234 (int)        Semente: TIME (int)');
  WriteLn('  --------------------       --------------------');
  for i := 1 to 5 do
    WriteLn(Format('%22u%27u', [nextInt(Xn1), nextInt(Xn2)]));
  WriteLn;

  WriteLn('  Semente: 1234 (real)       Semente: TIME (real)');
  WriteLn('  --------------------       --------------------');
  for i := 1 to 5 do
    WriteLn(Format('%22.18f%27.18f', [nextFloat(Xn1), nextFloat(Xn2)]));

end.
