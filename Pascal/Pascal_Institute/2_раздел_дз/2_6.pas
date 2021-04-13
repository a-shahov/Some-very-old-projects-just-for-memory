var x:integer;
var a:boolean;
begin
readln(x);
a:=(x mod 2 = 0)and(x mod 3 = 0)and(x mod 5 = 0);
if a then writeln('Делится')
     else writeln('Не делится');
end.    