var x,k,s,n,a,b,f:real;
const c=0.001;
begin
readln(x);
n:=1;
f:=-1;
k:=1;
a:=1;
b:=2;
s:=1;
{(2k)! = n}
repeat
begin n:=n*a*b; a:=1+2*k; b:=2+2*k; 
if not (abs(f*exp(2*k*ln(x)))/n<c) then begin s:=s+(f*exp(2*k*ln(x)))/n; f:=-f; k:=k+1 end; end;
until abs(f*exp(2*k*ln(x)))/n<c;
writeln('cos(',x,') = ',s);
end.