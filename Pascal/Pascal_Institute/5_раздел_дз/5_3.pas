var f,f1,f2:real; n,k:integer; p:boolean;
begin
readln(n);
if n<=0 then begin writeln('N не положительное нуля!'); exit end;
f1:=1; f2:=1; k:=2; p:=true;
while p do
if f2<=n then begin f:=f2; f2:=f1+f2; f1:=f2; inc(k) end
         else begin writeln('Число Фибоначчи под номером ',k,' F = ',f2,' которое больше ',N); exit end;
end.