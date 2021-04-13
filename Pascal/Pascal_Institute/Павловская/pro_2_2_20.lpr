program pro_2_2_20;

var x,y:real;

begin
  writeln('xy!!!');
  readln(x,y);

  if x<=0 then begin writeln('NO'); readln; halt end;

  if y>0 then
  if ((sqr(x-2)-3-x)<0) and (y<x) then writeln('yes')
                                else writeln('NO')
         else
  if (sqr(x-2)-3+x<0) and (-y>x) then writeln('yes')
                               else writeln('NO');
  readln;
end.

