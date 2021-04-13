type vector=array[1..3] of real;
procedure ygol(a,b:vector; var f:real);
var k:integer;
    s,s1,c,co,si:real;
begin
s:=0; s1:=0; c:=0;
for k:=1 to 3 do begin s:=s+sqr(a[k]); s1:=s1+sqr(b[k]) end;
for k:=1 to 3 do c:=c+a[k]*b[k];
co:=c/(sqrt(s)*sqrt(s1)); si:=sqrt(1-sqr(co));
f:=arctan(si/co) 
end;
var a,b:vector;
    n:integer;
    f:real;
begin randomize;
for n:=1 to 3 do begin a[n]:=random(100); b[n]:=random(100); writeln(a[n],' ',b[n]) end;
ygol(a,b,f);
writeln('”гол между векторами ',f);
end.
