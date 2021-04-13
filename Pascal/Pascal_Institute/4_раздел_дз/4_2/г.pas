{4.2 (ã)}
var a,n:integer; x,z:real;
begin
readln(n);
x:=0;
z:=1;
for a:=1 to n do begin x:=x+z*(1/(a*(a+1))); z:=-z end;
writeln('S = ',x);
end.