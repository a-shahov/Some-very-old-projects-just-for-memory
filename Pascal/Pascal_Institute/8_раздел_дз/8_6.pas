Function F(x:real):real;
begin 
if abs(x)<=1 then f:=1
             else if (abs(x)>1)and(abs(x)<=2) 
                  then f:=0
                  else if (abs(x)>2)and(abs(x)<=10)
                       then f:=2*x
                       else f:=sqr(x) end;
var x:real;
begin
readln(x);
writeln(f(x));
end.
                                                                                