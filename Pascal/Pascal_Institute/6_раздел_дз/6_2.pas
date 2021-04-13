var x,xa,xb:array[1..20] of real;
n:integer;
begin
Randomize;
for n:=1 to 20 do x[n]:=random(50)+random;
for n:=1 to 20 do 
if (n mod 5)=0 then writeln(x[n])
               else write(x[n],' ');
xa[1]:=x[1]; xa[20]:=x[20];
for n:=2 to 19 do xa[n]:=(x[n-1]+x[n]+x[n+1])/3; writeln(' ');
for n:=1 to 20 do 
if (n mod 5)=0 then writeln(xa[n])
               else write(xa[n],' ');
xb[19]:=xa[1]; xb[20]:=xa[2];
for n:=1 to 18 do xb[n]:=xa[n+2]; writeln(' ');
for n:=1 to 20 do 
if (n mod 5)=0 then writeln(xb[n])
               else write(xb[n],' '); writeln(' ');
for n:=1 to 20 do 
if (n mod 5)=0 then writeln(xa[n]-xb[n])
               else write(xa[n]-xb[n],' ');
               end.