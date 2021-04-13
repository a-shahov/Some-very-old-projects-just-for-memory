Function poly(x:real):real;
begin poly:=sqr(sqr(x))*x+10*sqr(sqr(x))-3*sqr(x)+2*x*cos(2*x)+1 end;

const
 r='C:/Users/Андрей/Desktop/new1.txt';

var
 i,a,b:real;
 f:text;
 
begin
  assign(f,r);
  rewrite(f);
  i:=0;
  while i<=10 do begin writeln(f,i:4:1,poly(i):11:2); i:=i+0.1 end;
  close(f);
  reset(f);
  i:=0;
  while i<=10 do begin readln(f,a,b); writeln(a:4:1,b:11:2); i:=i+0.1 end;
end.
  