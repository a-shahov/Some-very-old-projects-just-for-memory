var x:real; 
const q=0.00001;
begin
x:=0.999999;
while abs(cos(x)-4*x)>q do begin x:=x-0.000001;
if x<-0.999999 then break
               else if not(abs(cos(x)-4*x)>q) then writeln('X = ',x)
                                              else continue end;
end.