{В ЗАДАНИИ Г ОШИБКА НАДО ВВОДИТЬ 3.333333 ВМЕСТО 2,0005}
Type
 puck=function(x:real):real;

Function area(a,b,min,max:real; n:integer; f:puck):real;
var
 m:array[word, 1..2] of real; {[строка, столбец]}
 i,j,k,n1:integer;
 qua:boolean;
begin
 for i:=1 to 2 do
  begin
   j:=1;
   while j<=n do
    begin
     qua:=true;
     if i=1 then m[j,i]:=a+random*abs(b-a) 
            else m[j,i]:=min+random*abs(max-min); 
     for k:=1 to j-1 do if m[k,i]=m[j,i]
      then begin qua:=false; break end
      else continue;
     if qua then inc(j);
    end;
   end;
 i:=1; n1:=0;
 for j:=1 to n do if m[j,i+1]<=abs(f(m[j,i])) then inc(n1)
                                              else continue;
 area:=abs(b-a)*abs(max-min)*(n1/n);
end;

Function f2(x:real):real;
 begin
  f2:=4*sqr(cos(x))
 end;
 
Function f3(x:real):real;
 begin
  f3:=1/sqr(cos(x))
 end;

Function f4(x:real):real;
 begin
  f4:=(1+x)/sqrt(x)
 end;

var 
 a,b,min,max:real;
 n,y:integer;

begin
randomize;
writeln('Введите номер интеграла, который хотите посчитать (от 2 до 4)');
readln(y);
writeln('Введите пределы интегрирования, минимальное и максимальное значения');
readln(a,b,min,max);
writeln('Введите количество генерируемых точек N');
readln(n);
case y of
2:writeln('Интеграл = ',area(a,b,min,max,n,f2));
3:writeln('Интеграл = ',area(a,b,min,max,n,f3));
4:writeln('Интеграл = ',area(a,b,min,max,n,f4));
end;
end.