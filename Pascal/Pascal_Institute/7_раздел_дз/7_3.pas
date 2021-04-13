var s,s1,s2,s3:string; n,x,t,k:integer; m:array[byte] of integer;
begin
k:=1;
readln(s);
x:=length(s);
for n:=1 to x do begin s1:=s1+inttostr(ord(s[n])); m[n]:=length(inttostr(ord(s[n]))) end;
writeln(s1);
for n:=1 to x do begin for t:=1 to m[n] do begin s2:=s2+s1[k]; inc(k) end;
                       s3:=s3+chr(strtoint(s2)); 
                       s2:='' end;
writeln(s3);
end.