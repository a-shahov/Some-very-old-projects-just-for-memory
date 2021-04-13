var a,b,c,D:real;
var q,w,e:boolean;
begin
readln(a,b,c);
q:=(a=0);
w:=(b=0);
D:=sqr(b)-4*a*c;
e:=(D>=0);
if q and w and (c=0) then begin writeln('X - любое'); exit end;
if q and w then writeln('Нет решений')
           else if q then writeln('x1 = ',-c/b)
                     else if w and e then
                                     begin
                                     writeln('x1 = ',sqrt(-c/a));
                                     writeln('x2 = ',-sqrt(-c/a));
                                     end
                                     else if e then 
                                               begin
                                               writeln('x1 = ',(-b+sqrt(D))/(2*a));
                                               writeln('x2 = ',(-b-sqrt(D))/(2*a));
                                               end
                                               else writeln('Нет решений');
end.                                               