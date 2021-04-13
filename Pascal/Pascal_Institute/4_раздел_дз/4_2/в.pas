{4.2 (â)}
var n,a:integer; z,x:real;
begin
readln(n);
x:=0;
z:=-1;
for a:=1 to n do begin x:=x+z*(1/(2*a+1)); z:=-z end;
writeln('S = ',x);
end.