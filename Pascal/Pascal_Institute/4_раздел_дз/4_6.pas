var c:real; b:integer;
begin
c:=100;
for b:=99 downto 0 do c:=1/c+b;
writeln('C = ',c);
end.
