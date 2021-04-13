var x,i:real;
var y:char;
begin
readln(x);
readln(y);
readln(i);
case y of
'+': writeln(x,y,i,'=',x+i);
'*': writeln(x,y,i,'=',x*i);
'/': if i=0 then writeln('На ноль делить нельзя')
            else writeln(x,y,i,'=',x/i);
'-':writeln(x,y,i,'=',x-i);
'^':if x<0 then writeln('Вы возвoдите в сtепень отрицательное число')
           else writeln(x,y,i,'=',exp(i*ln(x)));
end;
end.