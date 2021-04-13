{1.2}
var a,b,c,d,e,f:real;
begin
a:=exp(1.5*ln(10))-exp(3*ln(9))+100;
writeln('a=',a);
b:=sqrt((1+cos(pi/6))/(3-5/2));
writeln('b=',b);
c:=sqrt(1+sqr(sqr(cos(pi/5))+sqr(sin(pi/3)))/2);
writeln('c=',c);
d:=sin(pi/3.5)/cos(pi/3.5)+sin(pi/7)*sqrt(abs(3-2*5))*ln(3);
writeln('d=',d);
e:=(1-exp(-cos(3)))/(1+sqr(sin(exp(4*ln(2.5)))));
writeln('e=',e);
f:=exp(16/3*ln(2))+ln(abs(cos(2)/sin(2)))/(1-exp(-4/5*ln(2)));
writeln('f=',f);
end.



