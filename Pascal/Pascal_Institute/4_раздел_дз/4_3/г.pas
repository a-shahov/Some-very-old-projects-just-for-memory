{4.3 (ã)}
var x,a,b,h,Xk,s,d:real; k,n:integer;
begin
n:=100;
a:=4;
b:=9;
h:=(b-a)/n;
x:=0;
for k:=1 to n-1 do begin Xk:=a+k*h; x:=x+(Xk+1)/sqrt(Xk)end;
s:=(a+1)/sqrt(a);
d:=(b+1)/sqrt(b);
writeln('S = ',(x+0.5*(s+d))*h);
end.