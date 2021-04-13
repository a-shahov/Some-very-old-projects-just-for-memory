Function fak(n:integer):real;
var i:integer;
    s:real;
begin 
  s:=1;
  for i:=1 to n do s:=s*i;
  fak:=s 
end;

const
 r='C:/Users/Андрей/Desktop/new.txt';
var
 f:text;
 n:integer;
 
begin
assign(f,r);
rewrite(f);
for n:=2 to 10 do write(f,fak(n),' ');
close(f);
end.