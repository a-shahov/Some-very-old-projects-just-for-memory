Type
 puck=function(x:real):real;
 
Function integral(a,b:real; n:integer; f:puck):real;
var
 k:integer;
 s,x:real;
begin 
 s:=0; x:=(b-a)/n;
 for k:=1 to n-1 do s:=s+f(a+k*x);
 s:=s+0.5*(f(a)+f(b));
 integral:=s*x
end;

Function f1(x:real):real;
begin
f1:=x/sqr(1+sqr(x))
end;

Function f2(x:real):real;
begin
f2:=4*sqr(cos(x))
end;
 
Function f3(x:real):real;
begin
f3:=1/sqr(cos(x))
end;

Function f4(x:real):real;
begin
f4:=(1+x)/sqrt(x)
end;

var
 a1,a2,a3,a4,b1,b2,b3,b4:real;
 n:integer;

begin
writeln('¬ведите пределы интегрировани€ дл€ 4-х интегралов');
readln(a1,b1,a2,b2,a3,b3,a4,b4);
writeln('¬ведите N');
readln(n);
writeln(integral(a1,b1,n,f1));
writeln(integral(a2,b2,n,f2));
writeln(integral(a3,b3,n,f3));
writeln(integral(a4,b4,n,f4));
end.