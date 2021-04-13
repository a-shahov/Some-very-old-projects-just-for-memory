var s1:string; n,y,m:integer; t:char;
begin
readln(s1);
y:=length(s1);
for m:=1 to 2 do begin
for n:=1 to y-1 do if odd(n) then begin t:=s1[n]; s1[n]:=s1[n+1]; s1[n+1]:=t end
                             ELSE continue;
writeln(s1) end;
end.