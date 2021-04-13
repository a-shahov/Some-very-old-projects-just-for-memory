var m,m1,max,min,z:array[1..10] of integer;
x,y,i,p,t,xe,x1,k1,x2,k2:integer;
begin 
y:=0; i:=0; p:=1; x1:=1; k1:=0; x2:=1; k2:=0;
Randomize;
for x:=1 to 10 do m[x]:=random(21);
for x:=1 to 10 do 
if (x mod 5)=0 then writeln(m[x])
               else write(m[x],' ');
for x:=1 to 10 do y:=y+m[x];
writeln('Cумма всех элементов = ',y);
write('Четные: ');
for x:=1 to 10 do
if (m[x] mod 2)=0 then write(m[x],' ')
                  else continue;
for x:=1 to 9 do
i:=i+m[x]*m[x+1];
writeln(' '); writeln('Cумма произведений всех смежных элементов = ',i);
write('Задание Д: ');
for x:=1 to 10 do begin p:=p*m[x]; write(p,' ') end;
m1:=m;
for xe:=1 to 9 do
for x:=1 to 9 do if m1[x]>m1[x+1] then begin t:=m1[x]; m1[x]:=m1[x+1]; m1[x+1]:=t end 
                                  else continue;
for x:=1 to 10 do 
if m[x]=m1[1] then begin min[x1]:=x; x1:=x1+1; k1:=k1+1 end
              else continue;
for x:=1 to 10 do
if m[x]=m1[10] then begin max[x2]:=x; x2:=x2+1; k2:=k2+1 end
               else continue;
writeln(' '); write('max = ',m1[10],'  N: '); for x:=1 to k2 do write(max[x],' ');
writeln(' '); write('min = ',m1[1],'  N: '); for x:=1 to k1 do write(min[x],' ');
for x:=1 to 10 do z[x]:=random(21);
writeln(' '); for x:=1 to 10 do 
if (x mod 5)=0 then writeln(z[x])
               else write(z[x],' '); writeln('Поэлементная сумма массивов z и m:');
for x:=1 to 10 do 
if (x mod 5)=0 then writeln(m[x]+z[x])
               else write(m[x]+z[x],' ');
end.