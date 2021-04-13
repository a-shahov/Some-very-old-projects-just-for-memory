var a,x:real;
const q=0.00001;
begin
readln(a);
x:=a;
while abs(0.5*(x+a/x)-sqrt(a))>q do x:=0.5*(x+a/x);
writeln(a,'^0.5 = ',x);
end.

