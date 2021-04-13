var x,y,a,b,s,n,q:real;
const e=0.001;
begin
readln(a,b);
q:=1;
x:=a;
y:=b;
repeat
begin if abs(x-y)<e then begin writeln('X = ',x,'   n = ',q); break end;
s:=0.5*(x+y); n:=sqrt(x*y); x:=s; y:=n; q:=q+1; 
if abs(x-y)<e then writeln('X = ',x,'   n = ',q) end;
until abs(x-y)<e;
end.