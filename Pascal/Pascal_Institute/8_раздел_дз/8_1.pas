function fuck(x:integer):real;
var n:integer; 
    s:real;
begin s:=1; if x<0 then halt
                   else for n:=1 to x do s:=s*n; fuck:=s end;
var x:integer;
begin
readln(x);
writeln(fuck(x));
end.