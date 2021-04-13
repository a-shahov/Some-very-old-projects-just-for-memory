{4.3 (á)}
var x,a,b,h,Xk,s,d:real; k,n:integer;
begin
n:=100;
a:=0;
b:=0.5;
h:=(b-a)/n;
x:=0;
for k:=1 to n-1 do begin Xk:=a+k*h; x:=x+sqr(2*cos(Xk)) end;
s:=sqr(2*cos(a));
d:=sqr(2*cos(b));
writeln('S = ',(x+0.5*(s+d))*h);
end.