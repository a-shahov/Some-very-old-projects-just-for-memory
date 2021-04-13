var x:real;
var a:boolean;
begin
readln(x);
a:=x>2;
if a then writeln('y = ',exp(-1*ln(sqrt(x-2))))
     else writeln('y = ',sqrt(2-x));
end.