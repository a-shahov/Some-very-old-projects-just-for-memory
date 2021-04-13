program metod_Simpsona;

Function f(x:extended):extended;

 begin
  f:=1/(1+sqr(x)); //Подынтегральная функция
 end;

const
  a=0; b=1; //Границы

Var
  n,k,n2:integer;
  x,h,h2,s,s2,er:extended;

begin
 n:=4;
 n2:=2*n;
 h:=(b-a)/n;
 h2:=(b-a)/n2;
 s:=(f(a)+f(b))*h/3;
 s2:=(f(a)+f(b))*h2/3;

 for k:=1 to n2-1 do
  begin
    if odd(k) then
     begin
       x:=a+k*h2;
       s2:=s2+4*f(x)*h2/3;
     end
              else
     begin
       x:=a+k*h2;
       s2:=s2+2*f(x)*h2/3;
     end;
  end;

 for k:=1 to n-1 do
  begin
    if odd(k) then
     begin
       x:=a+k*h;
       s:=s+4*f(x)*h/3;
     end
              else
     begin
       x:=a+k*h;
       s:=s+2*f(x)*h/3;
     end;
  end;

 er:=abs(s-s2)/15;
 writeln('I= ',s2);
 writeln('error= ',er);
 readln;
end.

