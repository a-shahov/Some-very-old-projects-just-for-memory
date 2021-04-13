var x:real; 
const q=0.00001;
begin
x:=0.999999;
while x>=-0.999999 do begin x:=x-0.000001; 
                            if abs(cos(x)-4*x)>q then continue
                                                 else writeln('X = ',x)
                      end;
end.