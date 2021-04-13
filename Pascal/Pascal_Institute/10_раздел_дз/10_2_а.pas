Type
 puck=function(x:real):real;

Function area(a,b,min,max:real; n:integer; f:puck):real;
var
 m1:array[word, 1..2] of real; {[строка, столбец]}
 m:array[word, 1..2] of real; {[строка, столбец]}
 i,j,k,n1,n2:integer;
 qua:boolean;
begin
 for i:=1 to 2 do
  begin
   j:=1;
   while j<=n do
    begin
     qua:=true;
     if i=1 then m[j,i]:=random*abs(a)
            else m[j,i]:=random*abs(min);
     for k:=1 to j-1 do if m[k,i]=m[j,i]
      then begin qua:=false; break end
      else continue;
     if qua then inc(j);
    end;
   end;
 i:=1; n1:=0;
 for j:=1 to n do if m[j,i+1]<=abs(f(m[j,i])) then inc(n1)
                                              else continue;
 for i:=1 to 2 do
  begin
   j:=1;
   while j<=n do
    begin
     qua:=true;
     if i=1 then m1[j,i]:=random*abs(b) 
            else m1[j,i]:=random*abs(max); 
     for k:=1 to j-1 do if m1[k,i]=m1[j,i]
      then begin qua:=false; break end
      else continue;
     if qua then inc(j);
    end;
   end;
 i:=1; n2:=0;
 for j:=1 to n do if m1[j,i+1]<=abs(f(m1[j,i])) then inc(n2)
                                              else continue;
 area:=(abs(b)*abs(max)*(n2/n))-(abs(a)*abs(min)*(n1/n));
end;

Function f1(x:real):real;
 begin
  f1:=x/sqr(1+sqr(x))
 end;

var 
 a,b,min,max:real;
 n:integer;

begin
writeln('¬ведите пределы инегрировани€, минимальное и максимальное значени€');
readln(a,b,min,max);
writeln('¬ведите количество генерируемых точек N');
readln(n);
writeln('»нтеграл = ',area(a,b,min,max,n,f1));
end.