type vector=array[1..3] of real;
procedure ttt(a,b:vector; var c:vector);
var k:integer;
begin for k:=1 to 3 do begin c[k]:=a[k]+b[k]; writeln(c[k]) end; end;
var a,b,c:vector;
    n:integer; 
begin randomize;
for n:=1 to 3 do begin a[n]:=random(100); b[n]:=random(100); writeln(a[n],' ',b[n]) end;
ttt(a,b,c);
end.