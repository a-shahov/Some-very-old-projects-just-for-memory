var x,y:real;
var a:boolean;
begin
readln(x,y);
a:=(25>=(sqr(x)+sqr(y)));
if a then writeln('Принадлежит')
     else writeln('Не принадлежит');
end.