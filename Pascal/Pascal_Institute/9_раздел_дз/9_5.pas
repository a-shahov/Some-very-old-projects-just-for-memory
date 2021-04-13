type 
  vector=array[1..3] of real;
Function sk(a,b:vector):real;
var
  k:integer;
  c:real;
begin
  c:=0;
  for k:=1 to 3 do c:=c+a[k]*b[k];
  sk:=c
end;
Function dl(a,b:vector):real;
var 
  k:integer;
  s,s1:real;
begin
  s:=0; s1:=0;
  for k:=1 to 3 do begin s:=s+sqr(a[k]); s1:=s1+sqr(b[k]) end;
  dl:=sqrt(s1*s)
end;
function ygol(a,b:vector):real;
var
  co,si:real;
begin
co:=cos(sk(a,b)/dl(a,b)); si:=sqrt(1-sqr(co)); ygol:=arctan(si/co)
end;
var
  n:integer;
  a,b:vector;
begin randomize;
  for n:=1 to 3 do begin a[n]:=random(100); b[n]:=random(100); writeln(a[n],' ',b[n]) end;
  writeln(ygol(a,b));
end.

