{4.2 (á)}
var n,a:integer; x:real;
begin
readln(n);
x:=0;
for a:=1 to n do x:=x+1/sqr((2*a+1));
writeln('S = ',x);
end.                                            