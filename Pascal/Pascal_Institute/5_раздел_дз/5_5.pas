var a,b,n,k:real;
begin
a:=0.001;
k:=1;
b:=0;
n:=1;
while (abs(n)/(2*k-1))>=a do begin b:=b+n/(2*k-1); n:=-n; k:=k+1 end;
writeln('Ï = ',4*b);
end.