var x,y:real;
var a,b,c,d,f,e,g:boolean;
begin
readln(x,y);
a:=(x>0)and(y>0);
b:=(x<0)and(y>0);
c:=(x<0)and(y<0);
d:=(x>0)and(y<0);
f:=(x=0)and(y=0);
e:=(x=0)and(y<>0);
{g:=(x<>0)and(y=0);}
if a then writeln('Точка принадлежит 1 квадранту')
     else if b then writeln('Точка принадлежит 2 квадранту')
               else if c then writeln('Точка принадлежит 3 квадранту')
                         else if d then writeln('Точка принадлежит 4 квадранту')
                                   else if f then writeln('Точка принадлежит началу координат')
                                             else if e then writeln('Точка лежит на оси 0Y')
                                                       else writeln('Точка лежит на оси 0X');
end.
                                
               