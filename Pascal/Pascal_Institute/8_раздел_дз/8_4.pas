Function poly(x:real):real;
begin poly:=(sqr(sqr(x))*x+2.5*sqr(sqr(x))+cos(x)*x*sqr(x)-1.2*x)/(sqr(1+x+sqr(x))+1) end;
var x:real;
begin
readln(x);
writeln(poly(x));
end.
