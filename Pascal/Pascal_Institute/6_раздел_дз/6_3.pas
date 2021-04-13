var m,m1,m2:array[1..10] of integer;
n,q,t:integer;
begin
for n:=1 to 10 do m[n]:=1+random(100);
for n:=1 to 10 do 
if (n mod 5)=0 then writeln(m[n])
               else write(m[n],' ');
m1:=m;
for n:=1 to 9 do  
for q:=n+1 to 10 do if m1[n]>m1[q] then begin t:=m1[n]; m1[n]:=m1[q]; m1[q]:=t end
                                   else continue; writeln('');
for n:=1 to 10 do 
if (n mod 5)=0 then writeln(m1[n])
               else write(m1[n],' ');
m2:=m;
for q:=1 to 9 do
for n:=1 to 9 do if m2[n]>m2[n+1] then begin t:=m2[n]; m2[n]:=m2[n+1]; m2[n+1]:=t end 
                                  else continue; writeln('');
for n:=1 to 10 do 
if (n mod 5)=0 then writeln(m2[n])
               else write(m2[n],' ');
end.


