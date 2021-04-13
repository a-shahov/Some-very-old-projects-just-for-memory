Function Fb(n:integer):integer;
var a,b,t,k:integer;
begin a:=1; b:=1;
if n<1 then exit
       else for k:=1 to n-1 do begin writeln(a); t:=b; b:=a+b; a:=t end; fb:=a end;
var n:integer;
begin
readln(n);
writeln(fb(n));
end.