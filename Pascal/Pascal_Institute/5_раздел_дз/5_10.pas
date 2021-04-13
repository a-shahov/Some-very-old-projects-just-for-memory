var n,a,b,x,i,y,r,o:integer;
begin
writeln('¬ведите начальное число "a" и количесвто элементов последовательности "n" с учетом "a".');
readln(a,n);
x:=0;
b:=1;
while (a div b)>0 do begin b:=b*10; x:=x+1 end;
y:=x;
o:=x;
r:=x;
write(a);
while n>(r-o+1) do 
if ((a+1) div b)>0 then begin y:=y+1; b:=b*10;  end
else begin
writeln(' '); for i:=1 to x do write(' '); write(a+1); x:=x+y; a:=a+1; r:=r+1 
     end;
end.

