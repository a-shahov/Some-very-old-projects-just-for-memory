var s1,s2,s3,s4,s5:string; n,x,t:integer; 
begin 
readln(s1);
x:=length(s1);
for n:=1 to x do s2:=s2+inttostr(ord(s1[n]));
for n:=1 to x do s3:=s3+inttostr(ord(s1[n]))+' '; 
t:=length(s3);
for n:=1 to t do
case s3[n] of
' ': begin s5:=s5+chr(strtoint(s4)); s4:=' ' end;
else 
s4:=s4+s3[n];
end;
writeln(s2);
writeln(s5);
end.