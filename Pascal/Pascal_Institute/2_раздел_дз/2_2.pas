var x,y,z,x1,y1,z1:boolean;
var a,b,c:integer;
begin
readln(a,b,c);
x:=(a>=b)and(a>=c);
y:=(b>=a)and(b>=c);
{z:=(c>=a)and(c>=b);}
x1:=(a<=b)and(a<=c);
y1:=(b<=a)and(b<=c);
{z1:=(c<=a)and(c<=b);}
if x then writeln('Наибольшее:',a)
      else if y then writeln('Наибольшее: ',b)
                else writeln('Наибольшее: ',c);
if x1 then writeln('Наименьшее:',a)
      else if y1 then writeln('Наименьшее: ',b)
                  else writeln('Наименьшее: ',c);
end.