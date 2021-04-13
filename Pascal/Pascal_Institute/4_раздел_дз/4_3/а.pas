{4.3 (à)}
var x,a,b,h,Xk,s,d:real; k,n:integer;
begin
n:=100;
a:=-1;
b:=2;
h:=(b-a)/n;
x:=0;
for k:=1 to n-1 do begin Xk:=a+k*h; x:=x+Xk/-sqr(sqr(Xk)+1) end;
s:=a/-sqr(sqr(a)+1);
d:=b/-sqr(sqr(b)+1);
writeln('S = ',(x+0.5*(s+d))*h);
end.