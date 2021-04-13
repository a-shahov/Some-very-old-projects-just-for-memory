var a,b,c,e:real;
begin
e:=0.0001;
c:=3;
b:=-1;
a:=1;
while abs(1/c)>=e do begin a:=a+b*(1/c); c:=c+2; b:=-b; end;
writeln('S = ',a);
end.