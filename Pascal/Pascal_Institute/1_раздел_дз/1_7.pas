{1.7}
var x,a1,a2,a3,a4:integer;
begin
readln(x);
a1:=x div 1000;
a2:=(x mod 1000) div 100;
a3:=((x mod 1000) mod 100) div 10;
a4:=((x mod 1000) mod 100) mod 10;
writeln('S=',a1+a2+a3+a4);
writeln('Произведение = ',a1*a2*a3*a4);
writeln(a4,a3,a2,a1)
end.

