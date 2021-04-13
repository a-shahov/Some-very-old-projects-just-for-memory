var x:real; 
const q=0.0001;
begin
x:=1;
while abs(cos(x)-4*x)>=q do x:=0.25*cos(x); 
writeln(x);
end.
