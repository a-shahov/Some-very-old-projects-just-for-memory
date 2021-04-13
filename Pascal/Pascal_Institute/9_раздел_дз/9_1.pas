procedure poly(a,b,c:real; var x1,x2:real);
var d:real;
    e:boolean;
begin 
D:=(sqr(b)-4*a*c);
e:=D<0;
      if (a=0)and(b=0)and(c=0) then begin writeln('x - любое'); halt end
 else if (a=0)and(b=0) then begin writeln('Уравнение не имеет решений'); halt end
 else if (a=0) then begin x1:=-c/b; x2:=-c/b end
 else if e then begin writeln('Решение уравнения лежит в области комплексных чисел'); halt end
 else begin x1:=(-b+sqrt(d))/(2*a); x2:=(-b-sqrt(d))/(2*a) end end;

var 
a,b,c,x1,x2:real;

begin
writeln('Введите коэффициенты квадратного уравнения a,b,c');
readln(a,b,c);
poly(a,b,c,x1,x2);
writeln('x1 = ',x1,' x2 = ',x2);
end.
