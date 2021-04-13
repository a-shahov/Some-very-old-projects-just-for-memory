var s,e:real; n,a:integer;
begin
e:=1E-6;
s:=0;
a:=1;
n:=1;
while 1/sqr(n)>e do begin s:=s+a/sqr(n);
                          a:=-a;
                          n:=n+1 end;
writeln('S = ',sqrt(12*s));
end.
