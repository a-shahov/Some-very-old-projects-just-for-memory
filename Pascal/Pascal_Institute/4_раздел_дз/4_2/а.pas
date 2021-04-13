{4.2 (a)}
var n,a:integer; x:real;
begin
readln(n);
x:=0;
for a:=1 to n do x:=x+exp(-1*ln(exp(5*ln(a))));
writeln('S = ',x);
end.