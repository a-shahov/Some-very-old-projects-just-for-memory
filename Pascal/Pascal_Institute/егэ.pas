const
  N = 2017;

var
  a: array[1..N] of integer;
  i, m, k: integer;

begin
  randomize;
  for i := 1 to N do a[i] := random(10001); 
  k := 0;
  for i := 1 to N do  
    if ((a[i] div 16) < 16) and ((a[i] mod 16) > 9) then
    begin
      k := k + 1; 
      if (k mod 4) = 0 then writeln(a[i]:6)
      else write(a[i]:6)
    end;
  writeln;
  writeln('Количество = ', k)
end.



















