Function st(a,b:real):real; {a в степени b}
begin if a<=0 then exit
              else st:=exp(b*ln(a)) end;
var x,y:real;
begin
writeln('Введите число x и степень y в которую надо возвести число');
readln(x,y);
writeln(st(x,y));
end.
          