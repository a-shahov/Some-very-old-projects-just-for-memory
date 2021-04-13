{4.3 (â)}
var x,a,b,h,Xk,s,d:real; k,n:integer;
begin
n:=100;
a:=0;
b:=pi/3;
h:=(b-a)/n;
x:=0;
for k:=1 to n-1 do begin Xk:=a+k*h; x:=x+exp(-1*ln(sqr(cos(Xk)))) end;
s:=exp(-1*ln(sqr(cos(a))));
d:=exp(-1*ln(sqr(cos(b))));
writeln('S = ',(x+0.5*(s+d))*h);
end.