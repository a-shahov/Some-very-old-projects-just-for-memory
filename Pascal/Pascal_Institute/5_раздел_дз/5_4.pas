var s,f,f1,f2:real;
begin
s:=2;
f:=0;
f1:=1;
f2:=1;
while f<=1000 do begin s:=s+f; f:=f1+f2; f1:=f2; f2:=f end;
writeln('S = ',s);
end.