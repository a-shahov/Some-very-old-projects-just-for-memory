Function s(a,b,y:real):real;
begin s:=0.5*a*b*sin(y) end;
var a,b,y:real;
begin
readln(a,b,y);
writeln(s(a,b,y));
end.