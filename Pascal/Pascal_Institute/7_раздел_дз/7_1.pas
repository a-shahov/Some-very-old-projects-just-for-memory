var s1,s2:string; n,x:integer;
begin
readln(s1);
x:=length(s1);
for n:=x downto 1 do s2:=s2+s1[n];
writeln(s2);
end.